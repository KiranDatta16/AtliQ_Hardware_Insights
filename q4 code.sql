with x as(
select
p.segment,count(distinct(p.product_code)) as product_count_2020
from dim_product p
join fact_gross_price g
on p.product_code=g.product_code
where g.fiscal_year=2020
group by p.segment),
y as (
select
p.segment,count(distinct(p.product_code)) as product_count_2021
from dim_product p
join fact_gross_price g
on p.product_code=g.product_code
where g.fiscal_year=2021
group by p.segment)
select x.segment,
x.product_count_2020,y.product_count_2021,(y.product_count_2021-x.product_count_2020) as difference
from x
join y
on x.segment=y.segment
group by segment
order by difference desc;
