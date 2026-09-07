# Customer Cohort & Retention Analysis

## Objective
Analyze SaaS customer cohorts to understand retention decay, identify drop-off points, compare acquisition channels and plans, and translate the findings into business actions.

## Dataset decision
The public reference selected is **SaaS Subscriptions & Customer Churn Dataset v1.0.0** by Analytics Engineering. Its documentation describes synthetic educational SaaS data, covering 2023–2025, with accounts, subscriptions, plans, invoices, and payments, and explicitly supports customer retention/cohort analysis. Source: https://www.analyticsengineering.com/datasets/saas-subscriptions

The CSVs bundled here are a deterministic, self-contained portfolio dataset modeled on that documented business shape rather than a redistributed copy of the source download.

## Business questions
1. How does retention decay after signup?
2. Which signup cohorts retain best?
3. Which acquisition channels produce the strongest six-month retention?
4. Which plans retain best?
5. Where should acquisition and onboarding effort change?

## Methodology
**Cohort:** signup/subscription-start month.

**Retention:** active customers from a signup cohort in a later month ÷ the cohort's Month 0 customer count.

**M6 retention:** customers still active six months after signup ÷ the original cohort size.

**M6 maturity rule:** only signup cohorts through June 2025 are included in M6 comparisons, because the data runs through December 2025.

**M12 maturity rule:** only signup cohorts through December 2024 are used for full 12-month retention curves.

## Results from the bundled project dataset
- Pooled M6 retention across mature cohorts: **60.0%**
- Best acquisition channel at M6: **Partner — 67.8%**
- Lowest acquisition-channel M6 retention: **Paid Search — 55.4%**
- Best plan at M6: **Enterprise — 67.3%**
- Lowest plan M6 retention: **Starter — 55.5%**

These figures describe this portfolio dataset only and are not industry benchmarks.

## Business recommendations
1. Evaluate acquisition channels on retention-adjusted customer quality, not signup volume alone.
2. Concentrate onboarding and product-adoption interventions during the first six months.
3. Study what makes higher-retention plans stickier and transfer relevant retention practices to lower-retention plans.
4. Monitor cohort performance continuously so deterioration in customer quality is visible before aggregate growth weakens.

## Skills demonstrated
**SQL:** CTEs, joins, date bucketing, conditional aggregation, window functions, cohort denominators, segmentation.

**Power BI:** data modelling, DAX, KPI cards, retention heatmaps, retention curves, acquisition/plan analysis, executive storytelling.

## Repository structure
```text
customer-cohort-retention-analysis/
├── data/
│   ├── accounts.csv
│   ├── subscriptions.csv
│   ├── plans.csv
│   ├── customer_monthly_activity.csv
│   ├── cohort_retention.csv
│   ├── channel_retention_m6.csv
│   ├── plan_retention_m6.csv
│   ├── monthly_kpis.csv
│   └── cohort_retention.db
├── sql/
├── powerbi/
├── docs/
└── images/
```

## Reproduce
1. Open `data/cohort_retention.db` in SQLite/DB Browser for SQLite.
2. Run the SQL files in `sql/`.
3. Import the four model CSVs into Power BI Desktop.
4. Follow `powerbi/POWER_BI_BUILD_GUIDE.md`.

## Source citation
Analytics Engineering. (2026). *SaaS Subscriptions & Customer Churn Dataset* (Version 1.0.0). https://www.analyticsengineering.com/datasets/saas-subscriptions
