# Data Dictionary

### accounts.csv
account_id = unique customer; created_at = signup date; region = commercial region; segment = SMB/Mid-Market/Enterprise; acquisition_channel = first-touch channel.

### subscriptions.csv
subscription_id = subscription key; account_id = customer key; plan_id = plan key; started_at = service start; ended_at = service end/churn date (blank if active at period end); status = active/cancelled; seats = purchased seats; mrr = monthly recurring revenue.

### plans.csv
plan_id, plan_name, monthly_price, included_seats.

### customer_monthly_activity.csv
One row per customer-month while active: account_id, snapshot_month, cohort_month, is_cohort_month, plan_id, mrr, acquisition_channel, region, segment, months_since_cohort.
