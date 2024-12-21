USE imdb;

/* Now that you have imported the data sets, let’s explore some of the tables. 
 To begin with, it is beneficial to know the shape of the tables and whether any column has null values.
 Further in this segment, you will take a look at 'movies' and 'genre' tables.*/



-- Segment 1:




-- Q1. Find the total number of rows in each table of the schema?
-- Type your code below:
select 'movie' as "table_name"
      , count(*) as "count"
 from movie
union all
select 'genre' as "table_name"
      , count(*) as "count"
 from genre
union all
select 'director_mapping' as "table_name"
      , count(*) as "count"
 from director_mapping
union all
select 'role_mapping' as "table_name"
       , count(*) as "count"
  from role_mapping
union all
select 'name' as "table_name"
      , count(*) as "count"
  from names
union all
select 'ratings' as "table_name"
      , count(*) as "count"
  from ratings;

/*
+-------------------+-------+
| table_name        | count |
+-------------------+-------+
| movie             | 7997  |
| genre             | 14662 |
| director_mapping  | 3867  |
| role_mapping      | 15615 |
| name              | 25735 |
| ratings           | 7997  |
+-------------------+-------+
*/

-- Q2. Which columns in the movie table have null values?
-- Type your code below:
SELECT 'title' AS "column_name", COUNT(*) AS "count_nulls" FROM movie WHERE title IS NULL
UNION ALL
SELECT 'year' AS "column_name", COUNT(*) AS "count_nulls" FROM movie WHERE year IS NULL
UNION ALL
SELECT 'date_published' AS "column_name", COUNT(*) AS "count_nulls" FROM movie WHERE date_published IS NULL
UNION ALL
SELECT 'duration' AS "column_name", COUNT(*) AS "count_nulls" FROM movie WHERE duration IS NULL
UNION ALL
SELECT 'country' AS "column_name", COUNT(*) AS "count_nulls" FROM movie WHERE country IS NULL
UNION ALL
SELECT 'worlwide_gross_income' AS "column_name", COUNT(*) AS "count_nulls" FROM movie WHERE worlwide_gross_income IS NULL
UNION ALL
SELECT 'languages' AS "column_name", COUNT(*) AS "count_nulls" FROM movie WHERE languages IS NULL
UNION ALL
SELECT 'production_company' AS "column_name", COUNT(*) AS "count_nulls" FROM movie WHERE production_company IS NULL;

/*
+------------------------+-------------+
|      column_name       | count_nulls |
+------------------------+-------------+
| title                  |           0 |
| year                   |           0 |
| date_published         |           0 |
| duration               |           0 |
| country                |          20 |
| worlwide_gross_income  |        3724 |
| languages              |         194 |
| production_company     |         528 |
+------------------------+-------------+
8 rows selected.
*/

-- Now as you can see four columns of the movie table has null values. Let's look at the at the movies released each year. 
-- Q3. Find the total number of movies released each year? How does the trend look month wise? (Output expected)

/* Output format for the first part:

+---------------+-------------------+
| Year			|	number_of_movies|
+-------------------+----------------
|	2017		|	2134			|
|	2018		|		.		|
|	2019		|		.		|
+---------------+-------------------+


Output format for the second part of the question:
+---------------+-------------------+
|	month_num	|	number_of_movies|
+---------------+----------------
|	1			|	 134			|
|	2			|	 231			|
|	.			|		.		|
+---------------+-------------------+ */
-- Type your code below:

select year AS "Year"
      ,count(*) AS "number_of_movies" 
  from movie
group by year
order by year;

/*
+---------------+-------------------+
| Year	      |	number_of_movies|
+-------------------+----------------
|	2017		|	3052			|
|	2018		|	2944			|
|	2019		|	2001			|
+---------------+-------------------+ */

select MONTH(date_published) as "month_num"
      ,count(*) as "number_of_movies"
  from movie
group by month_num
order by month_num;

/*
+------------+------------------+
| month_num  | number_of_movies |
+------------+------------------+
|     01     |        804       |
|     02     |        640       |
|     03     |        824       |
|     04     |        680       |
|     05     |        625       |
|     06     |        580       |
|     07     |        493       |
|     08     |        678       |
|     09     |        809       |
|     10     |        801       |
|     11     |        625       |
|     12     |        438       |
+------------+------------------+
*/



/*The highest number of movies is produced in the month of March.
So, now that you have understood the month-wise trend of movies, let’s take a look at the other details in the movies table. 
We know USA and India produces huge number of movies each year. Lets find the number of movies produced by USA or India for the last year.*/
  
-- Q4. How many movies were produced in the USA or India in the year 2019??
-- Type your code below:

SELECT COUNT(*) AS "number_of_movies"
FROM movie
WHERE (country like '%USA%' OR country like '%India%') 
  AND YEAR = 2019;

/*
+-------------------+
| number_of_movies  |
+-------------------+
| 1059              |
+-------------------+
*/





/* USA and India produced more than a thousand movies(you know the exact number!) in the year 2019.
Exploring table Genre would be fun!! 
Let’s find out the different genres in the dataset.*/

-- Q5. Find the unique list of the genres present in the data set?
-- Type your code below:

select distinct genre as "genre" 
 from genre;

/*
+-----------+
|   genre   |
+-----------+
| Family    |
| Adventure |
| Romance   |
| Fantasy   |
| Others    |
| Comedy    |
| Mystery   |
| Horror    |
| Thriller  |
| Action    |
| Drama     |
| Sci-Fi    |
| Crime     |
+-----------+
13 rows selected.*/


/* So, RSVP Movies plans to make a movie of one of these genres.
Now, wouldn’t you want to know which genre had the highest number of movies produced in the last year?
Combining both the movie and genres table can give more interesting insights. */

-- Q6.Which genre had the highest number of movies produced overall?
-- Type your code below:

select genre as "genre"
      ,count(movie.id) as "movies_count"
 from genre inner join 
      movie on genre.movie_id = movie.id	  
group by genre
having count(movie.id) = (select max(count(movie.id))
                            from genre inner join 
                                 movie on genre.movie_id = movie.id	  
                            group by genre)
order by count(movie.id) desc;

/*
+-------+--------------+
| genre | movies_count |
+-------+--------------+
| Drama |         4285 |
+-------+--------------+
1 rows selected.*/


/* So, based on the insight that you just drew, RSVP Movies should focus on the ‘Drama’ genre. 
But wait, it is too early to decide. A movie can belong to two or more genres. 
So, let’s find out the count of movies that belong to only one genre.*/

-- Q7. How many movies belong to only one genre?
-- Type your code below:
select count(genre_count) AS "genre_count"
  from (select movie_id, count(genre) genre_count
          from genre
      group by movie_id
      having count(genre) = 1);

/*
+-------------+
| genre_count |
+-------------+
|        3289 |
+-------------+
*/


/* There are more than three thousand movies which has only one genre associated with them.
So, this figure appears significant. 
Now, let's find out the possible duration of RSVP Movies’ next project.*/

-- Q8.What is the average duration of movies in each genre? 
-- (Note: The same movie can belong to multiple genres.)


/* Output format:

+---------------+-------------------+
| genre			|	avg_duration	|
+-------------------+----------------
|	thriller	|		105			|
|	.			|		.			|
|	.			|		.			|
+---------------+-------------------+ */
-- Type your code below:

SELECT GENRE.GENRE AS "genre"
      ,ROUND(AVG(MOVIE.DURATION)) AS "avg_duration"
  FROM MOVIE
      ,GENRE
