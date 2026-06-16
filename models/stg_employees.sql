SELECT *
FROM {{ source('raw', 'EMPLOYEES') }}
