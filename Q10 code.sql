with cte1 as(
select
p.division,p.product_code,p.product,sum(s.sold_quantity) as total_sales_quantity,
dense_rank() over(partition by p.division order by sum(s.sold_quantity) desc) as rank_order
from dim_product p
join fact_sales_monthly s
on p.product_code=s.product_code
where s.fiscal_year=2021
group by p.product,p.product_code,p.division)
select division,product_code,product,total_sales_quantity,rank_order from cte1
where rank_order<=3;