.PHONY: help commit cover format lint tests run
.DEFAULT: help

SHELL := /bin/bash
ENV = poetry run

MYPY = mypy
SOURCES = ./app
TESTS_DIR = ./tests/
PYTEST = pytest --cache-clear
PYLINT = pylint --rcfile=./.pylintrc --fail-under=9.8

help: ## display commands help.
	@grep -E '^[a-zA-Z_-]+:.?## .$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install-global: ## prepare development environment, use only once. It will install poetry, pyenv.
	@echo "       prepare development environment, use only once. It will install poetry, pyenv"
	brew install poetry
	brew install pyenv

install: ## install production dependencies only.
	@echo "       install production dependencies only"
	poetry install --no-dev --no-root

install-dev: ## install all dependencies (production, development & hooks).
	@echo "       install all dependencies (production, development & hooks)"
	poetry install --no-root
	make install-git-hooks

install-git-hooks:
	poetry add --group dev pre-commit
	$(ENV) pre-commit install
	$(ENV) pre-commit install --hook-type commit-msg

format: ## run black to format all Python code.
	@echo "       run black to format all Python code"
	$(ENV) black .

commit: ## commit changes using citizen.
	@echo "       commit changes using citizen"
	$(ENV) cz commit

pre-commit:
	$(ENV) pre-commit run --all-files

tests: ## run tests.
	@echo "       run tests"
	PYTHONPATH=$(SOURCES) $(ENV)  $(PYTEST) $(TESTS_DIR)

lint: ## run linter.
	@echo "       run linter"
	$(ENV) $(PYLINT) $(SOURCES)

type-check: ## run type-checker.
	@echo "       run type-checker"
	$(ENV) $(MYPY) $(SOURCES)