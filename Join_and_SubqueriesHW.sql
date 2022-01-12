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
select first_name, last_name from customer
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
select first_name, last_name, address.address, city.city from customer
join address
on customer.address_id = address.address_id
join city
on address.city_id = city.city_id
where city.city = 'Nepal'
-- Answer: None, look at query below to see city that start with Ne
select city from city
where city like 'Ne%'

-- Question 5:
select staff_id, count(staff_id) as c from payment
group by staff_id
order by c desc
limit 1;
-- Answer: staff 2 with 7,304 transactions

-- Question 6:
select * from film;
select * from film_actor;

select film_id, count(actor_id) as c from film_actor
group by film_id
order by c desc
limit 1;
-- Answer: film 508 with 15 actors


-- Question 7:
select first_name, last_name, count(fa.actor_id) as c from actor a
join film_actor fa
on a.actor_id = fa.actor_id
group by first_name, last_name
order by c asc
limit 1;
-- Answer: Emily Dee with 14 films

-- Question 8:
select district, count(customer.address_id) from address
join customer 
on address.address_id = customer.address_id
group by district
having count(customer.address_id) > 5
-- Answer: See table below
