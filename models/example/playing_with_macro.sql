select 
c_custkey,
C_MKTSEGMENT,
{{rename_segments('C_MKTSEGMENT')}} c_mktsegment_adjustments
from {{source('sample','CUSTOMER')}}