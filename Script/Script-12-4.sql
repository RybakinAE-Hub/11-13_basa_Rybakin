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
