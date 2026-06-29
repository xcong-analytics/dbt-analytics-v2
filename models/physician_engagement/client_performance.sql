SELECT
    c.CLIENT_ID,
    c.CLIENT_NAME,
    c.BUDGET,
    COUNT(DISTINCT e.PHYSICIAN_ID) AS physician_count,
    ROUND(AVG(pes.ENGAGEMENT_SCORE), 2) AS avg_engagement_score,
    COUNT(DISTINCT e.EVENT_ID) AS event_count
FROM {{ ref('stg_pharma_clients') }} c
LEFT JOIN {{ ref('stg_events') }} ev ON c.CLIENT_ID = ev.CLIENT_ID
LEFT JOIN {{ ref('stg_engagements') }} e ON ev.EVENT_ID = e.EVENT_ID
LEFT JOIN {{ ref('physician_engagement_score') }} pes ON e.PHYSICIAN_ID = pes.PHYSICIAN_ID
GROUP BY c.CLIENT_ID, c.CLIENT_NAME, c.BUDGET
ORDER BY avg_engagement_score DESC
