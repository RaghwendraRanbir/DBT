{% macro rename_segments(column_name) %}
 CASE
  WHEN {{column_name}} in ('BUILDING','HOUSEHOLD')
   THEN 'buildings'
  WHEN {{column_name}} in ('HOUSEHOLD')
   THEN 'households'
  WHEN {{column_name}} in ('FURNITURE')
   THEN 'furnitures'
  ELSE 'segment_2'
 END
{% endmacro %}
   