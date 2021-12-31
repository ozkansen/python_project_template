.PHONY: linter format format_diff test
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
