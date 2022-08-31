# Databricks and Poetry Integration

This databricks and poetry integration will make databricks more flexible for python based development, by leveraging the poetry python library dependency management framework. It will solve the complex library dependency issues. Especially for using Poetry to handle multiple .toml files from local and private libraries (local and AWS CodeArtifact). With pip and requirements.txt this would be a nightmare but poetry handles this. 

* This repo demonstrates how to use poetry with databricks, via the databricks container service or using init script.
* It assumes using AWS CodeArtifact for the private python library repo.
* (For DCS approach) It assumes using AWS Elastic Container Registry for the private docker image repo.
* (For Init Script approach) We will install poetry and install library with poetry .toml file in an Init Script
* We will build a custom python library (samplelibyw) with poetry, and publish it to the CodeArtifact.
* (For DCS approach) Then we will build a custom databricks runtime docker image, which will pre-install our custom python library (samplelibyw).
* At the end, we will create a databricks cluster using the custom docker image or using init script, which contains the pre-installed library in UI and CLI.


## Usage

### Using the Databricks Container Service (DCS) approach

1) Build and Publish Poetry managed Python Library to CodeArtifact: `sh 01_sample_lib/build_and_publish.sh`
2) Build and Publish a custom databricks runtime docker image to ECR which include a poetry managed library: `sh 02_sample_image/build_and_publish.sh`
3) Create a databricks cluster with the custom docker image using CLI: `sh 03_launch_poetry_cluster/create_poetry_cluster.sh`

**Note: In DCS approach, you can fine grain control what python lib you want to bake in the image. In that case, you can start from https://github.com/databricks/containers/tree/master/ubuntu/python (databricksruntime/python) And change the pip install part to Poetry based libs install.**


### Using the Init Script approach

1) Build and Publish Poetry managed Python Library to CodeArtifact: `sh 01_sample_lib/build_and_publish.sh`
2) Upload an init script to DBFS: `sh 02a_sample_init_script/upload_init_script.sh`
3) Create a databricks cluster with init script: `sh 03a_launch_cluster_with_init_script/create_poetry_cluster.sh` 

**Note: The Init Script approach is more lightweight. If you only want to use Poetry to manage your app's lib dependency and don't worry about the pre-installed libs in DBR, then this is a suggest approach.**

## What is Poetry

https://python-poetry.org/

