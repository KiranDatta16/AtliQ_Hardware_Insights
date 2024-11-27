select
c.customer,c.customer_code,round((pi.pre_invoice_discount_pct)*100,2)as avg_discount_pct
from fact_pre_invoice_deductions pi
join dim_customer c
on pi.customer_code= c.customer_code
where pi.fiscal_year=2021 and c.market="India"
group by customer
order by avg_discount_pct desc
limit 6;