WHERE MOVIE.ID = GENRE.MOVIE_ID
GROUP BY GENRE
ORDER BY ROUND(AVG(MOVIE.DURATION)) DESC;

/*
+-----------+--------------+
|   genre   | avg_duration |
+-----------+--------------+
| Action    |          113 |
| Romance   |          110 |
| Drama     |          107 |
| Crime     |          107 |
| Fantasy   |          105 |
| Comedy    |          103 |
| Adventure |          102 |
| Thriller  |          102 |
| Mystery   |          102 |
| Family    |          101 |
| Others    |          100 |
| Sci-Fi    |           98 |
| Horror    |           93 |
+-----------+--------------+
*/


/* Now you know, movies of genre 'Drama' (produced highest in number in 2019) has the average duration of 106.77 mins.
Lets find where the movies of genre 'thriller' on the basis of number of movies.*/

-- Q9.What is the rank of the ‘thriller’ genre of movies among all the genres in terms of number of movies produced? 
-- (Hint: Use the Rank function)


/* Output format:
+---------------+-------------------+---------------------+
| genre			|		movie_count	|		genre_rank    |	
+---------------+-------------------+---------------------+
|drama			|	2312			|			2		  |
+---------------+-------------------+---------------------+*/
-- Type your code below:

select genre AS "genre"
      ,movies_count AS "movie_count"
      ,movie_count_rank AS "genre_rank"
  from (select genre
              ,movies_count
              ,rank() over (order by movies_count desc) movie_count_rank
          from (select genre
                      ,count(movie.id) movies_count
                  from genre inner join 
                       movie on genre.movie_id = movie.id	  
                  group by genre))
where genre = 'Thriller';

/*
+-----------+-------------+------------+
|   genre   | movie_count | genre_rank |
+-----------+-------------+------------+
| Thriller  |        1484 |          3 |
+-----------+-------------+------------+
*/


/*Thriller movies is in top 3 among all genres in terms of number of movies
 In the previous segment, you analysed the movies and genres tables. 
 In this segment, you will analyse the ratings table as well.
To start with lets get the min and max values of different columns in the table*/




-- Segment 2:




-- Q10.  Find the minimum and maximum values in  each column of the ratings table except the movie_id column?
/* Output format:
+---------------+-------------------+---------------------+----------------------+-----------------+-----------------+
| min_avg_rating|	max_avg_rating	|	min_total_votes   |	max_total_votes 	 |min_median_rating|min_median_rating|
+---------------+-------------------+---------------------+----------------------+-----------------+-----------------+
|		0		|			5		|	       177		  |	   2000	    		 |		0	       |	8			 |
+---------------+-------------------+---------------------+----------------------+-----------------+-----------------+*/
-- Type your code below:

select min(avg_rating) as "min_avg_rating"
      ,max(avg_rating) as "max_avg_rating"
      ,min(total_votes) as "min_total_votes"
      ,max(total_votes) as "max_total_votes"
      ,min(median_rating) as "min_median_rating"
      ,max(median_rating) as "min_median_rating"
 from ratings;

 /*
+----------------+----------------+------------------+------------------+--------------------+--------------------+
| min_avg_rating | max_avg_rating | min_total_votes  | max_total_votes  | min_median_rating | max_median_rating |
+----------------+----------------+------------------+------------------+--------------------+--------------------+
|              1 |             10 |              100 |           725138 |                  1 |                 10 |
+----------------+----------------+------------------+------------------+--------------------+--------------------+
 */

    

/* So, the minimum and maximum values in each column of the ratings table are in the expected range. 
This implies there are no outliers in the table. 
Now, let’s find out the top 10 movies based on average rating.*/

-- Q11. Which are the top 10 movies based on average rating?
/* Output format:
+---------------+-------------------+---------------------+
| title			|		avg_rating	|		movie_rank    |
+---------------+-------------------+---------------------+
| Fan			|		9.6			|			5	  	  |
|	.			|		.			|			.		  |
|	.			|		.			|			.		  |
|	.			|		.			|			.		  |
+---------------+-------------------+---------------------+*/
-- Type your code below:
-- Keep in mind that multiple movies can be at the same rank. You only have to find out the top 10 movies (if there are more than one movies at the 10th place, consider them all.)

select title as "title"
      ,avg_rating AS "avg_rating"
      ,movie_rank AS "movie_rank"
FROM (SELECT title
            ,avg_rating AS avg_rating
            ,rank() over (order by avg_rating desc) as movie_rank
FROM movie m
JOIN ratings r ON m.id = r.movie_id)
where movie_rank <= 10;

/*
+----------------------------------------+-------------+-------------+
| title                                  | avg_rating  | movie_rank  |
+----------------------------------------+-------------+-------------+
| Love in Kilnerry                       |        10.0 |           1 |
| Kirket                                 |        10.0 |           1 |
| Gini Helida Kathe                      |         9.8 |           3 |
| Runam                                  |         9.7 |           4 |
| Android Kunjappan Version 5.25         |         9.6 |           5 |
| Fan                                    |         9.6 |           5 |
| Yeh Suhaagraat Impossible              |         9.5 |           7 |
| Safe                                   |         9.5 |           7 |
| The Brighton Miracle                   |         9.5 |           7 |
| Zana                                   |         9.4 |          10 |
| Shibu                                  |         9.4 |          10 |
| Our Little Haven                       |         9.4 |          10 |
| Family of Thakurganj                   |         9.4 |          10 |
| Ananthu V/S Nusrath                    |         9.4 |          10 |
+----------------------------------------+-------------+-------------+
14 rows selected.
*/

/* Do you find you favourite movie FAN in the top 10 movies with an average rating of 9.6? If not, please check your code again!!
So, now that you know the top 10 movies, do you think character actors and filler actors can be from these movies?
Summarising the ratings table based on the movie counts by median rating can give an excellent insight.*/

-- Q12. Summarise the ratings table based on the movie counts by median ratings.
/* Output format:

+---------------+-------------------+
| median_rating	|	movie_count		|
+-------------------+----------------
|	1			|		105			|
|	.			|		.			|
|	.			|		.			|
+---------------+-------------------+ */
-- Type your code below:
-- Order by is good to have

SELECT ratings.median_rating AS "median_rating"
      ,COUNT(*) AS "movie_count"
FROM movie
JOIN ratings ON movie.id = ratings.movie_id
group by ratings.median_rating
order by ratings.median_rating;

/*
+---------------+-------------+
| median_rating | movie_count |
+---------------+-------------+
|             1 |          94 |
|             2 |         119 |
|             3 |         283 |
|             4 |         479 |
|             5 |         985 |
|             6 |        1975 |
|             7 |        2257 |
|             8 |        1030 |
|             9 |         429 |
|            10 |         346 |
+---------------+-------------+
10 rows selected.
*/

/* Movies with a median rating of 7 is highest in number. 
Now, let's find out the production house with which RSVP Movies can partner for its next project.*/

-- Q13. Which production house has produced the most number of hit movies (average rating > 8)??
/* Output format:
+------------------+-------------------+---------------------+
|production_company|movie_count	       |	prod_company_rank|
+------------------+-------------------+---------------------+
| The Archers	   |		1		   |			1	  	 |
+------------------+-------------------+---------------------+*/
-- Type your code below:

SELECT production_company AS "production_company"
      ,hit_movie_count AS "hit_movie_count"
      ,rank() over (order by hit_movie_count desc) AS "prod_comp_rank"
