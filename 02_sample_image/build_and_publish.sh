# Change the domian and domain-owner to yours
export CODEARTIFACT_AUTH_TOKEN=`aws codeartifact get-authorization-token --domain yanganzssa \
  --domain-owner 087659795860 --query authorizationToken --output text`

# Change the desired docker image name[yanganzssa] name to yours
docker build -t yanganzssa . --build-arg POETRY_HTTP_BASIC_ARTIFACT_PASSWORD=$CODEARTIFACT_AUTH_TOKEN

# Change region, profile, AWS ECR URL
aws ecr get-login-password --region ap-southeast-2 --profile=aws-field-eng_databricks-power-user \
  | docker login --username AWS --password-stdin 997819012307.dkr.ecr.ap-southeast-2.amazonaws.com

# Change source image and target image name
docker tag yanganzssa:latest 997819012307.dkr.ecr.ap-southeast-2.amazonaws.com/yanganzssa:latest

# Change image name
docker push 997819012307.dkr.ecr.ap-southeast-2.amazonaws.com/yanganzssa:latest

