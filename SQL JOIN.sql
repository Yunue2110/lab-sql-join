USE SAKILA;

##List the number of films per category.
SELECT  c.category_id , c.name ,COUNT(*) AS film_count 
FROM category AS c
JOIN sakila.film_category fc
ON c.category_id = fc.category_id
GROUP BY c.category_id , c.name;

##Display the first and the last names, as well as the address, of each staff member.
SELECT a.first_name ,last_name , l.address FROM staff as a
JOIN address as l
ON l.address_id = a.address_id;

##Display the total amount rung up by each staff member in August 2005. ..
SELECT a.first_name ,a.last_name , l.amount , l.payment_date  FROM staff as a
JOIN payment as l
ON l.staff_id = a.staff_id;

SELECT  a.first_name, a.last_name, l.payment_date , SUM(l.amount) AS TOTAL_AMOUNT 
FROM staff AS a
JOIN payment AS l 
ON a.staff_id = l.staff_id
WHERE l.payment_date = DATETIME ('2005-08') 
GROUP BY  a.staff_id , l.amount
ORDER BY a.first_name , a.last_name;

##List all films and the number of actors who are listed for each film.
 SELECT * FROM ACTOR;
 SELECT *FROM FILM;
 SELECT*FROM film_actor;
 
 SELECT a.title , l.actor_id
 FROM film AS a
 JOIN film_actor AS l
 ON a.film_id = l.film_id
 GROUP BY l.actor_id , l.film_id;
 

##Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.
SELECT c.first_name , c.last_name , SUM(l.amount)  AS TOTAL_AMOUNT 
FROM customer  AS c
JOIN payment AS l
ON c.customer_id = l.customer_id
GROUP BY  c.customer_id ,l.amount 
ORDER BY c.first_name, c.last_name ASC ;