FROM (SELECT production_company
        ,hit_movie_count AS hit_movie_count
        ,rank() over (order by hit_movie_count desc) AS prod_comp_rank
    FROM (SELECT production_company
                ,COUNT(*) AS hit_movie_count
            FROM movie
            JOIN ratings ON movie.id = ratings.movie_id
            WHERE ratings.avg_rating > 8
            AND production_company is NOT NULL
            GROUP BY production_company
        ))
WHERE prod_comp_rank = 1;

/*
+-------------------------+----------------+-----------------+
| production_company      | hit_movie_count| prod_comp_rank  |
+-------------------------+----------------+-----------------+
| National Theatre Live   |              3 |               1 |
| Dream Warrior Pictures  |              3 |               1 |
+-------------------------+----------------+-----------------+
*/


-- It's ok if RANK() or DENSE_RANK() is used too
-- Answer can be Dream Warrior Pictures or National Theatre Live or both

-- Q14. How many movies released in each genre during March 2017 in the USA had more than 1,000 votes?
/* Output format:

+---------------+-------------------+
| genre			|	movie_count		|
+-------------------+----------------
|	thriller	|		105			|
|	.			|		.			|
|	.			|		.			|
+---------------+-------------------+ */
-- Type your code below:

SELECT genre.genre,
       COUNT(movie.id) AS movie_count
  FROM movie
  JOIN genre ON movie.id = genre.movie_id
  JOIN ratings ON movie.id = ratings.movie_id
 WHERE year = 2017
   AND EXTRACT(MONTH from movie.date_published) = 03
   AND movie.country like '%USA%'
   AND ratings.total_votes > 1000
GROUP BY genre.genre
ORDER BY movie_count DESC;

/*
+--------------------+-------------+
| GENRE              | MOVIE_COUNT |
+--------------------+-------------+
| Drama              |          24 |
| Comedy             |           9 |
| Thriller           |           8 |
| Action             |           8 |
| Sci-Fi             |           7 |
| Horror             |           6 |
| Crime              |           6 |
| Romance            |           4 |
| Mystery            |           4 |
| Adventure          |           3 |
| Fantasy            |           3 |
| Family             |           1 |
+--------------------+-------------+
13 rows selected.
*/


-- Lets try to analyse with a unique problem statement.
-- Q15. Find movies of each genre that start with the word ‘The’ and which have an average rating > 8?
/* Output format:
+---------------+-------------------+---------------------+
| title			|		avg_rating	|		genre	      |
+---------------+-------------------+---------------------+
| Theeran		|		8.3			|		Thriller	  |
|	.			|		.			|			.		  |
|	.			|		.			|			.		  |
|	.			|		.			|			.		  |
+---------------+-------------------+---------------------+*/
-- Type your code below:

SELECT movie.title as "title"
      ,ratings.avg_rating as "avg_rating"
      ,genre.genre as "genre"
FROM movie
JOIN genre ON movie.id = genre.movie_id
JOIN ratings ON movie.id = ratings.movie_id
WHERE movie.title LIKE 'The%'
  AND ratings.avg_rating > 8
ORDER BY genre.genre, ratings.avg_rating DESC;

/*
+---------------------------------------+-------------+-----------+
| title                                 | avg_rating  | genre     |
+---------------------------------------+-------------+-----------+
| Theeran Adhigaaram Ondru              |         8.3 | Action    |
| The Irishman                          |         8.7 | Crime     |
| The Gambinos                          |         8.4 | Crime     |
| Theeran Adhigaaram Ondru              |         8.3 | Crime     |
| The Brighton Miracle                  |         9.5 | Drama     |
| The Colour of Darkness                |         9.1 | Drama     |
| The Blue Elephant 2                   |         8.8 | Drama     |
| The Irishman                          |         8.7 | Drama     |
| The Mystery of Godliness: The Sequel  |         8.5 | Drama     |
| The Gambinos                          |         8.4 | Drama     |
| The King and I                        |         8.2 | Drama     |
| The Blue Elephant 2                   |         8.8 | Horror    |
| The Blue Elephant 2                   |         8.8 | Mystery   |
| The King and I                        |         8.2 | Romance   |
| Theeran Adhigaaram Ondru              |         8.3 | Thriller  |
+---------------------------------------+-------------+-----------+
15 rows selected.
*/


-- You should also try your hand at median rating and check whether the ‘median rating’ column gives any significant insights.
-- Q16. Of the movies released between 1 April 2018 and 1 April 2019, how many were given a median rating of 8?
-- Type your code below:

SELECT COUNT(*) AS "movie_count"
FROM movie
JOIN ratings ON movie.id = ratings.movie_id
WHERE movie.date_published BETWEEN '2018-04-01' AND '2019-04-01'
  AND ratings.median_rating = 8;

/*
+-------------+
| movie_count |
+-------------+
|         361 |
+-------------+
*/


-- Once again, try to solve the problem given below.
-- Q17. Do German movies get more votes than Italian movies? 
-- Hint: Here you have to find the total number of votes for both German and Italian movies.
-- Type your code below:

SELECT country as "country",
    SUM(ratings.total_votes) AS "total_votes"
FROM movie
JOIN ratings ON movie.id = ratings.movie_id
WHERE country IN ('Germany', 'Italy')
GROUP BY country;

/*
+---------+-------------+
| country | total_votes |
+---------+-------------+
| Italy   |       77965 |
| Germany |      106710 |
+---------+-------------+
*/

-- Answer is Yes

/* Now that you have analysed the movies, genres and ratings tables, let us now analyse another table, the names table. 
Let’s begin by searching for null values in the tables.*/




-- Segment 3:



-- Q18. Which columns in the names table have null values??
/*Hint: You can find null values for individual columns or follow below output format
+---------------+-------------------+---------------------+----------------------+
| name_nulls	|	height_nulls	|date_of_birth_nulls  |known_for_movies_nulls|
+---------------+-------------------+---------------------+----------------------+
|		0		|			123		|	       1234		  |	   12345	    	 |
+---------------+-------------------+---------------------+----------------------+*/
-- Type your code below:

SELECT SUM(CASE WHEN name IS NULL THEN 1 ELSE 0 END) AS "name_nulls"
      ,SUM(CASE WHEN height IS NULL THEN 1 ELSE 0 END) AS "height_nulls"
      ,SUM(CASE WHEN date_of_birth IS NULL THEN 1 ELSE 0 END) AS "date_of_birth_nulls"
      ,SUM(CASE WHEN known_for_movies IS NULL THEN 1 ELSE 0 END) AS "known_for_movies_nulls"
FROM names;

/*
+-------------+--------------+---------------------+-------------------------+
| name_nulls  | height_nulls | date_of_birth_nulls | known_for_movies_nulls  |
+-------------+--------------+---------------------+-------------------------+
|           0 |        17335 |               13431 |                   15226 |
+-------------+--------------+---------------------+-------------------------+
*/


/* There are no Null value in the column 'name'.
The director is the most important person in a movie crew. 
Let’s find out the top three directors in the top three genres who can be hired by RSVP Movies.*/

-- Q19. Who are the top three directors in the top three genres whose movies have an average rating > 8?
-- (Hint: The top three genres would have the most number of movies with an average rating > 8.)
/* Output format:

+---------------+-------------------+
| director_name	|	movie_count		|
+---------------+-------------------|
|James Mangold	|		4			|
|	.			|		.			|
|	.			|		.			|
+---------------+-------------------+ */
-- Type your code below:

