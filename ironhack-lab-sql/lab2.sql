use sakila;
#Select all the actors with the first name ‘Scarlett’.
select * from actor
where first_name = 'Scarlett';

#How many films (movies) are available for rent and how many films have been rented?
select count(*) from rental where return_date is null;
select count(*) from rental where return_date is not null;


#What are the shortest and longest movie duration? 
#Return the results as columns with the names  max_duration and min_duration.
select min(length) as min_duration from sakila.film;
select max(length) as max_duration from film;

#What's the average movie duration expressed in format (hours, minutes) 
#Return the result as columns with the names hours and minutes?
select floor(avg((length)/60)) as fullhours, (length%60) as minutes
from film
order by length;

#How many distinct (different) actors' last names are there?
select distinct last_name from actor;

#Since how many days has the company been operating (check the DATEDIFF() function)? Hint: rental table
select datediff(max(rental_date), min(return_date)) from rental;

#Show all rental information with additional columns month and weekday. (hint: DATE_FORMAT() ). Get 20 results.
select date_format(rental_date,'%M') as month from rental
limit 20;

select *, date_format(rental_date,'%d') as day from rental;

#Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
#DAYOFWEEK(rental_date) = 7
#or DAYOFWEEK(recordTime) = 1
#or (DATE_FORMAT(recordTime, "%T") > '17:30:00' AND DAYOFWEEK(recordTime) = 6)

#How many rentals were made in the last month of renting activity?
select count(rental_date) from sakila.rental
where rental_date like '%-02-%';

select year(max(r.rental_date)),month(max(r.rental_date)) as lastrent
from sakila.rental r;

#Get the unique release years.
select distinct release_year from film;

#Get all films with ARMAGEDDON in the title.
select * from film where 'ARMAGEDDON' in (title);

#Get all films which title ends with APOLLO.
select * from film where 'APOLLO' in (title);

#Get 10 the longest films.
select * from sakila.film
order by length DESC
limit 10;

#How many films include Behind the Scenes content?
select count(special_features) from film where 'Behind the Scenes' in (special_features);


#Drop column picture from staff.
alter table staff
drop column picture;


#A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer.
# Update the database accordingly.
insert into customer('first_name','last_name') values ('Tammy','Sanders');

#Add a rental for movie "Academy Dinosaur" by the customer "Charlotte Hunter" from employee Mike Hillyer at Store 1. 
#You can use current date for the rental_date column in the rental table. 
#Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information in other tables. 
#For eg., you would notice that you need customer_id information as well. To get that you can use the following query:
#select customer_id from sakila.customer
#where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
#Use similar method to get inventory_id, film_id, and staff_id.
#SELECT date_add(curdate(),interval day 6) as return_date;