#gimme-aws-creds
export ECRPASSWORD=`aws ecr get-login-password --region ap-southeast-2 --profile=aws-field-eng_databricks-power-user`
sed "s/xxxxx/${ECRPASSWORD}/g" poetry_cluster.json.tmp > poetry_cluster.json
databricks --profile cse2 clusters create --json-file poetry_cluster.json
