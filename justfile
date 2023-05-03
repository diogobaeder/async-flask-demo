#!/usr/bin/env just --justfile

export RUN := "poetry run"
export PYTHON := "${RUN} python"
export PYTEST := "${RUN} pytest"
export MYPY := "${RUN} mypy"
export RUFF := "${RUN} ruff"
export PYTHONPATH := "${PWD}"


test-all: test mypy lint

test:
	${PYTEST} tests

mypy:
	${MYPY} asyncdemo

lint:
	${RUFF} asyncdemo

run-asyncio:
	${RUN} uvicorn asyncdemo.asynciodemo.main:app --reload --host 0.0.0.0 --port 8000

run-flask:
  ${RUN} uwsgi asyncdemo/flaskdemo/uwsgi.ini

