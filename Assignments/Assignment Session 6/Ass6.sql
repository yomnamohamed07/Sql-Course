/*Question 01 :
● Write a query to retrieve the top 15 users with the highest
reputation.
● Display their DisplayName, Reputation, and Location.
● Order the results by Reputation in descending order */

--select top(15) u.DisplayName , u.Reputation , u.Location
--from Users u
--order by u.Reputation desc;

/*Question 02 :
● Write a query to get the top 10 posts by score, but include
● all posts that have the same score as the 10th post.
● Use TOP WITH TIES. Display Title, Score, and ViewCount.*/
 
--select top(10) WITH TIES P.Title , P.Score , P.ViewCount
--from Posts P
--where P.Title is not null 
--order by score desc ;

/*Question 03 :
● Write a query to implement pagination: skip the first 20 users
● and retrieve the next 10 users when ordered by reputation.
● Use OFFSET and FETCH. Display DisplayName and Reputation. */

--select u.DisplayName , u.Reputation
--from users u
--order by u.Reputation desc
--offset 20 rows
--fetch NEXT 10 rows only


/*Question 04:
● Write a query to assign a unique row number to each post
● ordered by Score in descending order.
● Use ROW_NUMBER(). Display the row number, Title, and Score.
● Only include posts with non-null titles. */

--select P.Title , P.Score , ROW_NUMBER() over (order by P.Score desc) As RN
--from Posts P 
--where P.Title is not null ;

/*Question 05 :
● Write a query to rank users by their reputation using RANK().
● Display the rank, DisplayName, and Reputation.
● Explain what happens when two users have the same reputation.*/

--select U.DisplayName , U.Reputation , RANK() over (order by U.Reputation desc) 
--from Users U

 -- the similar row take same rank and then skip the same number of this rows and start again 

 /*Question 06 :
● Write a query to rank posts by score using DENSE_RANK().
● Display the dense rank, Title, and Score.
● Explain how DENSE_RANK differs from RANK */

--select P.Title, P.Score , DENSE_RANK() over (order by Score desc) As RN
--from Posts P 
--where P.Title is not null ;

 -- the similar row take same rank and then they dont skip  andsttart from next rank 


 /*Question 07 :
 ● Write a query to divide all users into 5 equal groups (quintiles)
● based on their reputation. Use NTILE(5).
● Display the quintile number, DisplayName, and Reputation. */

--select u.DisplayName , u.Reputation , NTILE(5) over (order by u.Reputation desc ) As quintiles
--from Users u

/*Question 08 :
● Write a query to rank posts within each PostTypeId separately.
● Use ROW_NUMBER() with PARTITION BY.
● Display PostTypeId, rank within type, Title, and Score.
● Order by Score descending within each partition. */

--select P.Title , P.Score , P.PostTypeId , ROW_NUMBER() over (Partition by P.PostTypeId order by Score)
--from Posts P
--where P.Title is not null 




