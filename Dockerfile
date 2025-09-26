# GitHub Actions Runner with GDAL support
FROM ghcr.io/actions/actions-runner:latest

# Switch to root to install GDAL
USER root

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install GDAL and dependencies
RUN apt-get update && apt-get install -y \
    binutils \
    gdal-bin \
    libgdal-dev \
    libproj-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set GDAL environment variables
ENV GDAL_DATA=/usr/share/gdal

# Verify GDAL installation
RUN gdalinfo --version && ogrinfo --version

# Switch back to runner user
USER runner

# Set working directory
WORKDIR /home/runner

# Label the image
LABEL org.opencontainers.image.source="https://github.com/garyj/ghrunner-gdal"
LABEL org.opencontainers.image.description="GitHub Actions runner with GDAL libraries"
LABEL org.opencontainers.image.licenses="MIT"
