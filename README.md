# Advertising Campaign Performance Analysis Project

## Project Objective
The objective of this project is to consolidate and analyze advertising campaign data from various sources (Facebook and Google) to provide a comprehensive assessment of their monthly performance and identify significant metric changes that warrant further investigation and optimization.

## SQL Code Description
The SQL code consolidates daily advertising data from `facebook_ads_basic_daily` and `google_ads_basic_daily` tables. It groups this data by month and UTM campaign, calculating key metrics such as total spend, impressions, clicks, and value. Subsequently, derived metrics are computed: CTR (Click-Through Rate), CPC (Cost Per Click), CPM (Cost Per Mille), and ROMI (Return On Marketing Investment). Finally, the code calculates the month-over-month percentage change for CPM, CTR, and ROMI for each campaign, filtering to show only non-zero changes.

## Expected Results and Insights
The expected output is a table presenting monthly advertising campaign data with calculated performance metrics (CTR, CPC, CPM, ROMI) and their percentage changes from the previous month. This analysis enables businesses to:
* Quickly identify campaigns experiencing significant shifts in cost (CPM), engagement (CTR), or return (ROMI).
* Focus attention on campaigns that require immediate optimization or further investigation.
* Track campaign performance trends over time.
* Make more informed decisions regarding marketing budget allocation.

## Technologies Used
* SQL (PostgreSQL)
* Data Analysis (Data Consolidation, Key Metric Calculation, Time-Series Analysis)

## Output Format
The output will be a table with columns: `ad_month` (month), `utm_campaign` (campaign name), `total_spend`, `total_impressions`, `total_clicks`, `total_value`, `ctr`, `cpc`, `cpm`, `romi`, `cpm_diff_pct` (percentage change in CPM), `ctr_diff_pct` (percentage change in CTR), `romi_diff_pct` (percentage change in ROMI). The data will be ordered by month and campaign name.
