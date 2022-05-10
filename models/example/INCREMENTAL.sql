{{ config(materialized='incremental')}}
select * from "DATA_TO_INSIGHTS"."GOOGLE_SHEETS_TEST"."SAMPLE_TABLE" 
---where to_date(_FIVETRAN_SYNCED)<= current_date

{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  where to_date(_FIVETRAN_SYNCED) > (select max(to_date(_FIVETRAN_SYNCED)) from {{ this }})

{% endif %}