#Inspect the database structure and find the best-fitting table to analyse for the next task.
select * from film;

#Use the RANK() and the table of your choice rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.
select title, length, rank () over (order by length)
from sakila.film
where not (length <=> 0);

select  title, length, dense_RANK() over (order by length ASC)
 from film;

#Build on top of the previous query and rank films by length within the rating category (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, rating and the rank.
select title, length, rating, rank () over (order by length)
from film
where not (length <=> 0);

#How many films are there for each of the categories? Inspect the database structure and use appropriate join to write this query.
select c.name, count(fc.film_id) as amount_films
from sakila.category as c 
join sakila.film_category as fc 
on c.category_id = fc.category_id
group by c.name;

#Which actor has appeared in the most films?
select actor.actor_id, actor.first_name, actor.last_name,
       count(actor_id) as film_count
from actor join film_actor using (actor_id)
group by actor_id
order by film_count desc
limit 1;

#Most active customer (the customer that has rented the most number of films)
select customer_id, count(*) as Total_Rentals
from rental
group by customer_id
order by Total_Rentals desc
limit 1;
