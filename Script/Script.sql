SELECT * FROM film;

SELECT distinct district from address where district like 'K%a' and district not like '% %';

select payment_id , payment_date, amount from payment WHERE payment_date between '2005-06-15' 
and '2005-06-19' and amount > 10.00 order by payment_date desc;

select payment_id , payment_date, amount from payment order by payment_id desc limit 5;

select last_name , first_name from customer;
select first_name from customer;

select LOWER (last_name) , LOWER(first_name) , LOWER (replace(first_name , 'LL' , 'pp')) 
from customer where first_name = 'kelly' or first_name = 'willie';

select concat(s.first_name, ' ',s.last_name) as имя ,c.city as город, count(c2.first_name)as аренд
from staff s
join address a on a.address_id =s.address_id 
join city c on a.city_id =c.city_id
join store s2 on s2.store_id =s.store_id 
join customer c2 on s2.store_id =c2.store_id
group by c.city ,s.first_name ,s.last_name 
having count(c2.customer_id) > 300;

select COUNT('length') больше_средьнего 
from film f 
where length > (select avg(length) from film);

select date_format(payment_date, '%Y-%M') as дата, count(payment_id) as аренд, sum(amount)as сумма
from payment 
group by date_format(payment_date, '%Y-%M')
order by sum(amount) desc 
limit 1;

explain format = traditional
select * from customer c
join address a on a.address_id = c.address_id 
join city c2 on c2.city_id = a.city_id 
where c2.city_id =17;

#explain analyze
select * from customer c
join address a on a.address_id = c.address_id 
join city c2 on c2.city_id = a.city_id 
where c2.city_id =17;
        
create table film_temp (
film_id INT,
title VARCHAR(50),
description TEXT,
language_id INT,
release_year INT
);

SELECT * FROM film_temp;

INSERT into film_temp 
select film_id, title, description, language_id, release_year 
from film;

select  sum(data_length), sum(index_length) , round ((sum(index_length) / sum(data_length)) *100) as процент
from information_schema.tables
where table_schema = 'sakila';

#оригинал
select distinct concat(c.last_name, ' ', c.first_name), sum(p.amount) over (partition by c.customer_id, f.title)
from payment p, rental r, customer c, inventory i, film f
where date(p.payment_date) = '2005-07-30' and p.payment_date = r.rental_date and r.customer_id = c.customer_id and i.inventory_id = r.inventory_id and c.customer_id  = '2';

select concat(c.last_name, ' ', c.first_name)as имя, sum(p.amount)
from payment p, rental r, customer c
where date(p.payment_date) = '2005-07-30' 
and p.payment_date = r.rental_date 
and r.customer_id = c.customer_id 
group by имя;

select * from amount;

create table amount (
last_name varchar(20),
first_name varchar(20),
payment datetime,
amount decimal(5.2));

insert into amount 
select last_name, first_name, payment, amount from customer;

SELECT * FROM INFORMATION_SCHEMA.STATISTICS
WHERE TABLE_NAME='amount';
                           
                           
                           
                           
