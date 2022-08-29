# Databricks notebook source
# DBTITLE 1,1 Prepare the Secrets
# MAGIC %md 
# MAGIC In cli:
# MAGIC Run the following line to create the secret scope and secrets:
# MAGIC ```
# MAGIC databricks --profile your_profile secrets create-scope --scope poetry_integration
# MAGIC databricks --profile your_profile secrets put --scope poetry_integration --key password # AWS CodeArtifact Password
# MAGIC databricks --profile your_profile secrets put --scope poetry_integration --key username # AWS CodeArtifact Username
# MAGIC ```

# COMMAND ----------

# DBTITLE 1,2 Prepare the init script which will install the dependencies of your poetry based project
dbutils.fs.put("/databricks/scripts/poetry_init.sh","""
#!/bin/bash
echo "POETRY_HTTP_BASIC_ARTIFACT_USERNAME: ${POETRY_HTTP_BASIC_ARTIFACT_USERNAME}"
echo "POETRY_HTTP_BASIC_ARTIFACT_PASSWORD: ${POETRY_HTTP_BASIC_ARTIFACT_PASSWORD}"

pip install poetry==1.1.14
git clone https://github.com/yangwang166/databricks_poetry_integration.git deps
cd deps/02_sample_image/deps/

poetry config virtualenvs.create false
poetry install --no-interaction --no-ansi
""", True)

# COMMAND ----------

# DBTITLE 1,3 Use the init script to start your cluster and test the libs installed by the init script
import samplelibyw
print(samplelibyw.PI)

# COMMAND ----------


