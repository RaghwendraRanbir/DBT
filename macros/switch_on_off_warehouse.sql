{% macro suspend(warehousename) %}

{% set sql%}
  alter warehouse {{warehousename}} suspend/resume
{% endset %}
{%set table =run_query(sql)%}
{%do table.print_table() %}  ---print the table to run in termianl command :- dbt run-operation suspend --args '{warehouse_name:value}'

{%endmacro%}