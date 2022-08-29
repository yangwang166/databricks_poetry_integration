#!/bin/bash
echo "POETRY_HTTP_BASIC_ARTIFACT_USERNAME: ${POETRY_HTTP_BASIC_ARTIFACT_USERNAME}"
echo "POETRY_HTTP_BASIC_ARTIFACT_PASSWORD: ${POETRY_HTTP_BASIC_ARTIFACT_PASSWORD}"

pip install poetry==1.1.14
git clone https://github.com/yangwang166/databricks_poetry_integration.git deps
cd deps/02_sample_image/deps/

poetry config virtualenvs.create false # When option is false, then poetry will install dependencies to current python interpreter
poetry install --no-interaction --no-ansi