WITH TopGenres AS (
    SELECT genre.genre
          ,COUNT(movie.id) AS movie_count
    FROM movie
    JOIN genre ON movie.id = genre.movie_id
    JOIN ratings ON movie.id = ratings.movie_id
    WHERE ratings.avg_rating > 8
    GROUP BY genre.genre
    ORDER BY movie_count DESC
    FETCH FIRST 3 ROWS ONLY
),
TopDirectors AS (
    SELECT name_id
          ,name
          ,genre
          ,COUNT(movie.id) AS movie_count
    FROM movie
    JOIN genre ON movie.id = genre.movie_id
    JOIN ratings ON movie.id = ratings.movie_id
    JOIN director_mapping ON movie.id = director_mapping.movie_id
    JOIN names on director_mapping.name_id = names.id
    WHERE ratings.avg_rating > 8
      AND genre.genre IN (SELECT genre FROM TopGenres)
    GROUP BY name_id,name,genre.genre
    ORDER BY movie_count DESC
    FETCH FIRST 3 ROWS ONLY
)
SELECT name AS "director_name"
      ,movie_count AS "movie_count"
FROM TopDirectors
ORDER BY movie_count DESC;

/*
+-----------------+-------------+
| director_name   | movie_count |
+-----------------+-------------+
| James Mangold   |           2 |
| Anthony Russo   |           2 |
| James Mangold   |           2 |
+-----------------+-------------+
*/


/* James Mangold can be hired as the director for RSVP's next project. Do you remeber his movies, 'Logan' and 'The Wolverine'. 
Now, let’s find out the top two actors.*/

-- Q20. Who are the top two actors whose movies have a median rating >= 8?
/* Output format:

+---------------+-------------------+
| actor_name	|	movie_count		|
+-------------------+----------------
|Christain Bale	|		10			|
|	.			|		.			|
+---------------+-------------------+ */
-- Type your code below:

SELECT actor_name as "actor_name"
      ,movie_count as "movie_count"
FROM ((SELECT actor_name
            ,movie_count
            ,rank() over (order by movie_count desc) as actor_rank
        FROM (SELECT names.name AS actor_name
                    ,count(movie.id) AS movie_count
                FROM movie
                JOIN role_mapping ON movie.id = role_mapping.movie_id
                JOIN ratings ON movie.id = ratings.movie_id
                JOIN names ON role_mapping.name_id = names.id
                WHERE median_rating > 8
                GROUP BY names.name)))
WHERE actor_rank <= 2;

/*
+-------------------+-------------+
| actor_name        | movie_count |
+-------------------+-------------+
| Mammootty         |           7 |
| Sudeep            |           3 |
| Jimmy Sheirgill   |           3 |
| Siddique          |           3 |
| Nirmal Rishi      |           3 |
| Tovino Thomas     |           3 |
| Mohanlal          |           3 |
+-------------------+-------------+
7 rows selected.
*/

/* Have you find your favourite actor 'Mohanlal' in the list. If no, please check your code again. 
RSVP Movies plans to partner with other global production houses. 
Let’s find out the top three production houses in the world.*/

-- Q21. Which are the top three production houses based on the number of votes received by their movies?
/* Output format:
+------------------+--------------------+---------------------+
|production_company|vote_count			|		prod_comp_rank|
+------------------+--------------------+---------------------+
| The Archers		|		830			|		1	  		  |
|	.				|		.			|			.		  |
|	.				|		.			|			.		  |
+-------------------+-------------------+---------------------+*/
-- Type your code below:

WITH 
ProductionVotes AS (
    SELECT movie.production_company,
        SUM(ratings.total_votes) AS vote_count
    FROM movie
    JOIN ratings ON movie.id = ratings.movie_id
    GROUP BY movie.production_company
),
RankedProductionCompanies AS (
    SELECT production_company,
        vote_count,
        RANK() OVER (ORDER BY vote_count DESC) AS prod_comp_rank
    FROM ProductionVotes
)
SELECT production_company as "production_company",
    vote_count as "vote_count",
    prod_comp_rank as "prod_comp_rank"
FROM RankedProductionCompanies
WHERE prod_comp_rank <= 3
ORDER BY prod_comp_rank;

/*
+------------------------+-------------+-----------------+
| production_company     | vote_count  | prod_comp_rank  |
+------------------------+-------------+-----------------+
| Marvel Studios         |    2656967  |               1 |
| Twentieth Century Fox  |    2411163  |               2 |
| Warner Bros.           |    2396057  |               3 |
+------------------------+-------------+-----------------+
*/


/*Yes Marvel Studios rules the movie world.
So, these are the top three production houses based on the number of votes received by the movies they have produced.

Since RSVP Movies is based out of Mumbai, India also wants to woo its local audience. 
RSVP Movies also wants to hire a few Indian actors for its upcoming project to give a regional feel. 
Let’s find who these actors could be.*/

-- Q22. Rank actors with movies released in India based on their average ratings. Which actor is at the top of the list?
-- Note: The actor should have acted in at least five Indian movies. 
-- (Hint: You should use the weighted average based on votes. If the ratings clash, then the total number of votes should act as the tie breaker.)

/* Output format:
+---------------+-------------------+---------------------+----------------------+-----------------+
| actor_name	|	total_votes		|	movie_count		  |	actor_avg_rating 	 |actor_rank	   |
+---------------+-------------------+---------------------+----------------------+-----------------+
|	Yogi Babu	|			3455	|	       11		  |	   8.42	    		 |		1	       |
|		.		|			.		|	       .		  |	   .	    		 |		.	       |
|		.		|			.		|	       .		  |	   .	    		 |		.	       |
|		.		|			.		|	       .		  |	   .	    		 |		.	       |
+---------------+-------------------+---------------------+----------------------+-----------------+*/
-- Type your code below:

WITH ActorMovies AS (
    SELECT names.name AS actor_name
          ,ratings.movie_id
          ,ratings.avg_rating
          ,ratings.total_votes
          ,movie.country
     FROM names
     JOIN role_mapping ON names.id = role_mapping.name_id
     JOIN movie ON role_mapping.movie_id = movie.id
     JOIN ratings ON movie.id = ratings.movie_id
     WHERE movie.country = 'India'
       AND role_mapping.category = 'actor'
),
ActorStats AS (
    SELECT actor_name
          ,COUNT(movie_id) AS movie_count
          ,SUM(avg_rating * total_votes) / SUM(total_votes) AS actor_avg_rating
          ,SUM(total_votes) AS total_votes
    FROM ActorMovies
    GROUP BY actor_name
    HAVING COUNT(movie_id) >= 5
),
RankedActors AS (
    SELECT actor_name
          ,movie_count
          ,actor_avg_rating
          ,total_votes
          ,RANK() OVER (ORDER BY actor_avg_rating DESC, total_votes DESC) AS actor_rank
    FROM ActorStats
)
SELECT actor_name as "actor_name"
      ,total_votes as "total_votes"
      ,movie_count as "movie_count"
      ,round(actor_avg_rating,2) as "actor_avg_rating"
      ,actor_rank as "actor_rank"
FROM RankedActors
ORDER BY actor_rank asc;


