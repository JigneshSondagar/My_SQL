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


	

