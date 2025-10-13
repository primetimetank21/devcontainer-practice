FROM mcr.microsoft.com/devcontainers/base:alpine-3.20

# Install uv
COPY --from=ghcr.io/astral-sh/uv:0.9.2 /uv /uvx /bin/

# Set working directory
WORKDIR /app

# Install dependencies
COPY ./pyproject.toml /app/pyproject.toml
COPY ./uv.lock /app/uv.lock
RUN uv sync --locked --no-dev --no-cache

# Copy application files
COPY ./src /app/src

# Expose the port the app runs on
EXPOSE 8000

# Command to run the application; gets overridden in docker-compose.yaml
CMD ["uv", "run", "uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]