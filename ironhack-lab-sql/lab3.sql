use sakila;
#In the actor table, which are the actors whose last names are not repeated? 
select last_name from actor 
group by last_name having count(*) = 1;

#Which last names appear more than once? We would use the same logic as in the previous 
#question but this time we want to include the last names of the actors where the last name was present more than once.
select last_name from actor 
group by last_name having count(*) > 1;

#Using the rental table, find out how many rentals were processed by each employee.
select staff_id, count(staff_id) from rental
group by staff_id;

#Using the film table, find out how many films were released each year
select release_year, count(film_id) from film
group by release_year;

#Using the film table, find out for each rating how many films were there.
select rating, count(rating) from film
group by rating;

#What is the average length of films for each rating? Round off the average lengths to two decimal places.
select rating, round(avg(length),2) from sakila.film
group by rating;

#Which kind of movies (based on rating) have an average duration of two hours or more?
select rating, round(avg(length),2) as avg_length 
from sakila.film 
group by rating
having avg(length) >= 120
order by avg(length);

