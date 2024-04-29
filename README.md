# Template Dev

A minimal template for api dev and data analytics project written in Python.

This README will guide you through setting up your development environment, following best practices and standards. We will cover installing pre-commit hooks, setting up a virtual environment, and configuring your environment to connect to Databricks feature store.

## Dev environment set-up

### Install locally

1. Install global dependencies by running:

```bash
make install-global
```

It will install:

- [pyenv](https://github.com/pyenv/pyenv): a Python version manager
- [poetry](https://python-poetry.org): a Python package manager
- [Git Hooks using precommit](https://github.com/pre-commit/pre-commit): manage Git pre-commit hooks

2. Install all dependencies using:

```bash
make install-dev
```

### Code format

This project uses the [`black`](https://black.readthedocs.io/en/stable/) formatter.

To run the formatter


```bash
make format
```

### Style guide

This project implements Google python style guide. Rules can be found at: https://google.github.io/styleguide/pyguide.html

To run the pre-commit. Make sure the code run successfully all requirements.
```bash
make pre-commit
```

### Commit style
In this project, we will use by default [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/) implemented by [commitizen](https://github.com/commitizen-tools/commitizen)

To create a commit run:

```bash
make commit
```

Now, pre-commit hooks will be run automatically before every `git push`. If any issues are found, the push will be aborted, and you'll need to fix the problems and commit the changes before pushing again.

### Tests
To run the tests
```bash
make test
```

### Packages management

Add package
```bash
    poetry add <name_of_package>
```

Update requirements.txt, The API set up the prod environment from the requirements.txt file.
```bash
    make requirements
```