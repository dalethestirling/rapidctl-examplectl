# AGENTS.md - examplectl Development Guide

## Project Overview
Reference CLI wrapper demonstrating rapidctl library usage. Consumes rapidctl-container (or compatible fork) to execute commands in containerized environments using Podman (default) or Docker.

## Version Alignment

### Baseline Version Strategy
- **Default**: `baseline_version = "latest"` — tracks `rapidctl-container:latest` for "always working" demo
- **Pinned**: Set `baseline_version = "<timestamp>"` (e.g., `1771729391`) to match a specific rapidctl-container publish
- **Local dev**: Use `Containerfile.example` to build local container, set `container_repo = "my-custom-container"` and `baseline_version = "latest"`

### Runtime Selection
- **Podman** (default): `RAPIDCTL_EXEC_MODE=podman` or unset
- **Docker**: `RAPIDCTL_EXEC_MODE=docker` (requires `pip install rapidctl[docker]`)
- **Kubernetes**: `RAPIDCTL_EXEC_MODE=kubernetes`

### Synchronization with rapidctl-container
| rapidctl-container Change | examplectl Action |
|---------------------------|-------------------|
| New command added | Works automatically (discovers via commands.json) |
| Command removed/renamed | Update any hardcoded command references; test help |
| commands.json schema change | Update command discovery/parsing if needed |
| Breaking container contract | Coordinate version bump; update Containerfile.example |

### Upgrading Baseline
1. Check rapidctl-container releases for new timestamp tag
2. Test locally: `baseline_version = "<new-timestamp>"`
3. If working, update default to `latest` or pin to new timestamp
4. Update `Containerfile.example` FROM line if base image changed significantly

## Extension Workflow (for users forking this repo)

1. **Fork rapidctl-container** → add your commands → publish to your GHCR
2. **Fork examplectl** → update `container_repo` in `examplectl` script to your fork
3. **Optional**: Customize `Containerfile.example` for local testing
4. **Run**: `./examplectl <your-command>`

## Development

### Local Testing with Custom Container
```bash
# Build extended container (Podman)
podman build -f Containerfile.example -t my-custom-container .

# Run examplectl against local build (Podman)
container_repo="my-custom-container" baseline_version="latest" ./examplectl greet

# Run with Docker runtime
RAPIDCTL_EXEC_MODE=docker container_repo="my-custom-container" baseline_version="latest" ./examplectl greet
```

### Running Tests
```bash
python3 -m pytest tests
```

### MCP Server
```bash
./examplectl mcp
# Or with Docker runtime
RAPIDCTL_EXEC_MODE=docker ./examplectl mcp
```

## File Purposes
- `examplectl` — Main CLI entry point (configure container_repo, baseline_version here)
- `Containerfile.example` — Demonstrates extending rapidctl-container with custom commands
- `custom_cmds/` — Example custom commands for extension demo
- `commands.json.example` — Shows merged commands.json with custom commands
- `requirements.txt` — Python dependencies (rapidctl, podman, docker optional)