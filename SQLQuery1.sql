use  pizza_analysis1;
select* from ps;

--Total Revenue

select sum(total_price) as revenue
from ps;

--Average Revenue

select AVG(total_price) as Average_Revenue
from ps;

--Average orders

select sum(total_price)/count(distinct order_id) as Average_Orders
from ps;



--Total Orders

select count(distinct order_id) as OI
from ps;


--3. Total Pizzas Sold


select sum(quantity) as Pizza_sold
from ps;

--4. Total Orders

select count(distinct order_id) as Total_Orders
from ps;

--5. Average Pizzas Per Order


SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM ps


--6.Daily Trend for Total Orders

select DATENAME(dw,order_date) as Daily_orderdate,count(distinct order_id)  as OI
from ps
group by DATENAME(dw,order_date)
order by OI desc

--7. Hourly Trend for Orders


select DATEpart(hour,order_time) as Daily_hr_orders,count(distinct order_id) as OI 
from ps
group by DATEPART(hour,order_time) 
order by OI desc

--8. % of Sales by Pizza Category

Select * from ps;


select pizza_category, CAST(sum(total_price) as decimal (10,2)) as TR,
cast(sum(total_price)*100/(SELECT SUM(total_price) from ps) AS DECIMAL(10,2)) AS PCT
from ps
group by pizza_category

--9.% of sales by pizza size

select pizza_size, cast(sum(total_price) as decimal(10,2)) as TR,
cast(sum(total_price)*100/(select sum(total_price) from ps) as decimal(10,2)) as PCT 
from ps
group by pizza_size

--10.Total pizza sold in February by pizza category


select pizza_category, sum(quantity) as Pizza_Sold_in_Feb
from ps
where month(order_date) =2
group by pizza_category 
order by Pizza_Sold_in_Feb

--11. Top 5 Best Sellers by Total Pizzas Sold

select* from ps;
select top 5 pizza_name,sum(quantity)as Pizza_sold
from ps
group by pizza_name 
order by Pizza_sold desc
