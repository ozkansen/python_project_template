.PHONY: linter format format_diff test install coverage export_requirements
linter:
	- @echo "\nRUNNING PYLINT CHECKER"
	- @poetry run pylint project tests

	- @echo "\nRUNNING MYPY CHECKER"
	- @poetry run mypy --color-output .

format:
	- @echo "\nRUNNING ISORT FORMATTER"
	- @poetry run isort --color .

	- @echo "\nRUNNING BLACK FORMATTER"
	- @poetry run black --color .

format_diff:
	- @echo "\nRUNNING ISORT FORMATTER"
	- @poetry run isort --diff --color .

	- @echo "\nRUNNING BLACK FORMATTER"
	- @poetry run black --diff --color .

test:
	- @poetry run pytest .

test_github_actions_compatibility:
	- @poetry run pytest -p no:sugar .

coverage:
	- @poetry run pytest --cov-report=html .

install:
	- @poetry install

export_requirements:
	- @echo "\nEXPORTING BASE PACKAGES"
	- @poetry export -f requirements.txt -o requirements/requirements.txt --without-hashes
	- @cat requirements/requirements.txt | sed 's/[;].*//' | tee requirements/requirements.txt

	- @echo "\nEXPORTING WITH DEV. PACKAGES"
	- @poetry export -f requirements.txt -o requirements/requirements-dev.txt --without-hashes --dev
	- @cat requirements/requirements-dev.txt | sed 's/[;].*//' | tee requirements/requirements-dev.txt
