# Use Python 3.12 slim image as base
FROM python:3.12-slim

# Set working directory in container
WORKDIR /app

# Install uv for package management
RUN pip install uv

# Copy project files to container
COPY pyproject.toml ./
COPY README.md ./
COPY src/ ./src/
COPY tests/ ./tests/

# Create virtual environment and install dependencies
RUN uv venv && \
    . .venv/bin/activate && \
    uv pip install -e .

# Activate virtual environment for subsequent commands
ENV PATH="/app/.venv/bin:$PATH"

# Default command: run tests
CMD ["pytest", "-v"]