/*
+--------------------+-------------+--------------+------------------+-----------+
| actor_name         | total_votes | movie_count  | actor_avg_rating | actor_rank|
+--------------------+-------------+--------------+------------------+-----------+
| Vijay Sethupathi   | 23114       | 5            | 8.42             | 1         |
| Fahadh Faasil      | 13557       | 5            | 7.99             | 2         |
| Yogi Babu          | 8500        | 11           | 7.83             | 3         |
| Joju George        | 3926        | 5            | 7.58             | 4         |
| Ammy Virk          | 2504        | 6            | 7.55             | 5         |
| Dileesh Pothan     | 6235        | 5            | 7.52             | 6         |
| Kunchacko Boban    | 5628        | 6            | 7.48             | 7         |
| Pankaj Tripathi    | 40728       | 5            | 7.44             | 8         |
| Rajkummar Rao      | 42560       | 6            | 7.37             | 9         |
| Dulquer Salmaan    | 17666       | 5            | 7.30             | 10        |
| Amit Sadh          | 13355       | 5            | 7.21             | 11        |
| Tovino Thomas      | 11596       | 8            | 7.15             | 12        |
| Mammootty          | 12613       | 8            | 7.04             | 13        |
| Nassar             | 4016        | 5            | 7.03             | 14        |
| Karamjit Anmol     | 1970        | 6            | 6.91             | 15        |
| Hareesh Kanaran    | 3196        | 5            | 6.58             | 16        |
| Naseeruddin Shah   | 12604       | 5            | 6.54             | 17        |
| Anandraj           | 2750        | 6            | 6.54             | 18        |
| Mohanlal           | 17244       | 6            | 6.51             | 19        |
| Aju Varghese       | 2237        | 5            | 6.43             | 20        |
| Siddique           | 5953        | 7            | 6.43             | 21        |
| Prakash Raj        | 8548        | 6            | 6.37             | 22        |
| Jimmy Sheirgill    | 3826        | 6            | 6.29             | 23        |
| Mahesh Achanta     | 2716        | 6            | 6.21             | 24        |
| Biju Menon         | 1916        | 5            | 6.21             | 25        |
| Suraj Venjaramoodu | 4284        | 6            | 6.19             | 26        |
| Abir Chatterjee    | 1413        | 5            | 5.80             | 27        |
| Sunny Deol         | 4594        | 5            | 5.71             | 28        |
| Radha Ravi         | 1483        | 5            | 5.70             | 29        |
| Prabhu Deva        | 2044        | 5            | 5.68             | 30        |
+--------------------+-------------+--------------+------------------+-----------+

30 rows selected.
*/



-- Top actor is Vijay Sethupathi

-- Q23.Find out the top five actresses in Hindi movies released in India based on their average ratings? 
-- Note: The actresses should have acted in at least three Indian movies. 
-- (Hint: You should use the weighted average based on votes. If the ratings clash, then the total number of votes should act as the tie breaker.)
/* Output format:
+---------------+-------------------+---------------------+----------------------+-----------------+
| actress_name	|	total_votes		|	movie_count		  |	actress_avg_rating 	 |actress_rank	   |
+---------------+-------------------+---------------------+----------------------+-----------------+
|	Tabu		|			3455	|	       11		  |	   8.42	    		 |		1	       |
|		.		|			.		|	       .		  |	   .	    		 |		.	       |
|		.		|			.		|	       .		  |	   .	    		 |		.	       |
|		.		|			.		|	       .		  |	   .	    		 |		.	       |
+---------------+-------------------+---------------------+----------------------+-----------------+*/
-- Type your code below:

WITH ActressMovies AS (
    SELECT names.name AS actress_name
          ,ratings.movie_id
          ,ratings.avg_rating
          ,ratings.total_votes
          ,movie.country
    FROM names
    JOIN role_mapping ON names.id = role_mapping.name_id
    JOIN movie ON role_mapping.movie_id = movie.id
    JOIN ratings ON movie.id = ratings.movie_id
    WHERE movie.country = 'India' 
     AND movie.languages = 'Hindi'
     AND role_mapping.category = 'actress'
),
ActressStats AS (
    SELECT actress_name
          ,COUNT(movie_id) AS movie_count
          ,SUM(avg_rating * total_votes) / SUM(total_votes) AS actress_avg_rating
          ,SUM(total_votes) AS total_votes
     FROM ActressMovies
     GROUP BY actress_name
     HAVING COUNT(movie_id) >= 3
),
RankedActresses AS (
    SELECT actress_name
          ,movie_count
          ,actress_avg_rating
          ,total_votes
          ,RANK() OVER (ORDER BY actress_avg_rating DESC, total_votes DESC) AS actress_rank
     FROM ActressStats
)
SELECT actress_name AS "actress_name"
      ,total_votes AS "total_votes"
      ,movie_count AS "movie_count"
      ,round(actress_avg_rating,2) AS "actress_avg_rating"
      ,actress_rank AS "actress_rank"
FROM RankedActresses
WHERE actress_rank <= 5
ORDER BY actress_rank;

/*
+------------------+-------------+-------------+-------------------+-------------+
| actress_name     | total_votes | movie_count | actress_avg_rating| actress_rank|
+------------------+-------------+-------------+-------------------+-------------+
| Taapsee Pannu    |       18061 |           3 |              7.74 |           1 |
| Divya Dutta      |        8579 |           3 |              6.88 |           2 |
| Kriti Kharbanda  |        2549 |           3 |               4.8 |           3 |
| Sonakshi Sinha   |        4025 |           4 |              4.18 |           4 |
+------------------+-------------+-------------+-------------------+-------------+
*/


/* Taapsee Pannu tops with average rating 7.74. 
Now let us divide all the thriller movies in the following categories and find out their numbers.*/


/* Q24. Consider thriller movies having at least 25,000 votes. Classify them according to their average ratings in
   the following categories:  

			Rating > 8: Superhit
			Rating between 7 and 8: Hit
			Rating between 5 and 7: One-time-watch
			Rating < 5: Flop
	
    Note: Sort the output by average ratings (desc).
--------------------------------------------------------------------------------------------*/
/* Output format:
+---------------+-------------------+
| movie_name	|	movie_category	|
+---------------+-------------------+
|	Get Out		|			Hit		|
|		.		|			.		|
|		.		|			.		|
+---------------+-------------------+*/

-- Type your code below:
SELECT title AS "movie_name",
       CASE
           WHEN avg_rating > 8 THEN 'Superhit'
           WHEN avg_rating BETWEEN 7 AND 8 THEN 'Hit'
           WHEN avg_rating BETWEEN 5 AND 7 THEN 'One-time-watch'
           ELSE 'Flop'
       END AS "movie_category"
FROM movie
JOIN ratings ON movie.id = ratings.movie_id
JOIN genre ON movie.id = genre.movie_id
WHERE
    genre = 'Thriller' AND total_votes >= 25000
ORDER BY
    avg_rating DESC;

