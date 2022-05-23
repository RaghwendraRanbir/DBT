
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
    we cant create database from dbt, just create and grant in snowflakes
    
    -- config(post_hook=["grant select on {{ this }} to role reporter"])
    config(materialized='table',alias='First_model',schema='ranbir_test',database='analytics_test',tags='nightly')
    dbt run --model tag:nightly

*/

{{ config(materialized='table') }}




with source_data as (

    select 1 as id,'SA' as state,'2022-05-11 01:29:22.617'::timestamp as updated_at
    union all
    select null as id ,'CT' as state,'2022-05-11 01:25:22.617'::timestamp as updated_at
    union all
    select 3 as id, 'CP' as state,'2022-05-11 01:25:22.617'::timestamp as updated_at

)

select *,{{var('my_first_var')}} as firt_var
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
