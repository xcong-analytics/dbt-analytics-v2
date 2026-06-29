WITH engagements_summary AS (
    SELECT
        e.PHYSICIAN_ID,
        COUNT(CASE WHEN e.ROLE = 'Attendee' THEN 1 END) AS conference_attendance,
        COUNT(CASE WHEN e.ROLE = 'Speaker' THEN 1 END) AS speaking_events,
        COUNT(CASE WHEN e.ROLE = 'Chair' THEN 1 END) AS chair_events
    FROM {{ ref('stg_engagements') }} e
    GROUP BY e.PHYSICIAN_ID
)

SELECT
    p.PHYSICIAN_ID,
    p.NAME,
    p.SPECIALTY,
    p.CITY,
    p.YEARS_EXPERIENCE,
    p.PUBLICATIONS,
    COALESCE(es.conference_attendance, 0) AS conference_attendance,
    COALESCE(es.speaking_events, 0) AS speaking_events,
    COALESCE(es.chair_events, 0) AS chair_events,
    ROUND(
        COALESCE(es.conference_attendance, 0) * 0.4 +
        COALESCE(es.speaking_events, 0) * 0.4 +
        p.PUBLICATIONS * 0.2
    , 2) AS engagement_score
FROM
{{ ref('stg_physicians') }} p
LEFT JOIN engagements_summary es ON p.PHYSICIAN_ID = es.PHYSICIAN_ID
