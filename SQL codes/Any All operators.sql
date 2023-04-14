# Select actors who acted in any of these movies (101,110,121)

Select * from actors where actor_id = ANY (
select actor_id from movie_actor where movie_id in
(101,110,121));

# Select movies whose rating is greter than any of the marvel movies rating
Select * from movies where imdb_rating = ANY(
select imdb_rating from movies
where studio = "Marvel studios");

Select * from movies where imdb_rating > ANY (
select imdb_rating from movies
where studio = "Marvel studios");

OR

Select * from movies where imdb_rating > SOME (
select imdb_rating from movies
where studio = "Marvel studios");

# Select movies whose rating is greter than all of the movies rating
select * from movies
where imdb_rating > ALL (
select imdb_rating from movies
where studio = "Marvel studios");

OR

select * from movies
where imdb_rating > ALL (
select max(imdb_rating) from movies
where studio = "Marvel studios");

