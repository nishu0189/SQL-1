
--ABOUT THE DIFF TYPE OF COSTRAIN --

create table amz (id int not null unique , -- unique can be null but not null constraint cant be null  
or_date date,
name varchar(20) ,
qnt int, price int,
mode varchar(10) check(mode in ('cash','debit','online')), --check constraint
discount int check(discount <= 30),
city varchar(20) default 'Delhi',
primary key(id,name) --combination of 2 col should be unique  and primary key is not null+ unique 
);

--drop table amz;
alter table amz
alter column or_date datetime;
select * from  amz;
insert into amz (id,or_date,name,qnt,price,mode,discount,city)
values(1, '2004-02-17 23:15:40', 'dress', 2, 2000, 'online',10,'delhi'),
(2, '2002-04-01 20:19:05', 'shoes', 3, 5000, 'cash',5,'pune'),
(3, '2023-06-15', 'watch', 1, 1500, 'debit',25, 'mumbai'),
(4, '2023-07-10', 'laptop', 1, 50000, 'online',30, 'delhi'),
(5, '2024-01-25', 'headphones', 3, 6000, 'cash', 29,'kolkata'),
(6, '2022-11-30', 'mobile', 2, 25000, 'debit', 13,'bangalore');
--way 1 (not showing the col city) DEFAULT
INSERT INTO amz (id, or_date, name, qnt, price, mode, discount) --default key 
VALUES (7, '2022-11-30', 'book', 1, 250, 'debit', 13); -- automatic get the delhi in city col

--way 2 (not showing the col city) DEFAULT
INSERT INTO amz (id, or_date, name, qnt, price, mode, discount,city) --default key 
VALUES (8, '2022-11-30', 'book', 1, 250, 'debit', 13,default); -- automatic get the delhi in city col


INSERT INTO amz (id, or_date, name, qnt, price, mode, discount) --not RUN
VALUES (9, '2022-11-30', 'book', 1, 250, 'card', 15); --check constrait will show conflicted

INSERT INTO amz (id, or_date, name, qnt, price, mode) --no discount  no city
VALUES (10, '2022-11-30', 'pen', 10, 150, 'online');--if we do not give value in any col then it show null in discount

select * from  amz;