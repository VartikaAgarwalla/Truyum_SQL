
use truyum;
show tables;
create table  menu_item(
Menu_item_id int auto_increment primary KEY,
Name varchar(100),
Price decimal(8,2),
Active varchar(20),
DateofLaunch datetime,
Category varchar(30),
FreeDelivery varchar(20),
Action varchar(20)
);

INSERT INTO menu_item(Name,Price,Active,DateofLauch,Category,FreeDelivery) VALUES("Sandwich",99.00,"Yes",15/03/2017,"Main Course","Yes","Edit");
INSERT INTO menu_item(Name,Price,Active,DateofLauch,Category,FreeDelivery) VALUES("Burger",129.00,"Yes",23/12/2017,"Main Course","Yes","Edit");
INSERT INTO menu_item(Name,Price,Active,DateofLauch,Category,FreeDelivery) VALUES("Pizza",149.00,"Yes",21/08/2017,"Main Course","Yes","Edit");
INSERT INTO menu_item(Name,Price,Active,DateofLauch,Category,FreeDelivery) VALUES("French Fries",57.00,"No",02/07/2017,"Main Course","Yes","Edit");
INSERT INTO menu_item(Name,Price,Active,DateofLauch,Category,FreeDelivery) VALUES("Chocolate Brownie",32.00,"Yes",02/11/2022,"Main Course","Yes","Edit");

SELECT Name, CONCAT("Rs. ",Price) as Price,Active,DateofLaunch,Category,FreeDelivery 
FROM menu_item;

SELECT Name,FreeDelivery,CONCAT("Rs. ",Price) as Price,Category
from menu_item
where DateofLaunch<NOW() AND Active="Yes";

select Name, CONCAT("Rs. ",Price) as Price,Active,DateofLaunch,Category,FreeDelivery 
FROM menu_item where menu_item_id=4;

update menu_item set price=100.00
where menu_item_id=5;

create table user (
user_id int auto_increment primary key,
user_name varchar(100)
);
insert into user(user_name) VALUES ("Rina");
insert into user(user_name) VALUES ("Mina");

Create table Cart(
cart_id int auto_increment primary key,
user_id int,
menu_item_id int,
constraint fk foreign key(user_id) references user(user_id),
constraint fk1 foreign key(menu_item_id) references menu_item(menu_item_id)
);

insert into cart(user_id,menu_item_id) values(1,4);
insert into cart(user_id,menu_item_id) values(1,3);
insert into cart(user_id,menu_item_id) values(1,1);

select * from menu_item m
inner join cart c on m.menu_item_id=c.menu_item_id
inner join user u on c.user_id=u.user_id
where c.user_id=1;

select concat("Total Rs. ",SUM(Price)) from menu_item m
inner join cart c on m.menu_item=c.menu_item
inner join user u on c.user_id=u.user_id
where c.user_id=1;

delete from cart c
where c.user_id=1 and menu_item_id=4;











