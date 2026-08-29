# Lab: Unity Catalog Governance Design

## Objective
Design a governed Azure Databricks data platform that separates platform administration, data engineering, analytics and consumption while preserving lineage and least-privilege access.

## Scenario
A manufacturing organization receives operational, finance and telemetry data from multiple systems. Engineering teams need to build Delta pipelines, analysts need governed SQL access, and downstream AI workloads must only access approved data products.

## Architecture exercise

Create a logical model with:

- a catalog for raw/landing assets
- domain-oriented catalogs for curated data products
- schemas that separate development and consumer-facing objects
- managed tables for curated data
- external locations only where enterprise storage requirements justify them
- group-based permissions rather than direct user grants

## Workshop tasks

1. Define the catalog and schema hierarchy.
2. Map personas to privileges.
3. Decide which assets should be managed versus external.
4. Identify lineage checkpoints from source through Gold tables.
5. Add a policy for service principals and automated jobs.
6. Review how governed objects would be exposed to BI and AI consumers.

## Discussion prompts

- When does a catalog become too broad?
- Which permissions belong at catalog, schema and table level?
- How should ownership differ from day-to-day usage permissions?
- How would the design change for multiple business units or environments?
- What governance remains in Databricks versus Azure/storage controls?

## Extension challenge

Add a new AI application that requires access to only two curated tables. Design the minimum permissions required without granting access to the broader domain.

## Reference

Useful upstream implementation reference: [databricks/unity-catalog-setup](https://github.com/databricks/unity-catalog-setup). This lab is an architecture and teaching exercise rather than a reproduction of that repository.
