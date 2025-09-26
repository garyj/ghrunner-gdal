# GitHub Actions Runner with GDAL

A minimal Docker image extending the official GitHub Actions runner with GDAL libraries.

## Features

- Based on `ghcr.io/actions/actions-runner:latest`
- GDAL/OGR command-line tools
- GDAL development libraries

## Quick Start

### Using in GitHub Actions

```yaml
name: GDAL Workflow

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    container:
      image: ghcr.io/garyj/ghrunner-gdal:latest

    steps:
      - uses: actions/checkout@v4

      - name: Verify GDAL
        run: |
          gdalinfo --version
          ogrinfo --version

      - name: Run your GDAL commands
        run: |
          # Your GDAL processing here
          gdalinfo your_file.tif
          ogr2ogr output.shp input.geojson
```

## Build

```bash
# Build locally
docker build -t ghrunner-gdal .

# Test GDAL installation
docker run --rm ghrunner-gdal gdalinfo --version
```

## Included Software

- `gdal-bin` - GDAL command-line utilities
- `libgdal-dev` - GDAL development libraries

## Environment Variables

- `GDAL_DATA=/usr/share/gdal`

## License

MIT License - see the [LICENSE](LICENSE) file for details.
