-- Question 1:
select first_name, last_name, district from customer
join address
on customer.address_id = address.address_id
where address.district = 'Texas';
-- Answer: see table below

-- Question 2:
select * from payment;
select * from customer;
select first_name, last_name, payment.amount from customer
join payment
on customer.customer_id = payment.customer_id
where amount > 6.99;
-- Answer: see table below

-- Question 3:
select customer_id, first_name, last_name from customer
where customer.customer_id in (
	select customer_id from payment
	group by customer_id
	having sum(amount) > 175
);
-- Answer: see table below

-- Question 4:
select * from customer;
select * from address;
select * from city;
select * from country;
select first_name, last_name, address.address, country from customer
join address
on customer.address_id = address.address_id
join city
on address.city_id = city.city_id
join country
on city.country_id = country.country_id
where country.country = 'Nepal';
-- Answer: Kevin Schuler

-- Question 5:
select * from staff;
select staff.staff_id, first_name, last_name, count(payment.staff_id) as c from payment
join staff
on payment.staff_id = staff.staff_id
group by staff.staff_id, first_name, last_name
order by c desc
limit 1;
-- Answer: Jon Stephens (staff 2 with 7,304 transactions)

-- Question 6:
select * from film;
select * from film_actor;

select film_actor.film_id, title, count(film_actor.actor_id) as c from film_actor
join film
on film_actor.film_id = film.film_id
group by film_actor.film_id, title
order by c desc
limit 1;
-- Answer: Lambs Cincinatti with 15 actors


-- Question 7:
select first_name, last_name, count(fa.actor_id) as c from actor a
join film_actor fa
on a.actor_id = fa.actor_id
group by first_name, last_name
order by c asc
limit 1;
-- Answer: Emily Dee with 14 films

-- Question 8:
select * from address;
select district, count(customer.address_id) from customer
join address
on customer.address_id = address.address_id 
group by district
having count(customer.address_id) > 5
-- Answer: See table below
