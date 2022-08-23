FROM databricksruntime/standard:10.4-LTS

ARG POETRY_VERSION=1.1.14
ARG POETRY_HTTP_BASIC_ARTIFACT_USERNAME=aws
# We will passin the password
ARG POETRY_HTTP_BASIC_ARTIFACT_PASSWORD=xxx

RUN pip install "poetry==$POETRY_VERSION"

WORKDIR /deps

COPY deps/pyproject.toml /deps/

RUN poetry config virtualenvs.create false
RUN poetry install --no-interaction --no-ansi

