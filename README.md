# Bank Fraud Analysis

SQL analysis of banking transaction fraud patterns using a dataset of 594,000+ transactions.

## Tools
- SQLite + DBeaver
- SQL (CTEs, Window Functions, Aggregations)

## Key Findings
- **es_leisure** category has the highest fraud rate — 95%
- **es_travel** follows with 79% fraud rate
- **es_health** is relatively safe at 10.5%
- Top fraudulent categories by volume: es_sportsandtoys (1,982 cases), es_health (1,696)

## Queries Covered
- Aggregations (COUNT, SUM, AVG, GROUP BY)
- Window functions (AVG OVER, ROW_NUMBER, LAG, FIRST_VALUE, LAST_VALUE)
- CTEs with multiple blocks and JOINs
- Fraud rate analysis per category

## Dataset
[BankSim Dataset — Kaggle](https://www.kaggle.com/datasets/ealaxi/banksim1)
