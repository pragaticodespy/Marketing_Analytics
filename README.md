# Marketing Analytics & Customer Intelligence Dashboard
SQL | Python | Power BI

A full-stack analytics pipeline built for a sports e-commerce company operating across 10 European markets — from raw relational data to a business-ready intelligence dashboard.

## The business problem: 
Despite increased marketing spend, customer engagement and conversion rates were declining. The company needed to understand where the funnel was breaking down, which campaigns were actually working, and what customers genuinely felt about their products.

## Key Findings
MetricValueCheckout drop-off rate75%Overall checkout conversion25%Low-rated reviews (1–2 stars)17% of 1,363High-rated reviews (4–5 stars)62% of 1,363

## What's Inside
SQL — Five T-SQL scripts clean and model the raw data: deduplication, NULL imputation, column parsing, and dimension enrichment across customer, product, journey, engagement, and review tables.
Python — VADER sentiment analysis uses a dual-signal approach (NLP text score + star rating) to classify reviews into 5 sentiment states. Rating-only models miss customers who write polite but dissatisfied reviews — or blunt but ultimately satisfied ones.
Power BI — Dashboard connects all layers: conversion funnel by stage, campaign performance by content type, sentiment distribution, geographic breakdown across 10 markets, and product price-tier analysis.

## How to Run

SQL — Run scripts in /sql against the database — dimension tables first, then fact/cleaning scripts.
Python — Open SentimentAnalysis.ipynb in Jupyter or Colab. Upload data.sqlite when prompted. Outputs customer_reviews_with_sentiment.csv.
Power BI — Open marketing_analytics.pbix. The dashboard connects directly to the SQL Server source; update the connection string to point at your restored database, then refresh.


Data is synthetic, used for demonstration purposes.

The main changes from before: architecture diagram now reflects the real data flow (.bak → SQL Server → SQLite for Colab, server directly for Power BI), and the "How to Run" Power BI step is corrected to match how you actually built it.Sonnet 4.6
