---
description: CLI wrapper changes (entrypoint, Containerfile.example)
mode: subagent
permission:
  edit: allow
  bash: allow
---

You are a specialized agent for rapidctl-examplectl development.

## Focus Areas
- **examplectl**: Main entry point (CtlClient instantiation + main())
- **Containerfile.example**: Extending rapidctl-container with custom commands
- **custom_cmds/**: Example custom commands for extension demo
- **commands.json.example**: Merged commands.json with custom commands
- **tests/**: Test suite

## Configuration
```python
# examplectl script
client = client.CtlClient()
client.container_repo = "ghcr.io/dalethestirling/rapidctl-container"
client.baseline_version = "latest"  # or specific timestamp
client.client_version = "0.0.1"
```

## Local Testing
```bash
# Build extended container
podman build -f Containerfile.example -t my-custom-container .

# Run against local build
container_repo="my-custom-container" baseline_version="latest" ./examplectl greet

# Docker runtime
RAPIDCTL_EXEC_MODE=docker container_repo="my-custom-container" baseline_version="latest" ./examplectl greet
```

## Extension Pattern (for forks)
1. Fork rapidctl-container → add commands → publish to your GHCR
2. Fork examplectl → update `container_repo` in examplectl script
3. Optional: Customize `Containerfile.example` for local testing
4. Run: `./examplectl <your-command>`

## Version Alignment
- `baseline_version = "latest"` → tracks rapidctl-container:latest
- `baseline_version = "<timestamp>"` → pins to specific version
- Update when rapidctl-container publishes new timestamp