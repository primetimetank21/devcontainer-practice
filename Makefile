# Install dependencies
.PHONY: install
install:
	@echo "Installing dependencies..."
	@uv sync --locked

# Run the application
.PHONY: run
run:
	@echo "Starting the application..."
	@uv run uvicorn src.main:app --host 0.0.0.0 --port 8000 --reload

# Format code
.PHONY: format
format:
	@echo "Formatting code..."
	@uv run ruff format

# Lint code
.PHONY: lint
lint:
	@echo "Linting code..."
	@uv run ruff check

# Test code
.PHONY: test
test:
	@echo "Running tests..."
	@echo "Skipping tests for now."

# Clean up and remove cache files
.PHONY: clean
clean:
	@ find . -type f -name "*.py[co]" -delete -o -type d -name "__pycache__" -delete
	@ dirs=".mypy_cache .pytest_cache .ruff_cache .ipynb_checkpoints"; \
	for dir in $$dirs; do \
			rm -rf "$$dir"; \
	done

all: install format lint test
