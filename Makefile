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

coverage:
	- @poetry run pytest --cov-report=html .

install:
	- @virtualenv .venv --python 3.8
	- @.venv/bin/pip install -U pip setuptools
	- @poetry install

export_requirements:
	- @echo "\nEXPORTING BASE PACKAGES"
	- @poetry export -f requirements.txt -o requirements/base.txt --without-hashes
	- @cat requirements/base.txt | sed 's/[;].*//' | tee requirements/base.txt

	- @echo "\nEXPORTING WITH DEV. PACKAGES"
	- @poetry export -f requirements.txt -o requirements/dev.txt --without-hashes --dev
	- @cat requirements/dev.txt | sed 's/[;].*//' | tee requirements/dev.txt
