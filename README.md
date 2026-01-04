# claude_basics
Some tests on using claude code

# Quickstart:

For someone cloning this project fresh:

1. **Install uv** (if not already installed):
   ```bash
   curl -LsSf https://astral.sh/uv/install.sh | sh
   ```

2. **Create and activate virtual environment**:
   ```bash
   uv venv
   source .venv/bin/activate
   ```

3. **Install dependencies**:
   ```bash
   uv pip sync
   ```

4. **Install project in editable mode**:
   ```bash
   uv pip install -e .
   ```

5. **Run tests**:
   ```bash
   pytest tests/test_calculator.py -v
   ```

   Or run all tests:
   ```bash
   pytest
   ```

# Some lessons:

### 1. Creating and Importing local packages properly

For example, `src/calculator.py` is a package that we would like to import in `tests/test_calculator.py` then `src`
needs to have `__init__.py`. Also, the project should get build/installed using setuptools (see `pyproject.toml`). This
allows `uv pip install -e .` to install the project in "editable mode", which:

- Makes the src directory importable as a Python module
- Adds it to Python's path so import src.calculator works

### 2. Running tests using Docker (Containerization)

Docker allows you to run your application in an isolated environment without needing to set up Python, uv, or any dependencies locally.

**Prerequisites**: Install Docker from [docker.com](https://www.docker.com/)

**Build the Docker image** (only needed once, or when code changes):
```bash
docker build -t claude-basics.
```

**Run tests in a container**:
```bash
# Run all tests (default command)
docker run --rm claude-basics

# Run specific test file
docker run --rm claude-basics pytest tests/test_calculator.py -v

# Run the main application
docker run --rm claude-basics python src/main.py
```

**What the `--rm` flag does**: Automatically removes the container after it exits, keeping your system clean.

**Interactive mode** (useful for debugging):
```bash
docker run --rm -it claude-basics /bin/bash
```

This gives you a shell inside the container where you can explore the environment, run commands manually, etc.