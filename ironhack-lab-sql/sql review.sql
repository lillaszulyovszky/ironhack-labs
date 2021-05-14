Write a SELECT statement that lists the customerid 
along with their account number, type, 
the city the customer lives in and their postalcode.

select c.CustomerID, c.AccountNumber, c.CustomerType,
a.City, a.PostalCode
from customer c
join customeraddress ca on c.CustomerID =ca.CustomerID #Using(CustomerID
join address a on ca.AddressID=a.AddressID;

Write a SELECT statement that lists the 20 most recently
 launched products, their name and colour
 
 SELECT p.ProductID, p.Color, p.Name  
 FROM product p
 order by SellStartDate DESC
 LIMIT 20;
 
 Write a SELECT statement that shows how many products 
 are on each shelf in 2/5/98, 
 (broken down by product category and subcategory)- all nulls 
 
select count(i.ProductID), i.Shelf, p.ProductSubcategoryID
from productinventory i
join product p on i.ProductID=p.ProductID
where i.ModifiedDate = '1998-05-02 00:00:00'
group by Shelf, p.ProductSubcategoryID, i.ModifiedDate


general approach : 
select t1.field, t2, field  
FROM table t1
join table t2
join table t3
where
group by 
having 
order by 
limit 


I am trying to track down a vendor email address… his name is Stuart and he works at G&K Bicycle Corp. Can you help?

select c.FirstName, c.LastName, v.Name, c.EmailAddress
from contact c 
join vendorcontact vc using (ContactID)
join vendor v using(VendorID)

What’s the total sales tax amount for sales to Germany? What’s the top region in Germany by sales tax?

select sum(TaxAmt) 
from salesorderheader
where TerritoryID='8';

select sum(TaxAmt), sp.Name
from salesorderheader s
join address a on s.BillToAddressID =a.AddressID
join stateprovince sp using(StateProvinceID)
where s.TerritoryID='8'
group by sp.Name
order by sum(TaxAmt) DESC
Limit 1;

Summarise the distinct # transactions by month

select distinct(count(TransactionID)), DATE_FORMAT(TransactionDate,'%Y%m')
from transactionhistory
group by DATE_FORMAT(TransactionDate,'%Y%m')

Which ( if any) of the sales people exceeded their sales quota this year and last year?

select SalesPersonID, SalesQuota, SalesYTD, SalesLastYear from salesperson
where SalesYTD>SalesQuota AND SalesLastYear > SalesQuota

Do all products in the inventory have photos in the database and a text product description? 

select p.ProductID from product p 
join productproductphoto ph using(ProductID) 
where ph.ProductPhotoID = '1';

# answer : NO (and no need to investigate the description)


# What's the average unit price of each product name on purchase orders which were not fully, but at least partially rejected?

select p.Name, round(avg(d.UnitPrice),2)
from purchaseorderdetail as d 
join product p using(ProductID)
where d.PurchaseOrderID in 
(select PurchaseOrderID from purchaseorderdetail where RejectedQty >0 and RejectedQty < ReceivedQty ) 
group by p.Name
order by p.Name

How many engineers are on the employee list? Have they taken any sickleave?

select count(EmployeeID), sum(SickLeaveHours)
from employee
where title like '%ngineer%'


How many days difference on average between the planned and actual end date of workorders in the painting stages?

select l.Name, AVG(DATEDIFF( w.ActualEndDate, w.ScheduledEndDate ))
from workorderrouting w
join location l using (LocationID)
where l.Name LIKE '%aint%'
group by l.Name
order by AVG(DATEDIFF( w.ActualEndDate, w.ScheduledEndDate )) DESC








 
 
 
 
 
 