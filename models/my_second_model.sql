SELECT my_first_column, my_first_column * 2 AS doubled FROM {{ ref('my_first_model') }}
