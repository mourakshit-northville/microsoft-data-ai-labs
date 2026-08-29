# Lab: Production MLOps on Azure Databricks

## Objective
Take a machine-learning use case from governed data to repeatable deployment, monitoring and promotion across environments.

## Scenario
A fraud or anomaly model is trained from curated Delta tables. The goal is to move beyond an isolated notebook and design a production workflow that engineering and operations teams can support.

## Workshop flow

1. Prepare Bronze, Silver and Gold training data.
2. Create reproducible feature-engineering logic.
3. Track experiments and model metrics with MLflow.
4. Register the selected model under governed Unity Catalog.
5. Package training and deployment resources as source-controlled deployment assets.
6. Deploy a serving endpoint.
7. Add validation gates before promotion.
8. Capture monitoring signals for data drift, prediction quality and endpoint behavior.

## Architecture decisions to discuss

- Which logic belongs in notebooks versus reusable Python modules?
- What is the boundary between data pipeline CI/CD and model CI/CD?
- Which metrics should block promotion?
- How should model ownership and data ownership interact?
- What should be parameterized between development and production?

## Instructor challenge

Ask participants to intentionally change the input distribution and determine which monitoring signal should detect the issue first.

## Reference

The Microsoft [databricks-mlops-workshop](https://github.com/microsoft/databricks-mlops-workshop) is a useful upstream implementation reference for medallion processing, MLflow, Unity Catalog model registration, serving and CI/CD. This document reframes those concepts as a reusable architecture and teaching exercise.
