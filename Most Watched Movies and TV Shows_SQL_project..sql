 
-- Project Name: Most Watched Movies and TV Shows-- 


--1. Ensuring the data is in good shape

    SELECT * FROM [MoviesTV].[dbo].[Most_Watched_Movies_ TV_Shows]


--2. Top 5 most-watched shows

     SELECT top (5) Title,Type, Watchtime_in_Million 
     FROM [MoviesTV].[dbo].[Most_Watched_Movies_ TV_Shows]
     ORDER BY Watchtime_in_Million DESC;


--3. Count of TV Shows vs. Movies

     SELECT Type, COUNT(*) 
     FROM [MoviesTV].[dbo].[Most_Watched_Movies_ TV_Shows]
     GROUP BY Type;


--4. Union of TV Shows and Movies with Watchtime Over 5M

    SELECT Title, Type, Watchtime_in_Million
    FROM [MoviesTV].[dbo].[Most_Watched_Movies_ TV_Shows]
    WHERE Type = 'TV Show' AND Watchtime_in_Million > '5.0M'
    UNION
    SELECT Title, Type, Watchtime_in_Million
    FROM [MoviesTV].[dbo].[Most_Watched_Movies_ TV_Shows]
    WHERE Type = 'Movie' AND Watchtime_in_Million > '5.0M';


--5. Most-watched show in each genre

     SELECT Genre, MAX(Watchtime_in_Million) 
     FROM [MoviesTV].[dbo].[Most_Watched_Movies_ TV_Shows] 
     GROUP BY Genre;


--6. Shows released in 2023

     SELECT Title 
     FROM [MoviesTV].[dbo].[Most_Watched_Movies_ TV_Shows]
     WHERE Premiere = 2023;


--7. Total watchtime by genre

     SELECT Genre, SUM(CAST(Watchtime as bigint)) AS Total_Watchtime 
     FROM [MoviesTV].[dbo].[Most_Watched_Movies_ TV_Shows]
     GROUP BY Genre;


--8. Shows with over 500M watchtime

    SELECT Title, Watchtime_in_Million 
    FROM [MoviesTV].[dbo].[Most_Watched_Movies_ TV_Shows]
    WHERE Watchtime_in_Million > '500.M';

	

--9. Count of shows per genre

     SELECT Genre, COUNT(*) AS Count 
     FROM [MoviesTV].[dbo].[Most_Watched_Movies_ TV_Shows] 
     GROUP BY Genre 
     ORDER BY Count DESC;


--10. List of thriller shows

    SELECT Title, Watchtime_in_Million 
    FROM [MoviesTV].[dbo].[Most_Watched_Movies_ TV_Shows]
    WHERE Genre = 'Thriller';


--11. Percentage of each genre's contribution

       SELECT Genre, 
       SUM(CAST(Watchtime as bigint)) * 100 / (SELECT SUM(CAST(Watchtime as bigint)) 
	   FROM [MoviesTV].[dbo].[Most_Watched_Movies_ TV_Shows]) AS Percentage 
       FROM [MoviesTV].[dbo].[Most_Watched_Movies_ TV_Shows]
       GROUP BY Genre;


--12. Show with least watchtime

       SELECT Title, Watchtime
       FROM [MoviesTV].[dbo].[Most_Watched_Movies_ TV_Shows]
       ORDER BY Watchtime ASC;
    

--13. Shows with "Crime" genre having more than 100M watchtime

       SELECT Title, Watchtime_in_Million 
       FROM [MoviesTV].[dbo].[Most_Watched_Movies_ TV_Shows]
       WHERE Genre = 'Crime' AND Watchtime_in_Million > '100.M';


--14. Average watchtime per genre

      SELECT Genre, AVG(Cast(Watchtime as Bigint)) 
      FROM [MoviesTV].[dbo].[Most_Watched_Movies_ TV_Shows]
      GROUP BY Genre;


--15. Total watchtime for movies vs. TV shows

	  SELECT Type, SUM(CAST(Watchtime as bigint)) AS Total_Watchtime
      FROM [MoviesTV].[dbo].[Most_Watched_Movies_ TV_Shows]
      GROUP BY Type;


--16. Rank improvement of "Ginny & Georgia"

     SELECT Rank, Title 
     FROM [MoviesTV].[dbo].[Most_Watched_Movies_ TV_Shows]  
     WHERE Title = 'Ginny & Georgia' 
     ORDER BY Rank;


--17. All shows sorted by premiere year

     SELECT Title, Premiere
     FROM [MoviesTV].[dbo].[Most_Watched_Movies_ TV_Shows]  
     ORDER BY Premiere DESC;


--18. Top 3 action shows

    SELECT top (3)Title, Watchtime 
    FROM [MoviesTV].[dbo].[Most_Watched_Movies_ TV_Shows]  
	WHERE Genre = 'Action' 
	ORDER BY Watchtime DESC;
	


--19. Total watchtime of 2023 releases


	SELECT SUM(Cast(Watchtime as Bigint)) AS Total_Watchtime 
	FROM [MoviesTV].[dbo].[Most_Watched_Movies_ TV_Shows]  
	WHERE Premiere = '2023';


--20. Count of reality shows

	SELECT COUNT(*) AS Reality_Show_Count 
	FROM [MoviesTV].[dbo].[Most_Watched_Movies_ TV_Shows]
	WHERE Genre = 'Reality-Show';


--21. Movies sorted by watchtime

	SELECT Title, Watchtime_in_Million 
	FROM [MoviesTV].[dbo].[Most_Watched_Movies_ TV_Shows]
	WHERE Type = 'Movie' 
	ORDER BY Watchtime_in_Million DESC;


--22. Percentage of TV shows vs. Movies

    SELECT Type, COUNT(*) * 100 / (SELECT COUNT(*) 
	FROM [MoviesTV].[dbo].[Most_Watched_Movies_ TV_Shows]) AS Percentage 
	FROM [MoviesTV].[dbo].[Most_Watched_Movies_ TV_Shows]
	GROUP BY Type;


--23. Shows having "Bridgerton" in title

	SELECT Title, Watchtime_in_Million 
	FROM [MoviesTV].[dbo].[Most_Watched_Movies_ TV_Shows] 
	WHERE Title LIKE '%Bridgerton%';


--24. Show with highest watchtime in last 5 years

	SELECT Title, Watchtime_in_Million 
	FROM [MoviesTV].[dbo].[Most_Watched_Movies_ TV_Shows]  
	WHERE Premiere >= 2020 
	ORDER BY Watchtime_in_Million DESC;


--25. Genre with the highest total watchtime

	SELECT Genre 
	FROM [MoviesTV].[dbo].[Most_Watched_Movies_ TV_Shows]   
	GROUP BY Genre 
	ORDER BY SUM(Cast(Watchtime as Bigint)) DESC 


	--26. Average watchtime of all shows 

	 SELECT AVG(CAST(Watchtime AS BIGINT)) AS Average_Watchtime 
     FROM [MoviesTV].[dbo].[Most_Watched_Movies_ TV_Shows];

	 --27. Comprehensive genre count and titles

     WITH GenreCounts AS (
     SELECT genre, COUNT(*) AS genre_count,
     RANK() OVER (ORDER BY COUNT(*) DESC) AS mostcommon
     FROM [MoviesTV].[dbo].[Most_Watched_Movies_ TV_Shows]   
     GROUP BY genre)
     SELECT DISTINCT COUNT(genre) OVER () AS unique_genres, 
     genre AS most_common_genre FROM GenreCounts;
	



