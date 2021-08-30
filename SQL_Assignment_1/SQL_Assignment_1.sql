show databases;

CREATE database SQL_Assignment;

use SQL_Assignment;

CREATE table Product(
Code int(4),
Name varchar(15),
Price int(5),
Manufacturer int(1)
);

CREATE table Manufactures(
Code int(4),
Name varchar(20)
);


INSERT into Product(Code,Name,Price,Manufacturer)
values (1,"Hard drive",240,5),
	   (2,"Memory",120,6),
	   (3,"ZIP drive",150,4),
	   (4,"Floppy disk",5,6),
	   (5,"Moniter",240,1),
	   (6,"DVD drive",180,2),
	   (7,"CD drive",90,2),
	   (8,"Printer",270,3),
	   (9,"Toner cartridge",66,3),
	   (10,"DVD burner",180,2);
	  
INSERT into Manufactures (Code,Name)
values (1,"Sony"),
		(2,"Creative Labs"),
		(3,"Hewlett-packard"),
		(4,"Lomega"),
		(5,"Fujitsu"),
		(6,"Winchester");
	

SELECT * from Product ;

SELECT * from Manufactures ;

# 1 Select the names of all the products in the store
select Name from Product ;


# 2 Select the names and the prices of all the products in the store
SELECT Name, Price from Product ;


# 3 Select the name of the products with a price less than or equal to $200.
select Name , Price from Product  where Price <=200;


# 4 Select all the products with a price between $60 and $120.
SELECT Name, Price from Product where Price BETWEEN 60 and 120 ;


# 5 Select the name and price in cents (i.e. the price must be multiplied by 100).
SELECT Name,Price*100 from Product ;


# 6 Compute the average price of all the products.
SELECT AVG(Price) from Product ;


# 7. Compute the average price of all products with manufacturer code equal to 2.
SELECT AVG(Price) from Product where Manufacturer = 2;


# 8. Compute the number of products with a price larger than or equal to $180.
SELECT COUNT(*) from Product WHERE Price >= 180;


# 9. Select the name and price of all products with a price larger than or equal to $180,
#    and sort first by price (in descending order), and then by name (in ascending order).
SELECT Name, Price from Product WHERE Price >= 180 ORDER BY Price DESC, Name ASC;


# 10.Select all the data from the products, including all the data for each product's manufacturer.
select * from Product inner join Manufactures ;


# 11.Select the product name, price, and manufacturer name of all the products.
SELECT p.Name, p.Price, m.Name from Product p 
join Manufactures m 
on p.Code = m.Code;


# 12.Select the average price of each manufacturer's products, showing only the manufacturer's code.
SELECT AVG(p.Price) Avarage_Price, p.Manufacturer from Product p 
join Manufactures m 
GROUP BY p.Manufacturer ;


# 13.Select the average price of each manufacturer's products, showing the manufacturer's name.
SELECT AVG(Price) , m.Name from Product p 
join Manufactures m 
on p.Code = m.Code
GROUP BY m.Name;


# 14.Select the names of manufacturer whose products have an average price larger than or equal to $150.
SELECT AVG(p.Price) Avrage_price, m.Name from Product p 
join Manufactures m 
on p.Code = m.Code
GROUP BY m.Name
HAVING AVG(p.Price) >= 150;


# 15.Select the name and price of the cheapest product.
SELECT Name, Price from Product ORDER BY Price ASC LIMIT 1;


# 16.Select the name of each manufacturer along with the name and price of its most expensive product.
SELECT m.Name, p.Name, p.Price from Manufactures m 
join Product p 
on m.Code = p.Code
ORDER BY p.Price DESC ;


# 17. Add a new product: Loudspeakers, $70, manufacturer 2.
INSERT into Product values(11,'Loudspeakers',70,2);


# 18.Update the name of product 8 to "Laser Printer".
UPDATE  Product set Name='Laser Printer' WHERE Code=8;


# 19.Apply a 10% discount to all products.
SELECT Code,Name, Price, Price - Price*0.10 as Discount_Price, Manufacturer from Product ;


# 20.Apply a 10% discount to all products with a price larger than or equal to $120.
SELECT Code,Name,Price,Price - Price*0.10 as Discount_Price from Product WHERE Price >= 120;



