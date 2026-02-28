# rapidctl-examplectl

This is an example implementation of a CLI tool using the `rapidctl` library.

## Overview

`examplectl` is a demonstration of how to build a CLI that interacts with containerized environments using `rapidctl`. It manages container versions and executes commands within a Docker/Podman environment.

## Getting Started

### Prerequisites

- Python 3.11+
- Podman or Docker
- `rapidctl` library installed

### Installation

```bash
pip install -r requirements.txt
```

### Usage

Run the `examplectl` script:

```bash
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
