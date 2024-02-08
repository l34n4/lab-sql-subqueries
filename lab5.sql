#1. Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.
USE sakila;
SELECT COUNT(*) AS num_copies
FROM inventory
JOIN film 
ON inventory.film_id = film.film_id
WHERE film.title = 'Hunchback Impossible';


#List all films whose length is longer than the average length of all the films in the Sakila database.
SELECT film.title
FROM film
WHERE film.length > (SELECT AVG(length) FROM film);

#Use a subquery to display all actors who appear in the film "Alone Trip".

SELECT  concat( actor.first_name," ", actor.last_name) AS complete_name
FROM actor
WHERE actor.actor_id IN ( SELECT film_actor.actor_id 
							FROM film_actor
							JOIN film 
							ON film_actor.film_id = film.film_id
							WHERE film.title = 'Alone Trip');

