# Select a movie with highest imdb_rating
select max(imdb_rating) from movies;

select * from movies
where imdb_rating = (select max(imdb_rating) from movies);

# Select a movie with lowest rating
select min(imdb_rating) from movies;

select * from movies 
where imdb_rating = (select min(imdb_rating) from movies);

# Returned a single value 
select * from movies where imdb_rating in (1.9, 9.3)