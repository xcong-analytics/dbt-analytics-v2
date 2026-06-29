SELECT
    PHYSICIAN_ID,
    NAME,
    SPECIALTY,
    CITY,
    ENGAGEMENT_SCORE,
    CASE
        WHEN ENGAGEMENT_SCORE >= 20 THEN 'Tier A'
        WHEN ENGAGEMENT_SCORE >= 10 THEN 'Tier B'
        ELSE 'Tier C'
    END AS TIER
FROM {{ ref('physician_engagement_score') }}
