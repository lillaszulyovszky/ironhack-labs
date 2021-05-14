#Write a SELECT statement that lists the customerid along with their account number, type, 
#the city the customer lives in and their postalcode.

SELECT c.CustomerID, c.AccountNumber, c.CustomerType, a.City, a.PostalCode
FROM adventureworks.customer c
JOIN adventureworks.customeraddress ca
ON c.CustomerID = ca.CustomerID
JOIN adventureworks.address a
ON ca.AddressID = a.AddressID;

#Write a SELECT statement that lists the 20 most recently launched products, their name and colour

SELECT p.Name, p.Color, p.SellStartDate
FROM adventureworks.product p
ORDER BY SellStartDate DESC
LIMIT 20;

#Write a SELECT statement that shows how many products are on each shelf in 2/5/98, 
#broken down by product category and subcategory

SELECT count(i.ProductID), i.Shelf, p.ProductSubCategoryID
FROM productinventory i
JOIN product p ON i.ProductID=p.ProductID
where ModifiedDate = '1998-05-02 00:00:00'
group by Shelf, p.ProductSubCategoryID, i.ModifiedDate;

# best practice
Select t1.field, t2, field
from table t1
join t2
join t3
where
group by
having 
order by
limit;

#I am trying to track down a vendor email address… 
#his name is Stuart and he works at G&K Bicycle Corp. Can you help?

SELECT c.FirstName, c.LastName, v.Name, c.EmailAddress
FROM contact c 
JOIN vendorcontact vc using (ContactID)
JOIN vendor v using(VendorID);

#What’s the total sales tax amount for sales to Germany? 
#contactWhat’s the top region in Germany by sales tax?

SELECT sum(TaxAmt) 
FROM salesorderheader
WHERE TerritoryID='8';

#Summarise the distinct # transactions by month
