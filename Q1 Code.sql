SELECT distinct(market) from dim_customer
where customer= "Atliq Exclusive" and region="APAC"
ORDER BY market asc;