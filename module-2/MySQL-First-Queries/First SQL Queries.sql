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

/* Some Queries: find out whether users care about price. Perhaps look at avg rating of paid apps vs unpaid apps? */

SELECT track_name, prime_genre, price, user_rating 
From app
WHERE price>0
GROUP BY track_name, prime_genre, price, user_rating
ORDER BY user_rating DESC;
 
SELECT AVG(user_rating)
FROM app
WHERE price>0;
/*3.720948742438714*/

SELECT AVG(user_rating)
FROM app
WHERE price=0;
/*3.3767258382642997*/


/* Or look at how many ratings unpaid vs paid apps receive */ 

SELECT track_name, prime_genre, price, rating_count_tot
From app
WHERE price>0
ORDER BY rating_count_tot DESC;

SELECT AVG(rating_count_tot)
FROM app
WHERE price>0;
/* 4038.5371 */

SELECT AVG(rating_count_tot)
FROM app
WHERE price=0;
/*19749.8047*/