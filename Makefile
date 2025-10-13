install:
	@echo "Installing dependencies..."
	@uv sync

run:
	@echo "Starting the application..."
	@uv run uvicorn src.main:app --host 0.0.0.0 --port 8000 --reload

format:
	@echo -e "\nFormatting code..."
	@uv run ruff format

lint:
	@echo -e "\nLinting code..."
	@uv run ruff check

test:
	@echo -e "\nRunning tests..."
	@echo "Skipping tests for now."

all: install format lint test