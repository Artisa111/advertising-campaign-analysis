WITH MonthlyCampaignData AS (
    SELECT
        DATE_TRUNC('month', ad_date)::DATE AS ad_month,
        COALESCE(LOWER(SUBSTRING(url_parameters FROM 'utm_campaign=([^&]+)')), 'unknown') AS utm_campaign,
        SUM(COALESCE(spend, 0)) AS total_spend,
        SUM(COALESCE(impressions, 0)) AS total_impressions,
        SUM(COALESCE(clicks, 0)) AS total_clicks,
        SUM(COALESCE(value, 0)) AS total_value,
        ROUND(SUM(COALESCE(clicks, 0))::NUMERIC / NULLIF(SUM(COALESCE(impressions, 0)), 0), 4) AS ctr,
        ROUND(SUM(COALESCE(spend, 0))::NUMERIC / NULLIF(SUM(COALESCE(clicks, 0)), 0), 4) AS cpc,
        ROUND(SUM(COALESCE(spend, 0))::NUMERIC * 1000 / NULLIF(SUM(COALESCE(impressions, 0)), 0), 2) AS cpm,
        ROUND(SUM(COALESCE(value, 0))::NUMERIC / NULLIF(SUM(COALESCE(spend, 0)), 0), 4) AS romi
    FROM (
        SELECT ad_date, url_parameters, spend, impressions, clicks, value FROM facebook_ads_basic_daily
        UNION ALL
        SELECT ad_date, url_parameters, spend, impressions, clicks, value FROM google_ads_basic_daily
    ) AS combined_ads_data
    GROUP BY ad_month, utm_campaign
),
MonthlyWithDiff AS (
    SELECT
        *,
        LAG(cpm) OVER (PARTITION BY utm_campaign ORDER BY ad_month) AS prev_cpm,
        LAG(ctr) OVER (PARTITION BY utm_campaign ORDER BY ad_month) AS prev_ctr,
        LAG(romi) OVER (PARTITION BY utm_campaign ORDER BY ad_month) AS prev_romi
    FROM MonthlyCampaignData
),
FinalData AS (
    SELECT
        ad_month,
        utm_campaign,
        total_spend,
        total_impressions,
        total_clicks,
        total_value,
        ctr,
        cpc,
        cpm,
        romi,
        ROUND(ABS((cpm - prev_cpm) / NULLIF(prev_cpm, 0)) * 100, 2) AS cpm_diff_pct,
        ROUND(ABS((ctr - prev_ctr) / NULLIF(prev_ctr, 0)) * 100, 2) AS ctr_diff_pct,
        ROUND(ABS((romi - prev_romi) / NULLIF(prev_romi, 0)) * 100, 2) AS romi_diff_pct
    FROM MonthlyWithDiff
    WHERE prev_cpm IS NOT NULL AND prev_ctr IS NOT NULL AND prev_romi IS NOT NULL
        AND ROUND(ABS((cpm - prev_cpm) / NULLIF(prev_cpm, 0)) * 100, 2) != 0
        AND ROUND(ABS((ctr - prev_ctr) / NULLIF(prev_ctr, 0)) * 100, 2) != 0
        AND ROUND(ABS((romi - prev_romi) / NULLIF(prev_romi, 0)) * 100, 2) != 0
)
SELECT *
FROM FinalData
ORDER BY ad_month, utm_campaign;
