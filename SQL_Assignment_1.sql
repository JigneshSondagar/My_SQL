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
	