/*
+------------------------------------+-----------------+
| movie_name                        | movie_category   |
+------------------------------------+-----------------+
| Joker                              | Superhit        |
| Andhadhun                          | Superhit        |
| Contratiempo                       | Superhit        |
| Ah-ga-ssi                          | Superhit        |
| Forushande                         | Hit             |
| Mission: Impossible - Fallout      | Hit             |
| Get Out                            | Hit             |
| Searching                          | Hit             |
| John Wick: Chapter 3 - Parabellum  | Hit             |
| Hotel Mumbai                       | Hit             |
| Den skyldige                       | Hit             |
| John Wick: Chapter 2               | Hit             |
| Miss Sloane                        | Hit             |
| Split                              | Hit             |
| Shot Caller                        | Hit             |
| Good Time                          | Hit             |
| First Reformed                     | Hit             |
| Elle                               | Hit             |
| Brimstone                          | Hit             |
| The Mule                           | Hit             |
| The Foreigner                      | Hit             |
| The Killing of a Sacred Deer       | Hit             |
| Us                                 | One-time-watch  |
| Widows                             | One-time-watch  |
| The Autopsy of Jane Doe            | One-time-watch  |
| The Fate of the Furious            | One-time-watch  |
| Jungle                             | One-time-watch  |
| Venom                              | One-time-watch  |
| The Equalizer 2                    | One-time-watch  |
| Atomic Blonde                      | One-time-watch  |
| Glass                              | One-time-watch  |
| Thoroughbreds                      | One-time-watch  |
| Anna                               | One-time-watch  |
| Red Sparrow                        | One-time-watch  |
| Hunter Killer                      | One-time-watch  |
| Halloween                          | One-time-watch  |
| Life                               | One-time-watch  |
| Happy Death Day                    | One-time-watch  |
| Peppermint                         | One-time-watch  |
| Annabelle: Creation                | One-time-watch  |
| Roman J. Israel, Esq.              | One-time-watch  |
| Alien: Covenant                    | One-time-watch  |
| Fractured                          | One-time-watch  |
| The Commuter                       | One-time-watch  |
| Revenge                            | One-time-watch  |
| The Beguiled                       | One-time-watch  |
| The Ritual                         | One-time-watch  |
| American Assassin                  | One-time-watch  |
| Scary Stories to Tell in the Dark  | One-time-watch  |
| Maze Runner: The Death Cure        | One-time-watch  |
| The Perfection                     | One-time-watch  |
| The Belko Experiment               | One-time-watch  |
| Mile 22                            | One-time-watch  |
| Captive State                      | One-time-watch  |
| Kidnap                             | One-time-watch  |
| Annabelle Comes Home               | One-time-watch  |
| Jigsaw                             | One-time-watch  |
| Pet Sematary                       | One-time-watch  |
| Skyscraper                         | One-time-watch  |
| Insidious: The Last Key            | One-time-watch  |
| Velvet Buzzsaw                     | One-time-watch  |
| Would You Rather                   | One-time-watch  |
| Sleepless                          | One-time-watch  |
| In the Tall Grass                  | One-time-watch  |
| The Curse of La Llorona            | One-time-watch  |
| Mute                               | One-time-watch  |
| The Nun                            | One-time-watch  |
| The Circle                         | One-time-watch  |
| Geostorm                           | One-time-watch  |
| Serenity                           | One-time-watch  |
| Robin Hood                         | One-time-watch  |
| xXx: Return of Xander Cage         | One-time-watch  |
| Rough Night                        | One-time-watch  |
| Truth or Dare                      | One-time-watch  |
| Fifty Shades Freed                 | Flop            |
| The Open House                     | Flop            |
| Race 3                             | Flop            |
+------------------------------------+-----------------+

77 rows selected.
*/


/* Until now, you have analysed various tables of the data set. 
Now, you will perform some tasks that will give you a broader understanding of the data in this segment.*/

-- Segment 4:

-- Q25. What is the genre-wise running total and moving average of the average movie duration? 
-- (Note: You need to show the output table in the question.) 
/* Output format:
+---------------+-------------------+---------------------+----------------------+
| genre			|	avg_duration	|running_total_duration|moving_avg_duration  |
+---------------+-------------------+---------------------+----------------------+
|	comdy		|			145		|	       106.2	  |	   128.42	    	 |
|		.		|			.		|	       .		  |	   .	    		 |
|		.		|			.		|	       .		  |	   .	    		 |
|		.		|			.		|	       .		  |	   .	    		 |
+---------------+-------------------+---------------------+----------------------+*/
-- Type your code below:

WITH GenreDurations AS (
    SELECT genre
          ,AVG(duration) AS avg_duration
    FROM movie
    JOIN genre ON movie.id = genre.movie_id
    GROUP BY genre
)
SELECT 
    genre,
    round(avg_duration,0) as "avg_duration",
    round(SUM(avg_duration) OVER (ORDER BY genre),1) AS "running_total_duration",
    round(AVG(avg_duration) OVER (ORDER BY genre ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW),2) AS "moving_avg_duration"
FROM GenreDurations
ORDER BY genre;

/*
+--------------------+--------------+------------------------+--------------------+
| GENRE              | avg_duration | running_total_duration | moving_avg_duration|
+--------------------+--------------+------------------------+--------------------+
| Action             | 113          | 112.9                  | 112.88             |
| Adventure          | 102          | 214.8                  | 107.38             |
| Comedy             | 103          | 317.4                  | 105.79             |
| Crime              | 107          | 424.4                  | 106.11             |
| Drama              | 107          | 531.2                  | 106.24             |
| Family             | 101          | 632.2                  | 105.36             |
| Fantasy            | 105          | 737.3                  | 105.33             |
| Horror             | 93           | 830                    | 103.75             |
| Mystery            | 102          | 931.8                  | 103.54             |
| Others             | 100          | 1032                   | 103.2              |
| Romance            | 110          | 1141.5                 | 103.78             |
| Sci-Fi             | 98           | 1239.5                 | 103.29             |
| Thriller           | 102          | 1341                   | 103.16             |
+--------------------+--------------+------------------------+--------------------+
*/





-- Round is good to have and not a must have; Same thing applies to sorting


-- Let us find top 5 movies of each year with top 3 genres.

-- Q26. Which are the five highest-grossing movies of each year that belong to the top three genres? 
-- (Note: The top 3 genres would have the most number of movies.)

/* Output format:
+---------------+-------------------+---------------------+----------------------+-----------------+
| genre			|	year			|	movie_name		  |worldwide_gross_income|movie_rank	   |
+---------------+-------------------+---------------------+----------------------+-----------------+
|	comedy		|			2017	|	       indian	  |	   $103244842	     |		1	       |
|		.		|			.		|	       .		  |	   .	    		 |		.	       |
|		.		|			.		|	       .		  |	   .	    		 |		.	       |
|		.		|			.		|	       .		  |	   .	    		 |		.	       |
+---------------+-------------------+---------------------+----------------------+-----------------+*/
-- Type your code below:

