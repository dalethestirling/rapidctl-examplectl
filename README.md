# rapidctl-examplectl

This is an example implementation of a CLI tool using the `rapidctl` library.

## Overview

`examplectl` is a demonstration of how to build a CLI that interacts with containerized environments using `rapidctl`. It manages container versions and executes commands within a container runtime (Podman or Docker).

## Getting Started

### Prerequisites

- Python 3.11+
- **Podman** (default runtime) or **Docker** (set `RAPIDCTL_EXEC_MODE=docker`)
- `rapidctl` library installed (`pip install rapidctl[docker]` for Docker support)

### Installation

```bash
pip install -r requirements.txt
```

### Usage

Run the `examplectl` script:

```bash
python3 examplectl --help
```

Run with Docker runtime:
```bash
RAPIDCTL_EXEC_MODE=docker python3 examplectl --help
```

Run with Podman runtime (default):
```bash
RAPIDCTL_EXEC_MODE=podman python3 examplectl --help
# or just
python3 examplectl --help
```

## Development

### Structure

- `examplectl`: Main entry point for the CLI.
- `Dockerfile`: Environment definition for containerized execution.
- `examples/`: Example scripts and usage patterns.
- `tests/`: Unit and integration tests.

### Running Tests

```bash
python3 -m pytest tests
```
