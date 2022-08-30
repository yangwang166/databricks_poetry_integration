export CODEARTIFACT_AUTH_TOKEN=`aws codeartifact get-authorization-token --domain yanganzssa \
  --domain-owner 087659795860 --query authorizationToken --output text`
databricks --profile cse2 secrets put --scope poetry_integration --key password --string-value $CODEARTIFACT_AUTH_TOKEN
databricks --profile cse2 clusters create --json-file poetry_cluster.json
