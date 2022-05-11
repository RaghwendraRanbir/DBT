select
c.C_CUSTKEY,
c.C_NAME,
c.c_nationkey as nation
,sum(o.O_TOTALPRICE) as totol_price
from {{source('sample','CUSTOMER')}} c
-- "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."CUSTOMER" c
left join 
{{source('sample','ORDERS')}} o
-- "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."ORDERS" o
on c.C_CUSTKEY=o.O_CUSTKEY
GROUP BY 1,2,3
