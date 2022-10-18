--CLASS/PROJECT WORK (GODSGIFT)
--1.Find out the names of the account that sold the most between 2015 and 2016:

select "account_name", sum("total_amount") as "sales_total"
from
(select a.name "account_name", o.total_amt_usd "total_amount", o.occurred_at "date"
from "accounts1" a  
join "orders" o
on o.account_id = a.id
where o.occurred_at between ('2015-10-01') and ('2016-12-24')) as table_one
group by "account_name"
order by "sales_total" desc;

--2. Find out the total amount of direct sales made between 2015 and 2016:

select "direct_sales", sum("total_amount") as "total_amount"
from 
(select w.channel "direct_sales", o.total_amt_usd "total_amount", w.occurred_at "date"
from "web_events" w
join "accounts1" a
on a.id = w.account_id
join "orders" o
on a.id = o.account_id 
where "channel" in ('direct') and w.occurred_at between ('2015-10-06') and ('2016-12-24')) as "table_one"
group by "direct_sales"
order by "total_amount" desc;

--3. Which channel sold more using total amount in usd between 2015 and 2016:

select "channel", sum("total_amount") as "amount_total"
from 
(select w.channel "channel", o.total_amt_usd "total_amount", w.occurred_at "date"
from "web_events" w
join "accounts1" a
on a.i d = w.account_id
join "orders" o
on a.id = o.account_id 
where w.occurred_at between ('2015-10-06') and ('2016-12-24')) as "table_one"
group by "channel"
order by "amount_total" desc;

--4. Replace the null column with zero:
update "orders"
set "gloss_qty" = ('0'),"poster_qty" = ('0')
where "gloss_qty" and "poster_q ty" is ('null');

--PROJECT WORK
--Find out the account that made the most sales using total amount in usd on sarturday:

select "account_name", sum("total_amount") as "amount_total"
from
((select *,
case when "occurred_at" in ('2016-05-01') then 'Sunday'
     when "occurred_at" in ('2016-02-01') then 'Monday'
     when "occurred_at" in ('2016-05-31') then 'Tuesday'
	 when "occurred_at" in ('2016-03-02') then 'Wednesday'
	 when "occurred_at" in ('2015-11-05') then 'Thursday'
	 when "occurred_at" in ('2016-04-01') then 'Friday'
	 else 'Saturday' end as "week_days"
from "orders") as "table_one"
select a.name "account_name", o.total_amt_usd "total_amount"
from "accounts1" a
join "orders" o
on o.account_id = a.id) 
where "week_days" in ('Saturday') 
group by "account_name"
order by "amount_total" desc);


      

	
	

	























































































































