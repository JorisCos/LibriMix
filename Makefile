fmt:
	uv run --only-dev ruff format .

lint:
	uv run --only-dev ruff check .
	uv run --only-dev ruff format . --check --diff
