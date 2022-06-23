{{ 
    config(
        materialized='incremental')
}}
select 
ROW_NUMBER() OVER (ORDER BY CAMPAIGN_ID) AS CAMPAIGN_ID,
CAMPAIGN_ID	AS CampaignSourceKey,
CUSTOMER_ID	AS CUSTOMER_ID,
FIRST_NAME	AS FIRST_NAME,
LAST_NAME	AS LAST_NAME,
EMAIL	AS EMAIL,
GENDER	AS GENDER,
IS_SUCCESS	AS IS_SUCCESS,
_MODIFIED AS MODIFIED,
to_date(CAMPAIGN_DATE) AS CAMPAIGN_DATE,
_FIVETRAN_SYNCED AS FIVETRAN_SYNCED
from {{source('dim_camp','STG_CAMPAIGN')}}
{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  where to_date(_FIVETRAN_SYNCED) > (select max(to_date(FIVETRAN_SYNCED)) from {{ this }})

{% endif %}