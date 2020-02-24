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
Best rated apps: 
Most rated apps:

## 10. How could you take the top 3 regarding both user ratings and number of votes? ##


## 11. Do people care about the price of an app?##


Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?

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
