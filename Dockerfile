# This Dockerfile builds the container environment that rapidctl executes commands inside of.
FROM python:3.11-slim

# The default path where rapidctl expects to find scripts
WORKDIR /opt/rapidctl/cmd/

# Example: Copy scripts or commands that the CLI tool will orchestrate
# COPY ./container_cmds/ /opt/rapidctl/cmd/

# (Optional) install dependencies for those scripts
# COPY requirements-container.txt .
# RUN pip install --no-cache-dir -r requirements-container.txt

ENTRYPOINT ["python"]
