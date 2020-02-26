## Answers MySQL First Queries ## 

## 1. What are the different genres? ##
Games, 
Productivity, 
Weather, 
Shopping, 
Reference, 
Finance, 
Music, 
Utilities, 
Travel, 
Social Networking, 
Sports, 
Business, 
Health & Fitness, 
Entertainment, 
Photo & Video, 
Navigation, 
Education, 
Lifestyle, 
Food & Drink, 
News, 
Book, 
Medical, 
Catalogs, 

## 2. Which is the genre with the most apps rated? ##
Games

## 3. Which is the genre with most apps? ##
Games

## 4. Which is the one with least? ##
Catalogs

## 5. Find the top 10 apps most rated. ##
Facebook	2974676, 
Instagram	2161558, 
Clash of Clans	2130805, 
Temple Run	1724546, 
Pandora - Music & Radio	1126879, 
Pinterest	1061624, 
Bible	985920, 
Candy Crush Saga	961794, 
Spotify Music	878563, 
Angry Birds	824451

## 6. Find the top 10 apps best rated by users. ## 
:) Sudoku+, King of Dragon Pass, TurboScan Pro, Plants vs. Zombies, Learn to Speak Spanish Fast, Plants vs. Zombies HD, The Photographer's Ephemaris, Sudoku +, Flashlight, Infinity Blade

## 7. Take a look at the data you retrieved in question 5. Give some insights. ## 
None of the apps listed in Q5 (top 10 most rated by users) are in the top 10 highest rated apps list. Overall user rating doesn't drop below 3.5, whereas lowest ver rating is 3. Four of the 10 most rated apps are Games. 

## 8. Take a look at the data you retrieved in question 6. Give some insights. ## 
None of the apps listed in Q6 (best rated apps) are in the list at Q5 (most rated apps). In fact, many of the best rated apps have a low number of reviews. Ratings for all are 5. 

## 9. Now compare the data from questions 5 and 6. What do you see? ##
Best rated apps cost money, most rated apps are free. 

## 10. How could you take the top 3 regarding both user ratings and number of votes? ##
For the best rated, I'd add another condition for the top 3, as all in the top 10 have a rating of 5. I'd probably add a 'most rated' condition as well. As this is a small selection, I can see that the top 3 best rated AND most rated apps are all games. 
For the most rated, I could either simply reduce the limit to 3 (or look at the top 3 most rated in my list of top 10 most rated. Answer: Facebook, Instagram, Clash of Clans), or I'd add another condition for the top 3 to specify the best rated within the most rated apps. In that case it would be rating count for the latest version. 

## 11. Do people care about the price of an app?##
Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?

Looking at average rating count of paid vs. unpaid apps: 

SELECT AVG(rating_count_tot)
FROM app
WHERE price>0;
/* 4038.5371 */

SELECT AVG(rating_count_tot)
FROM app
WHERE price=0;
/*19749.8047*/

Looking at average rating of paid vs. unpaid apps: 

SELECT AVG(user_rating)
FROM app
WHERE price>0;
/*3.720948742438714*/

SELECT AVG(user_rating)
FROM app
WHERE price=0;
/*3.3767258382642997*/

If I were to assume that rating count is indicative of the amount of downloads, then I would say users do care about price (or rather, paid vs. unpaid). The threshold for downloading an unpaid game is lower than for a paid game. However, paid games do on average receive higher ratings, so there is more focus on quality in paid games. 

## Query 

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
