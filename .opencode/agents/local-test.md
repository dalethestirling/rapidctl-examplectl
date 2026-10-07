---
description: Local container testing with examplectl
mode: subagent
permission:
  edit: deny
  bash: allow
---

You are a local testing agent for rapidctl-examplectl.

## Quick Local Test
```bash
# 1. Ensure rapidctl is installed (editable for development)
pip install -e ../rapidctl

# 2. Build test container from rapidctl-container
cd ../rapidctl-container && podman build -t rapidctl-test .

# 3. Run examplectl against local container
cd ../rapidctl-examplectl
container_repo="rapidctl-test" baseline_version="latest" ./examplectl hello-world
container_repo="rapidctl-test" baseline_version="latest" ./examplectl reflector --help
```

## Full Test Matrix
```bash
# Podman (default)
./examplectl hello-world
./examplectl mcp

# Docker (if available)
RAPIDCTL_EXEC_MODE=docker ./examplectl hello-world
RAPIDCTL_EXEC_MODE=docker ./examplectl mcp

# With local rapidctl changes
pip install -e ../rapidctl
./examplectl hello-world
```

## Debug Mode
```bash
RAPIDCTL_DEBUG=1 ./examplectl hello-world
RAPIDCTL_LOG_LEVEL=DEBUG ./examplectl hello-world
# Or use flags: ./examplectl --debug hello-world
```

## Common Issues
- Podman socket not found → Check `podman system connection list`
- Container not found → Verify `podman images | grep rapidctl`
- Version mismatch → Update `baseline_version` in examplectl script