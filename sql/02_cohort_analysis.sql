-- Cohort size
SELECT cohort_month,COUNT(DISTINCT account_id) cohort_size FROM customer_monthly_activity WHERE months_since_cohort=0 GROUP BY cohort_month ORDER BY cohort_month;

-- Retention curve
WITH cohort_sizes AS (SELECT cohort_month,COUNT(DISTINCT account_id) cohort_size FROM customer_monthly_activity WHERE months_since_cohort=0 GROUP BY cohort_month) SELECT a.cohort_month,a.months_since_cohort,COUNT(DISTINCT a.account_id) retained_customers,c.cohort_size,ROUND(100.0*COUNT(DISTINCT a.account_id)/c.cohort_size,2) retention_pct FROM customer_monthly_activity a JOIN cohort_sizes c USING(cohort_month) WHERE a.months_since_cohort BETWEEN 0 AND 12 GROUP BY a.cohort_month,a.months_since_cohort,c.cohort_size ORDER BY a.cohort_month,a.months_since_cohort;

-- Largest month-to-month retention drops
WITH curve AS (SELECT a.cohort_month,a.months_since_cohort,1.0*COUNT(DISTINCT a.account_id)/c.cohort_size retention_rate FROM customer_monthly_activity a JOIN (SELECT cohort_month,COUNT(DISTINCT account_id) cohort_size FROM customer_monthly_activity WHERE months_since_cohort=0 GROUP BY cohort_month)c USING(cohort_month) WHERE a.months_since_cohort BETWEEN 0 AND 12 GROUP BY a.cohort_month,a.months_since_cohort,c.cohort_size),d AS (SELECT cohort_month,months_since_cohort,retention_rate,retention_rate-LAG(retention_rate) OVER(PARTITION BY cohort_month ORDER BY months_since_cohort) change_from_prior_month FROM curve) SELECT * FROM d WHERE change_from_prior_month IS NOT NULL ORDER BY change_from_prior_month ASC;
