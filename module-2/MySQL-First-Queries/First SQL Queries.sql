/*Answering Q1: What are the different genres? */
SELECT DISTINCT prime_genre
FROM app;

/*Answering Q2: Which is the genre with the most apps rated? 
https://stackoverflow.com/questions/10093652/get-the-sum-of-one-column-when-grouped-by-another-column-in-sql*/

SELECT 
		SUM(rating_count_tot) As rating_per_genre,
		prime_genre
FROM app
GROUP BY prime_genre
ORDER BY SUM(rating_count_tot) DESC;

/* Answering Q3: Which is the genre with most apps?*/
SELECT prime_genre, COUNT(*)
FROM app
GROUP BY prime_genre;

/* Answering Q5: Find top 10 apps most rated */
SELECT track_name, MAX(`rating_count_tot`)
FROM app
GROUP BY track_name
LIMIT 10;

/* Alternative Q5*/
SELECT *
FROM app
ORDER BY `rating_count_tot` DESC
LIMIT 10;

/* Answering Q6: Find the top 10 apps best rated by users.*/
SELECT *
FROM `app`
ORDER BY `user_rating` DESC
LIMIT 10;

	