-- Top 3 Genres based on most number of movies
WITH GenreCounts AS (
    SELECT genre
          ,COUNT(*) AS movie_count
     FROM movie
     JOIN genre ON movie.id = genre.movie_id     
    GROUP BY genre
),
TopGenres AS (
    SELECT genre
          ,movie_count
     FROM ( SELECT genre
                  ,movie_count
                  ,ROW_NUMBER() OVER (ORDER BY movie_count DESC) AS rno
             FROM GenreCounts
          ) WHERE rno <= 3
),
TopMovies AS (
    SELECT genre
          ,year
          ,title
          ,worlwide_gross_income
          ,ROW_NUMBER() OVER (PARTITION BY year, genre ORDER BY SUBSTR(worlwide_gross_income, 3) DESC NULLS LAST) AS movie_rank
    FROM movie
    JOIN genre ON movie.id = genre.movie_id
    WHERE genre IN (SELECT genre FROM TopGenres)
)
SELECT genre AS "genre"
      ,year AS "year"
      ,title AS "movie_name"
      ,worlwide_gross_income AS "world_gross_income"
      ,movie_rank AS "movie_rank"
 FROM TopMovies 
 WHERE movie_rank <= 5 
 ORDER BY genre, year, movie_rank;

 /*
+---------------+------+---------------------------------+---------------------+------------+
| genre         | year | movie_name                      | world_gross_income  | movie_rank |
+---------------+------+---------------------------------+---------------------+------------+
| Comedy        | 2017 | The Healer                      | $ 9979800           | 1          |
| Comedy        | 2017 | Tim Timmerman, Hope of America  | $ 97727             | 2          |
| Comedy        | 2017 | Il a déjà tes yeux              | $ 9755458           | 3          |
| Comedy        | 2017 | Jumanji: Welcome to the Jungle  | $ 962102237         | 4          |
| Comedy        | 2017 | All Nighter                     | $ 96162             | 5          |
| Comedy        | 2018 | La fuitina sbagliata            | $ 992070            | 1          |
| Comedy        | 2018 | Gung-hab                        | $ 9899017           | 2          |
| Comedy        | 2018 | Simmba                          | $ 9865268           | 3          |
| Comedy        | 2018 | Aleksi                          | $ 9791              | 4          |
| Comedy        | 2018 | Os Farofeiros                   | $ 9786399           | 5          |
| Comedy        | 2019 | Eaten by Lions                  | $ 99276             | 1          |
| Comedy        | 2019 | Friend Zone                     | $ 9894885           | 2          |
| Comedy        | 2019 | Organize Isler: Sazan Sarmali   | $ 9831515           | 3          |
| Comedy        | 2019 | Benjamin                        | $ 97521             | 4          |
| Comedy        | 2019 | Brochevarevarura                | $ 9737              | 5          |
+---------------+------+---------------------------------+---------------------+------------+
| Drama         | 2017 | Shatamanam Bhavati              | INR 530500000       | 1          |
| Drama         | 2017 | Winner                          | INR 250000000       | 2          |
| Drama         | 2017 | Thank You for Your Service      | $ 9995692           | 3          |
| Drama         | 2017 | The Healer                      | $ 9979800           | 4          |
| Drama         | 2017 | Shan guang shao nu              | $ 9949926           | 5          |
| Drama         | 2018 | Antony & Cleopatra              | $ 998079            | 1          |
| Drama         | 2018 | Zaba                            | $ 991               | 2          |
| Drama         | 2018 | Canary                          | $ 98665             | 3          |
| Drama         | 2018 | Simmba                          | $ 9865268           | 4          |
| Drama         | 2018 | Une saison en France            | $ 98390             | 5          |
| Drama         | 2019 | Joker                           | $ 995064593         | 1          |
| Drama         | 2019 | Nur eine Frau                   | $ 9884              | 2          |
| Drama         | 2019 | Running with the Devil          | $ 98682             | 3          |
| Drama         | 2019 | Charlie Says                    | $ 98240             | 4          |
| Drama         | 2019 | Transit                         | $ 982372            | 5          |
+---------------+------+---------------------------------+---------------------+------------+
| Thriller      | 2017 | Gi-eok-ui bam                   | $ 9968972           | 1          |
| Thriller      | 2017 | V.I.P.                          | $ 9710283           | 2          |
| Thriller      | 2017 | Fixeur                          | $ 9669              | 3          |
| Thriller      | 2017 | Overdrive                       | $ 9650552           | 4          |
| Thriller      | 2017 | Den 12. mann                    | $ 9567121           | 5          |
| Thriller      | 2018 | The Villain                     | INR 1300000000      | 1          |
| Thriller      | 2018 | Shéhérazade                     | $ 966225            | 2          |
| Thriller      | 2018 | Truth or Dare                   | $ 95330493          | 3          |
| Thriller      | 2018 | La nuit a dévoré le monde       | $ 95208             | 4          |
| Thriller      | 2018 | Replicas                        | $ 9206925           | 5          |
| Thriller      | 2019 | Prescience                      | $ 9956              | 1          |
| Thriller      | 2019 | Joker                           | $ 995064593         | 2          |
| Thriller      | 2019 | Running with the Devil          | $ 98682             | 3          |
| Thriller      | 2019 | The Boat                        | $ 98559             | 4          |
| Thriller      | 2019 | Division 19                     | $ 981               | 5          |
+---------------+------+---------------------------------+---------------------+------------+
45 rows selected.
 */



-- Finally, let’s find out the names of the top two production houses that have produced the highest number of hits among multilingual movies.
-- Q27.  Which are the top two production houses that have produced the highest number of hits (median rating >= 8) among multilingual movies?
/* Output format:
+-------------------+-------------------+---------------------+
|production_company |movie_count		|		prod_comp_rank|
+-------------------+-------------------+---------------------+
| The Archers		|		830			|		1	  		  |
|	.				|		.			|			.		  |
|	.				|		.			|			.		  |
+-------------------+-------------------+---------------------+*/
-- Type your code below:
WITH HitMovies AS (
    SELECT movie_id
          ,production_company
          ,languages
          ,LENGTH(languages) - LENGTH(REPLACE(languages, ',', '')) + 1 AS language_count
     FROM movie
     JOIN ratings ON id = movie_id
    WHERE  median_rating >= 8
      AND production_company IS NOT NULL
      AND (LENGTH(languages) - LENGTH(REPLACE(languages, ',', '')) + 1) > 1    
),
ProductionHouseHits AS (
    SELECT production_company
          ,COUNT(*) AS movie_count
      FROM HitMovies
    GROUP BY production_company
),
RankedProductionHouses AS (
    SELECT production_company
          ,movie_count
          ,ROW_NUMBER() OVER (ORDER BY movie_count DESC) AS prod_comp_rank
    FROM ProductionHouseHits
)
SELECT production_company AS "production_company"
      ,movie_count AS "movie_count"
      ,prod_comp_rank AS "prod_comp_rank"
FROM RankedProductionHouses
WHERE prod_comp_rank <= 2
ORDER BY prod_comp_rank;

/*
+-----------------------+-------------+----------------+
|  production_company   | movie_count | prod_comp_rank |
+-----------------------+-------------+----------------+
| Star Cinema           |           7 |              1 |
| Twentieth Century Fox |           4 |              2 |
+-----------------------+-------------+----------------+
*/



-- Multilingual is the important piece in the above question. It was created using POSITION(',' IN languages)>0 logic
-- If there is a comma, that means the movie is of more than one language


-- Q28. Who are the top 3 actresses based on the number of Super Hit movies (Superhit movie: average rating of movie > 8) in 'drama' genre?

-- Note: Consider only superhit movies to calculate the actress average ratings.
-- (Hint: You should use the weighted average based on votes. If the ratings clash, then the total number of votes
-- should act as the tie breaker. If number of votes are same, sort alphabetically by actress name.)

/* Output format:
+---------------+-------------------+---------------------+----------------------+-----------------+
| actress_name	|	total_votes		|	movie_count		  |	  actress_avg_rating |actress_rank	   |
+---------------+-------------------+---------------------+----------------------+-----------------+
|	Laura Dern	|			1016	|	       1		  |	   9.6000		     |		1	       |
|		.		|			.		|	       .		  |	   .	    		 |		.	       |
|		.		|			.		|	       .		  |	   .	    		 |		.	       |
+---------------+-------------------+---------------------+----------------------+-----------------+*/

