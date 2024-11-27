with cte1 as(
SELECT product_code,fiscal_year,
count(distinct(product_code)) as unique_products_2020 from fact_gross_price
where fiscal_year=2020),
cte2 as(
SELECT count(distinct(product_code)) as unique_products_2021 from fact_gross_price
where fiscal_year= 2021)
select cte1.unique_products_2020,cte2.unique_products_2021,
((cte2.unique_products_2021-cte1.unique_products_2020)*100/cte1.unique_products_2020)as pct_change 
from cte1,cte2;
