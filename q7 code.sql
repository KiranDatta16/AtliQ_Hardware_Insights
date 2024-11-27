SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

select
monthname(s.date) as month,s.fiscal_year as year, sum((gp.gross_price*s.sold_quantity)) as gross_sales_amount
from fact_sales_monthly s
join dim_customer c
on s.customer_code=c.customer_code
join fact_gross_price gp
on s.product_code=gp.product_code and s.fiscal_year=gp.fiscal_year
where c.customer="Atliq Exclusive"
group by month,year
order by year;