-- Type your code below:
WITH SuperHitMovies AS (
    SELECT movie.id
          ,movie.title
          ,genre
          ,avg_rating
          ,total_votes
    FROM movie
    JOIN ratings ON movie.id = ratings.movie_id    
    JOIN genre ON genre.movie_id = movie.id
    WHERE genre = 'Drama' AND avg_rating > 8
),
ActressSuperHitMovies AS (
    SELECT role_mapping.movie_id AS movie_id
          ,names.name AS actress_name
          ,SuperHitMovies.id
          ,SuperHitMovies.avg_rating as rating
          ,ratings.total_votes as votes
    FROM SuperHitMovies
    JOIN role_mapping ON role_mapping.movie_id = SuperHitMovies.id
    JOIN ratings ON ratings.movie_id = SuperHitMovies.id
    JOIN names ON names.id = role_mapping.name_id
    WHERE category = 'actress'
),
ActressRatings AS (
    SELECT actress_name
          ,SUM(votes * rating) / SUM(votes) AS actress_avg_rating
          ,COUNT(movie_id) AS movie_count
          ,SUM(votes) AS total_votes
     FROM ActressSuperHitMovies
     GROUP BY actress_name
),
RankedActresses AS (
    SELECT actress_name
          ,total_votes
          ,movie_count
          ,actress_avg_rating
          ,ROW_NUMBER() OVER (ORDER BY actress_avg_rating DESC, total_votes DESC, actress_name) AS actress_rank
    FROM ActressRatings
)
SELECT 
    actress_name AS "actres_name",
    total_votes AS "total_votes",
    movie_count AS "movie_count",
    round(actress_avg_rating,2) as "actress_avg_rating",
    actress_rank AS "actress_rank"
FROM RankedActresses
WHERE actress_rank <= 3
ORDER BY actress_rank;


/*
+--------------------+-------------+-------------+------------------+--------------+
| actress_name       | total_votes | movie_count | actress_avg_rating | actress_rank |
+--------------------+-------------+-------------+------------------+--------------+
| Sangeetha Bhat     | 1010        | 1           | 9.6              | 1            |
| Adriana Matoshi    | 3932        | 1           | 9.4              | 2            |
| Fatmire Sahiti     | 3932        | 1           | 9.4              | 3            |
+--------------------+-------------+-------------+------------------+--------------+

*/




/* Q29. Get the following details for top 9 directors (based on number of movies)
Director id
Name
Number of movies
Average inter movie duration in days
Average movie ratings
Total votes
Min rating
Max rating
total movie durations

Format:
+---------------+-------------------+---------------------+----------------------+--------------+--------------+------------+------------+----------------+
| director_id	|	director_name	|	number_of_movies  |	avg_inter_movie_days |	avg_rating	| total_votes  | min_rating	| max_rating | total_duration |
+---------------+-------------------+---------------------+----------------------+--------------+--------------+------------+------------+----------------+
|nm1777967		|	A.L. Vijay		|			5		  |	       177			 |	   5.65	    |	1754	   |	3.7		|	6.9		 |		613		  |
|	.			|		.			|			.		  |	       .			 |	   .	    |	.		   |	.		|	.		 |		.		  |
|	.			|		.			|			.		  |	       .			 |	   .	    |	.		   |	.		|	.		 |		.		  |
|	.			|		.			|			.		  |	       .			 |	   .	    |	.		   |	.		|	.		 |		.		  |
|	.			|		.			|			.		  |	       .			 |	   .	    |	.		   |	.		|	.		 |		.		  |
|	.			|		.			|			.		  |	       .			 |	   .	    |	.		   |	.		|	.		 |		.		  |
|	.			|		.			|			.		  |	       .			 |	   .	    |	.		   |	.		|	.		 |		.		  |
|	.			|		.			|			.		  |	       .			 |	   .	    |	.		   |	.		|	.		 |		.		  |
|	.			|		.			|			.		  |	       .			 |	   .	    |	.		   |	.		|	.		 |		.		  |
+---------------+-------------------+---------------------+----------------------+--------------+--------------+------------+------------+----------------+

--------------------------------------------------------------------------------------------*/
-- Type you code below:
WITH DirectorMovies AS (
    SELECT director_mapping.name_id as director_id
          ,names.name AS director_name
          ,movie.id movie_id
          ,movie.duration AS duration
          ,ratings.avg_rating as rating
          ,ratings.total_votes as votes
          ,movie.date_published AS date_published
          ,LAG(movie.date_published,1) OVER (PARTITION BY director_mapping.name_id ORDER BY movie.date_published) AS prev_date_published
    FROM movie
    JOIN director_mapping ON movie.id = director_mapping.movie_id
    JOIN names ON names.id = director_mapping.name_id
    JOIN ratings ON ratings.movie_id = movie.id
),
DirectorStats AS (
    SELECT director_id
          ,director_name
          ,COUNT(movie_id) AS number_of_movies
          ,AVG(date_published - prev_date_published) AS avg_inter_movie_days
          ,AVG(rating) AS avg_rating
          ,SUM(votes) AS total_votes
          ,MIN(rating) AS min_rating
          ,MAX(rating) AS max_rating
          ,SUM(duration) AS total_duration
    FROM DirectorMovies
    GROUP BY director_id, director_name
),
TopDirectors AS (
    SELECT director_id
          ,director_name
          ,number_of_movies
          ,avg_inter_movie_days
          ,avg_rating
          ,total_votes
          ,min_rating
          ,max_rating
          ,total_duration
          ,ROW_NUMBER() OVER (ORDER BY number_of_movies DESC) AS director_rank
    FROM DirectorStats
)
SELECT director_id AS "director_id"
      ,director_name AS "director_name"
      ,number_of_movies AS "number_of_movies"
      ,round(avg_inter_movie_days,0) AS "avg_inter_movie_days"
      ,round(avg_rating,2) AS "avg_rating"
      ,total_votes AS "total_votes"
      ,round(min_rating,1) AS "min_rating"
      ,round(max_rating,1) AS "max_rating"
      ,total_duration
FROM TopDirectors
WHERE director_rank <= 9
ORDER BY director_rank;

/*
+-------------+----------------------------+------------------+-----------------------+-----------+-------------+------------+------------+----------------+
| director_id | director_name              | number_of_movies | avg_inter_movie_days  | avg_rating | total_votes | min_rating | max_rating | total_duration |
+-------------+----------------------------+------------------+-----------------------+-----------+-------------+------------+------------+----------------+
| nm2096009   | Andrew Jones               | 5                | 191                   | 3.02       | 1989        | 2.7        | 3.2        | 432            |
| nm1777967   | A.L. Vijay                 | 5                | 177                   | 5.42       | 1754        | 3.7        | 6.9        | 613            |
| nm0515005   | Sam Liu                    | 4                | 260                   | 6.23       | 28557       | 5.8        | 6.7        | 312            |
| nm0814469   | Sion Sono                  | 4                | 331                   | 6.03       | 2972        | 5.4        | 6.4        | 502            |
| nm0425364   | Jesse V. Johnson           | 4                | 299                   | 5.45       | 14778       | 4.2        | 6.5        | 383            |
| nm2691863   | Justin Price               | 4                | 315                   | 4.5        | 5343        | 3.0        | 5.8        | 346            |
| nm0001752   | Steven Soderbergh          | 4                | 254                   | 6.48       | 171684      | 6.2        | 7.0        | 401            |
| nm6356309   | Özgür Bakar                | 4                | 112                   | 3.75       | 1092        | 3.1        | 4.9        | 374            |
| nm0831321   | Chris Stokes               | 4                | 198                   | 4.33       | 3664        | 4.0        | 4.6        | 352            |
+-------------+----------------------------+------------------+-----------------------+-----------+-------------+------------+------------+----------------+

9 rows selected.
*/






