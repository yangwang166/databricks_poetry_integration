FROM databricksruntime/standard:10.4-LTS

ENV POETRY_VERSION=1.1.14
ENV POETRY_HTTP_BASIC_ARTIFACT_USERNAME=aws
ENV POETRY_HTTP_BASIC_ARTIFACT_PASSWORD=...

RUN pip install "poetry==$POETRY_VERSION"

WORKDIR /deps

COPY deps/pyproject.toml /deps/

RUN poetry config virtualenvs.create false
RUN poetry install --no-interaction --no-ansi

