SELECT * FROM gdb023.fact_sales_monthly;
select
quarter(date_add(s.date,interval 4 month)) as quarter,sum(sold_quantity) as total_sold_quantity
from fact_sales_monthly s
where fiscal_year=2020
group by quarter
order by total_sold_quantity desc;