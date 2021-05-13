#Inspect the database structure and find the best-fitting table to analyse for the next task.

#select * from sakila.country c;
#select * from sakila.city ci;
#select * from sakila.address a;
#select * from sakila.store;


#Using multiple JOIN() clauses display the store ID, city, and country of each store.
SELECT c.country, ci.city, s.store_id from sakila.country c
JOIN sakila.city ci
ON c.country_id = ci.country_id
JOIN sakila.address a
ON ci.city_id = a.city_id
JOIN sakila.store s
ON a.address_id = s.address_id;

#Display the total payment amount for each store.

#select * from sakila.country c
#select * from sakila.city ci
#select * from sakila.address a
#select * from sakila.store

#SELECT sum(p.amount) as total_amount, s.store_id from sakila.payment p 
#JOIN sakila.customer c
#ON p.customer_id = c.customer_id
#JOIN sakila.store s
#ON c.store_id = s.store_id
#GROUP BY s.store_id;

SELECT sum(p.amount) as total_amount, s.store_id from sakila.store s 
JOIN sakila.staff st
ON s.store_id = st.store_id
JOIN sakila.payment p 
ON st.staff_id = p.staff_id
GROUP BY s.store_id;

#What is the average film length per each category? Which category of films are the longest?
#select * from sakila.film;
#select * from sakila.category;
#select * from sakila.film_category;

select round(avg(f.length),2) as avglength, c.name from sakila.category c
join sakila.film_category fc
on c.category_id = fc.category_id
join sakila.film f
on fc.film_id = f.film_id
group by c.name
order by avglength desc;


#Display the 2 most frequently rented movies in descending order.
#select * from sakila.rental;

select f.title, count(r.rental_date) as freq from sakila.rental r
join sakila.inventory i
on r.inventory_id = i.inventory_id
join sakila.film f
on i.film_id = f.film_id
group by f.title
order by freq desc;

#Display the top 5 categories with highest revenue (payment amount) in descending order.

select sum(p.amount) as revenue, c.name from sakila.category c
join sakila.film_category fc
on c.category_id = fc.category_id
join sakila.film f
on fc.film_id = f.film_id
join sakila.inventory i
on f.film_id = i.film_id
join sakila.rental r
on i.inventory_id = r.inventory_id
join sakila.payment p
on r.rental_id = p.rental_id
group by c.name
order by revenue desc
limit 5;


SELECT
	name            AS categoty,
	SUM(amount)     AS `gross revenue`
FROM sakila.payment
	JOIN (sakila.rental
		JOIN (sakila.inventory
			JOIN (sakila.film_category
				JOIN sakila.category USING (category_id))
			USING (film_id))
		USING (inventory_id))
	USING (rental_id)
GROUP BY category_id
ORDER BY `gross revenue` DESC
LIMIT 5;

#Is the Academy Dinosaur movie available for rent from Store 1? If yes, display the title, 
#store_id and inventory_id of the available copies of that movie.

select f.title, s.store_id, i.inventory_id from sakila.film f
join sakila.inventory i
on f.film_id = i.film_id
join sakila.store s
on i.store_id = s.store_id
where f.title = "ACADEMY DINOSAUR" and s.store_id = 1;
