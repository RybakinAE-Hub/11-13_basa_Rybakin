select s.first_name,s.last_name,c.city, count(c2.first_name)
from staff s
join address a on a.address_id =s.address_id 
join city c on c.city_id =a.city_id
join customer c2 on c2.customer_id =c2.customer_id
group by c.city ,s.first_name ,s.last_name 
having count(c2.customer_id) > 300;

select COUNT('length') больше_средьнего from film f where length > (select avg(length) from film);

select month (payment_date), count(payment_id), sum(amount) from payment 
group by month (payment_date) order by sum(amount) desc limit 1;
