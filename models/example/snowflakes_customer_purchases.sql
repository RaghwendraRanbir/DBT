with CUSTOMER as(
    select * 
    from {{source('sample','CUSTOMER')}}
),

ORDERS as(
    select * from {{source('sample','ORDERS')}}
)

select
c.C_CUSTKEY,
c.C_NAME,
c.c_nationkey as nation
,sum(o.O_TOTALPRICE) as totol_price
from CUSTOMER c
-- "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."CUSTOMER" c
left join 
ORDERS o
-- "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."ORDERS" o
on c.C_CUSTKEY=o.O_CUSTKEY

---below ll if run only if env is dev 

-- %if target.name=='dev'%
-- where year(o.o_orderdate)=1996
-- % endif %

{{group_by(3)}}
---GROUP BY 1,2,3
