Create Table KMS_dbORDERS(
[Row_ID] INT,
[Order_ID] INT,
[Order_Date]Date,
[Order_Priority]Varchar(50),
[Order_Quantity]Int,
Sales Decimal (10,2),
Discount Decimal(10,2),
[Ship_Mode]Varchar (50),
[Unit_Price]Decimal(10,2),
Profit decimal (10,2),
[Shipping_Cost] Decimal(10,2),
[Customer_Name]Varchar (255),
Province Varchar (100),
Region Varchar (100),
[Customer_Segnment] nvarchar(100),
[Product_Category] nvarchar (100),
[Product_Sub-Category]nVarchar(100),
[Product_Name]nVarchar,
[Product_Container]Varchar (100),
[Product_Base Margin] Decimal(10,2),
[Ship_Date] Date
)

--Q.1 Product Category with highest sales

select product_category, sum([Sales]) as [Total sales]
from [dbo].[KMS SQL case study]
group by product_category
order by [Total sales]desc

[dbo].[KMS SQL case study]
select * from [dbo].[KMS SQL case study]
CREATE DATABASE KULGAR_DB


----Q.2a Top three 

select top 3 region, sum(sales) as [total sales]
from [dbo].[KMS SQL case study]
group by region 
order by [total sales] asc

----Q.2b Bottom three
select top 3 region, sum(sales) as [total sales]
from [dbo].[KMS SQL case study]
group by region 
order by [total sales] desc


----Q.3 Total Sales in Ontario

select product_sub_category, sum(sales) as [total sales]
   from [dbo].[KMS SQL case study]
where Region ='ontario'
group by product_sub_category


-----Q.4 
select top 10 customer_Name,shipping_cost,sales,Discount,unit_price,sum(order_quantity)as [total order_quantity]
  from[dbo].[KMS SQL case study]
group by customer_name,shipping_cost,sales,discount, unit_price
order by [total order_quantity]asc

-----Q.5 KMS Most Shipping Method

select Ship_mode, sum([shipping_cost]) as [total shipping_cost]
from[dbo].[KMS SQL case study]
group by ship_mode
order by [total shipping_cost]asc



----Q.6 Most Valuable Customer and Their Purchase

select customer_segment,product_sub_category,customer_name, sum([sales])as [total sales]
from[dbo].[KMS SQL case study]
group by customer_segment,product_sub_category,customer_name
order by [total sales]desc


----Q.7 Small Business Customer With Highest Sales
Select top 1 *
from [dbo].[KMS SQL case study]
where customer_segment ='small business'
order by sales desc

-----Q.8 Coporate customer With Number of order in 2009-2012

select top 1*
from [dbo].[KMS SQL case study]
where customer_segment ='corporate'
order by order_quantity desc

------Q.9 Customer With the Most Profitable Product
select top 1 *
from [dbo].[KMS SQL case study]
where customer_segment = 'consumer'
order by profit desc

------Q.10 Returned Item and their Segment

 select customer_name, customer_segment,product_category,product_sub_category
    from [dbo].[KMS SQL case study]
    join [dbo].[order_status]
    on [dbo].[KMS SQL case study].order_ID = [dbo].[order_status].Order_ID

	---Q.11-

select 
"Ship_Mode",
Avg("Shipping_Cost") as Averageshippingcost
from [dbo].[KMS SQL case study]
Group by
"ship_Mode"
Order by
Averageshippingcost desc;

	select
	(order_Priority),
	(Ship_Mode),
	count(*)as Number_of_Orders,
	Sum(Shipping_cost) as
	Total_Shipping_cost,
	Avg(shipping_cost) as avg_Shipping
	from
	[KMS SQL case study]
	Group by
	(Order_Priority),(Ship_mode)
	order by
	case (order_priority)
	When 'Critical' Then 1
	When 'High' Then 2
	When 'Medium' then 3
	When 'Low' then 4
	Else 5
	End
	Ship_Mode


