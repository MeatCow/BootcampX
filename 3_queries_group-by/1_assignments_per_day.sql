SELECT DAY,
  COUNT(*)
FROM assignments
GROUP BY DAY
ORDER BY DAY;