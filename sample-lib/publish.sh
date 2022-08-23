export CODEARTIFACT_AUTH_TOKEN=`aws codeartifact get-authorization-token --domain yanganzssa --domain-owner 087659795860 --query authorizationToken --output text`
export POETRY_HTTP_BASIC_ARTIFACT_USERNAME=aws
export POETRY_HTTP_BASIC_ARTIFACT_PASSWORD=$CODEARTIFACT_AUTH_TOKEN
poetry build
poetry publish --repository artifact
