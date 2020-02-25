/* Challenge 1: Obtain Title ID, Author ID, Advance of each title and author (where advance = titles.advance * titleauthor.royaltyper / 100) and Royalty of each sale (where sales_royaly = titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) */

SELECT titleauthor.title_id, titleauthor.au_id, sales.qty, (titles.advance * titleauthor.royaltyper / 100) AS 'Advance', (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS 'Sales Royalty'
FROM titleauthor
INNER JOIN titles
ON titles.title_id = titleauthor.title_id
INNER JOIN sales
ON titles.title_id = sales.title_id;

/* Challenge 2: Aggregated royalties of each title for each author. Be mindful of calling to objects inside or outside parentheses; think of the structure of what you're asking. Teeny tiny steps! */

SELECT au_id, title_id, Advance, SUM(Sales_Royalty) AS Total_Royalties
FROM (
	SELECT titleauthor.title_id, titleauthor.au_id, sales.qty, (titles.advance * titleauthor.royaltyper / 100) AS Advance, (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS Sales_Royalty
	FROM titleauthor
	INNER JOIN titles
	ON titles.title_id = titleauthor.title_id
	INNER JOIN sales
	ON titles.title_id = sales.title_id
) royalties_per_title
GROUP BY title_id, au_id;

/* Challenge 3: Calculate the total profits of each author */

SELECT au_id, (Advance + Total_Royalties) AS Profits
FROM (
	SELECT au_id, title_id, Advance, SUM(Sales_Royalty) AS Total_Royalties
	FROM (
		SELECT titleauthor.title_id, titleauthor.au_id, sales.qty, (titles.advance * titleauthor.royaltyper / 100) AS Advance, (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS Sales_Royalty
		FROM titleauthor
		INNER JOIN titles
		ON titles.title_id = titleauthor.title_id
		INNER JOIN sales
		ON titles.title_id = sales.title_id
	) royalties_per_title
	GROUP BY title_id, au_id
	) royalties_per_author
ORDER BY Profits DESC
LIMIT 3

