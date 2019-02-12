-- Question 1a
USE sakila;

Select first_name, last_name from actor;

-- Question 1b

Select concat(first_name, " ", last_name) AS Actor_Name
FROM actor;

-- 2a

Select actor_id, first_name, last_name
FROM actor 
WHERE first_name = "Joe";

-- 2b

Select last_name 
From actor
WHERE last_name LIKE '%GEN%';

-- 2c 

Select last_name, first_name
FROM actor
WHERE last_name LIKE '%LI%'
ORDER BY last_name, first_name;

-- 2d
Select country_id, country
From country
Where country IN ('Afghanistan', 'Bangladesh', 'China');


-- 3a 
Alter table actor
Add column description BLOB;

-- 3b
Alter table actor 
Drop column description; 


-- 4a
Select last_name, count(last_name) as X
From actor
GROUP BY last_name;


-- 4b
Select last_name, count(last_name) as X
From actor
GROUP BY last_name
Having COUNT(last_name) >= 2;

-- 4c 
UPDATE actor
Set first_name = 'Harpo'
Where first_name = 'Groucho' and last_name= 'Williams';

-- 4d
-- Select actor_id, first_name from actor
Update actor 
Set first_name = 'Groucho'
Where actor_id = 172;

-- 5a 
-- I am confused

-- 6a 

Select first_name, last_name, address
From staff s
Join address a 
ON s.address_id = a.address_id;

-- 6b
Select payment.staff_id, staff.first_name, staff.last_name, payment.amount, payment.payment_id
From staff s inner join payment on 
staff.staff_id = payment.staff_id AND payment_date LIKE '2005-08%';

-- 6c
Select title, Count(actor_id)
from film f
inner join film_actor fa
on f.film_id = fa.film_id 
Group by title; 

-- 6d
Select title, Count(inventory)
from film f
Join inventory i 
on f.film_id = i.film_id
Where title = "hunchback impossible";

-- 6e 
-- struggling with this one 


-- 7a 
Select title from film 
Where language_id in 
	(select language_id 
    from language
    where name = 'English')
And (title like 'K%') or (title like 'q%');

-- 7b 
Select first_name, last_name
from actor
where actor_id in 
( 
Select actor_id
From film_actor 
Where film_id in 
(select film_id
from  film 
where title = 'Alone Trip'));

-- 7c 
Select country, last_name, first_name, email
from country c
Left join customer cu 
on c.country_id = cu.customer_id
Where country = 'Canada';

-- 7d 
Select title, category 
from film_list
where category = 'Family';

-- 7e
Select f.title, Count(rental_id) as "Times Rented"
From rental r 
join inventory i 
on (r.inventory_id = i.inventory_id)
JOIN Film f 
ON (i.film_id = f.film_id)
Group By f.title
Order by 'Times Rented' DESC; 

-- 7f 
 
-- 7 g

-- 7 h


-- couldn't finish, i'll take the partial 
-- 






