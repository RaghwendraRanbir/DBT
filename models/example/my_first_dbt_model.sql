
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
    we cant create database from dbt, just create and grant in snowflakes
*/

{{ config(materialized='table',alias='First_model',schema='ranbir_test',database='analytics_test') }}

with source_data as (

    select 1 as id
    union all
    select null as id

)

select *,{{var('my_first_var')}} as firt_var
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
