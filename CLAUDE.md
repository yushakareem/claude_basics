# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

A minimal Python project for testing Claude Code basics (version 0.1.0).

## Commands

### Running the application
```bash
python src/main.py
```

### Testing
This project uses pytest for all tests.

```bash
# Run all tests
pytest

# Run a specific test file
pytest tests/test_example.py

# Run a specific test function
pytest tests/test_example.py::test_function_name
```

## Architecture

Simple flat structure with source code in `src/` directory. Currently contains a single entry point (`src/main.py`) with basic functionality.

**Python version:** Requires Python 3.12+