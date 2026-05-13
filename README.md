# aliyun-cli

Dockerized [Alibaba Cloud CLI](https://github.com/aliyun/aliyun-cli) running on Alpine Linux.

## Features

- Lightweight Alpine 3.20 base image
- Non-root user execution
- Built-in `jq` for JSON processing
- Health check enabled
- Automated Docker image builds via GitHub Actions (published to GHCR)

## Quick Start

```bash
# Pull from GitHub Container Registry
docker pull ghcr.io/adityahegde007/aliyun-cli:main

# Run interactively
docker run --rm -it ghcr.io/adityahegde007/aliyun-cli:main version

# Configure credentials (mount a volume for persistence)
docker run --rm -it -v aliyun-config:/app \
  ghcr.io/adityahegde007/aliyun-cli:main configure \
  --mode AK \
  --access-key-id <YOUR_ACCESS_KEY_ID> \
  --access-key-secret <YOUR_ACCESS_KEY_SECRET> \
  --region <REGION>
```

## Build Locally

```bash
docker build -t aliyun-cli .
docker run --rm aliyun-cli version
```

## License

[Apache License 2.0](LICENSE)
