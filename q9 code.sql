with cte1 as(
select 
c.channel, round(sum(gp.gross_price*s.sold_quantity)/1000000,2) as gross_sales_mln
from dim_customer c
join fact_sales_monthly s
on s.customer_code=c.customer_code
join fact_gross_price gp
on s.fiscal_year=gp.fiscal_year and s.product_code=gp.product_code
where s.fiscal_year=2021
group by c.channel
order by gross_sales_mln desc)
select channel,gross_sales_mln, round(gross_sales_mln*100/sum(gross_sales_mln) over(),2) as percentage from cte1;