SELECT P,I,O ,
    SUM(I) 
    OVER ( partition by O
      ORDER BY O
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) running_total
FROM "D2I_TRAINING"."PUBLIC"."EXAMPLE_CUMULATIVE"
ORDER BY O