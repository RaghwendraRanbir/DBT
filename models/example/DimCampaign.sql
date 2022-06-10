{{ 
    config(
        materialized='incremental')
}}
select 
_FILE AS FILE,
_LINE AS LINE,
_MODIFIED AS MODIFIED,
CUSTOMER_ID	AS CUSTOMER_ID,
FIRST_NAME	AS FIRST_NAME,
LAST_NAME	AS LAST_NAME,
EMAIL	AS EMAIL,
GENDER	AS GENDER,
CAMPAIGN_ID	AS CAMPAIGN_ID,
IS_SUCCESS	AS IS_SUCCESS,
to_date(CAMPAIGN_DATE) AS CAMPAIGN_DATE,
_FIVETRAN_SYNCED AS FIVETRAN_SYNCED
from {{source('dim_camp','STG_CAMPAIGN')}}
{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  where to_date(_FIVETRAN_SYNCED) > (select max(to_date(FIVETRAN_SYNCED)) from {{ this }})

{% endif %}