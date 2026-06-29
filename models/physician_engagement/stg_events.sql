SELECT
    EVENT_ID,
    EVENT_NAME,
    EVENT_TYPE,
    EVENT_DATE,
    CLIENT_ID
FROM {{ source('raw', 'EVENTS') }}
