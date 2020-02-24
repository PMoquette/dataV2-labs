/* First join authors and titleauthor (corresponding author id) SELECT is purely a human aid(it selects what output you will see below. */
SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
FROM authors 
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id

/* Step two: corresponding title_id in separate tables*/
INNER JOIN titles
ON titleauthor.title_id = titles.title_id

/* Step three: join pub_id from titles and publisher tables to get the pub names.*/
INNER JOIN publishers
ON titles.pub_id = publishers.pub_id;

/* Question 2*/
SELECT authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_id, publishers.pub_name, COUNT(titles.title_id) AS "title count"
FROM authors 
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id

INNER JOIN titles 
ON titleauthor.title_id = titles.title_id

INNER JOIN publishers
ON titles.pub_id = publishers.pub_id

GROUP BY authors.au_id, publishers.pub_id;

/* Question 3 */
SELECT authors.au_id, authors.au_lname, authors.au_fname, SUM(sales.qty) AS "Total"
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id

INNER JOIN sales
ON titleauthor.title_id = sales.title_id

GROUP BY authors.au_id 
ORDER BY Total DESC
LIMIT 3;

/* Question 4 */

SELECT authors.au_id, authors.au_lname, authors.au_fname, SUM(sales.qty) AS "Total"
FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id

LEFT JOIN sales
ON titleauthor.title_id = sales.title_id

GROUP BY authors.au_id 
ORDER BY Total DESC;

