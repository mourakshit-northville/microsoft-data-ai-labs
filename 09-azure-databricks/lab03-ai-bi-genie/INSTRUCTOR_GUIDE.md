# Instructor Guide: Governed Conversational Analytics with Databricks AI/BI

## Goal

Teach how to move from technically correct SQL tables to business-ready conversational analytics. The exercise is designed around a small sales domain and focuses on semantic clarity, governance, and testability rather than prompt tricks.

## Data contract

Use these Gold objects from the preceding lab:

- `workshop.gold.daily_sales`
- `workshop.silver.orders`

Define the business language before opening a conversational interface:

- **Revenue** = sum of valid order amount after data-quality filtering.
- **Active customer** = customer with at least one valid order in the selected period.
- **Average order value** = revenue divided by distinct orders.
- **Region** = standardized uppercase sales region.

## Teaching sequence

1. Ask learners to answer three questions with SQL first.
2. Document the metric definitions and ambiguous terms.
3. Configure a governed analytics space over the approved tables.
4. Add business descriptions and example questions.
5. Test natural-language questions against expected SQL results.
6. Record failures as semantic-model problems, data-quality problems, or language ambiguity problems.

## Test questions

- Which region had the highest revenue yesterday?
- What was average order value by region for the last seven days?
- Which customers contributed to the largest orders?
- Compare order count and revenue. Did both move in the same direction?
- What does "active customer" mean in this dataset?

## Instructor challenge

Ask a deliberately ambiguous question: **"Which region is doing best?"**

Do not accept an immediate answer. Have participants define whether "best" means revenue, order count, growth, margin, or customers. This is the central teaching point: conversational BI depends on governed business meaning, not just an LLM connected to tables.

## Extension

Add a second domain such as product returns. Then test whether a single conversational experience can answer cross-domain questions without confusing gross sales, net sales, and returned value.
