with cte1 as(
select 
p.product_code,p.product,m.manufacturing_cost as manufacturing_cost
from fact_manufacturing_cost m
join dim_product p
on m.product_code=p.product_code
group by product)
select product,product_code,manufacturing_cost from cte1
where manufacturing_cost=(select max(manufacturing_cost) from cte1)
or manufacturing_cost=(select min(manufacturing_cost) from cte1)
order by manufacturing_cost desc;
