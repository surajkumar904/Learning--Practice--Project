# Select the actor id, actor name and the total number of movies they acted in.
Select  a.actor_id, a.name, count(*) as movies_count
from movie_actor ma
join actors a 
on a.actor_id = ma.actor_id
group by actor_id
order by movies_count desc;

# Using Subquery writing the same query
select 
	actor_id, 
    name, 
	(Select count(*) from movie_actor
    where actor_id = actors.actor_id) as movies_count
from actors 
order by movies_count desc;