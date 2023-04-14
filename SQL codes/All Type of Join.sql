Find profit for all movies in bollywood
	SELECT 
           m.movie_id, title, budget, revenue, currency, unit, 
	   (revenue-budget) as profit 
	FROM movies m
	JOIN financials f
	ON m.movie_id=f.movie_id
	WHERE m.industry="Bollywood";

Find profit of all bollywood movies and sort them by profit amount (Make sure the profit be in millions for better comparisons)
	SELECT 
    	    m.movie_id, title revenue, currency, unit, industry,
            CASE 
                WHEN unit="Thousands" THEN ROUND((revenue-budget)/1000,2)
				WHEN unit="Billions" THEN ROUND((revenue-budget)*1000,2)
                ELSE revenue-budget
            END as profit_mln
	FROM movies m
	JOIN financials f 
	ON m.movie_id=f.movie_id
	WHERE m.industry="hollywood"
	ORDER BY profit_mln DESC;
    
Normalise all USD into INR

SELECT 
    	    m.movie_id, title revenue, currency, unit, industry,
            CASE 
                WHEN currency="INR" THEN ("INR"*82)
                ELSE "USD"
            END as Currency_INR
	FROM movies m
	JOIN financials f 
	ON m.movie_id=f.movie_id
	WHERE m.industry="hollywood"
	ORDER BY Currency_INR DESC;
    
Join more than two table
table 1: movies
table 2: movie_actor
table 3: actors

select * from
	movies m
    Join movie_actor ma on ma.movie_id= m.movie_id
    Join actors a on a.actor_id= ma.actor_id;
    
select m.title, group_concat(a.name separator " | ") as actors
	from
	movies m
    Join movie_actor ma on ma.movie_id= m.movie_id
    Join actors a on a.actor_id= ma.actor_id
    group by m.movie_id;
    
Show only title and Name
from Table: actors, movie_actor, movies

SELECT 
            a.name, GROUP_CONCAT(m.title SEPARATOR ' | ') as movies,
            count(m.title) as count_movie
	FROM actors a
	JOIN movie_actor ma ON a.actor_id= ma.actor_id
	JOIN movies m ON ma.movie_id=m.movie_id
	GROUP BY a.actor_id
    order by count_movie desc
    
Generate a report of all Hindi movies sorted by their revenue amount in millions.
Print movie name, revenue, currency, and unit
Select
	title, revenue, currency, unit,
case
	when unit= "thousands" then (Round(Revenue/1000, 2))
    when unit= "billions" then (Round(Revenue*1000, 2))
    Else Revenue
End as Revenue_mln
    From financials f
    Join movies m on f.movie_id= m.movie_id
    Join languages l on m.language_id= l.language_id
where l.name= "Hindi"
	order by REvenue_mln desc;
    
OR,

	SELECT 
		title, revenue, currency, unit, 
			CASE 
					WHEN unit="Thousands" THEN ROUND(revenue/1000,2)
			WHEN unit="Billions" THEN ROUND(revenue*1000,2)
					ELSE revenue 
			END as revenue_mln
	FROM movies m
	JOIN financials f
			ON m.movie_id=f.movie_id
	JOIN languages l
			ON m.language_id=l.language_id
	WHERE l.name="Hindi"
	ORDER BY revenue_mln DESC;