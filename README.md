# Databricks and Poetry Integration

This databricks and poetry integration will make databricks more flexible for python based development, by leveraging the poetry python library dependency management framework. It will solve the complex library dependency issues for some series engineering project.

* This repo demonstrates how to use poetry with databricks, via the databricks container service.
* It assumes using AWS CodeArtifact for the private python library repo.
* It assumes using AWS Elastic Container Registry for the private docker image repo.
* We will build a custom python library (samplelibyw) with poetry, and publish it to the CodeArtifact.
* Then we will build a custom databricks runtime docker image, which will pre-install our custom python library (samplelibyw).
* At the end, we will create a databricks cluster using the custom docker image, which contains the pre-installed library in UI and CLI.
