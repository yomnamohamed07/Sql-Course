/*Question 01 :
● If a hotel is deleted from the Hotels table, what is the appropriate
behavior for the rooms belonging to that hotel? Explain which
foreign key rule you would choose and why And Represent Rule

On Delete Cascade

Question 02 :
● When a room is deleted from the Rooms table, what should
happen to the related records in Amenities? Which rule makes the
most sense for this relationship, and why? And Represent Rule

On Delte Cascade

Question 03 :
● If a staff member’s ID changes, what impact should this have on
the Services they are linked to? Which update rule is most
suitable? And Represent Rule

On Delete Cascade 
*/

/*Question 01 :
● Write a query to display all users along with all post types

--select u.DisplayName , pt.Type
--from Users u cross join PostTypes pt;
*/



/*Write a query to retrieve all posts along with their owner's
display name and reputation. Only include posts that have an
owner.

--select *,u.DisplayName As username , u.Reputation 
--from Users u inner join Posts p
--on u.Id = p.OwnerUserId ;
*/


/*Write a query to show all comments with their associated post
titles. Display the comment text, comment score, and post title

--select  top 20 p.Title , c.Text ,c.Score
--from Posts p  inner join Comments c
--on p.Id = c.PostId ;
*/

/* Write a query to list all users and their badges (if any).
Include users even if they don't have badges. Show display name,
badge name, and badge date. 

--select top 50 u.DisplayName , b.Name , b.Date
--from Users u left outer join Badges b
--on u.Id = b.UserId;
*/

/*Question 05 :
● Write a query to display all posts along with their comments (if
any). Include posts that have no comments. Show post title, post
score, comment text, and comment score.

--select top 50 P.Title , P.Score , C.Text , C.Score
--from Posts P left outer join Comments C
--on P.Id = C.PostId;
*/

/*Write a query to show all votes along with their corresponding
posts. Include all votes even if the post information is missing.
Display vote type ID, creation date, and post title. 

--select top 50 V.VoteTypeId ,V.CreationDate , P.Title
--from Posts P right outer join Votes V 
--on P.Id = V.PostId ;
*/

/* Write a query to find all answers (posts with ParentId) along with
their parent question. Show the answer title, answer score,
question title, and question score.

--select top 50 Question.Title  , Question.Score , Answers.Title , Answers.Score
--from Posts Question  inner join Posts Answers
--on Question.Id = Answers.ParentId;
*/


/*Question 08 :
● Write a query to display all related posts using the PostLinks table.
Show the original post title, related post title, and link type ID


--select O.Title As OriginalPostTitle, 
--Pr.Title As RelatedPostTitle,
--L.LinkTypeId As LinkTypeID
--from Posts O inner join PostLinks L
--on O.Id = L.PostId
--inner join Posts PR
--on PR.Id = L.RelatedPostId;
*/

/*Question 09 :
● Write a query to show posts with their authors and the post type
name. Display post title, author display name, author reputation,
and post type

--select top 50 P.Title , PT.Type , U.DisplayName As AuthorName  , U.Reputation As AuthorReputation
--from Posts P inner join PostTypes PT
--on P.PostTypeId = PT.Id
--inner join Users U
--on U.Id = P.OwnerUserId;

*/


/*Question 10 :
● Write a query to retrieve all comments along with the post title,
post author, and the commenter's display name. 


--SELECT top 50
--    C.Text AS CommentText,
--    P.Title AS PostTitle,
--    PU.DisplayName AS PostAuthor,
--    CU.DisplayName AS Commenter
--FROM Comments C
--INNER JOIN Posts P
--    ON C.PostId = P.Id
--INNER JOIN Users PU
--    ON P.OwnerUserId = PU.Id
--INNER JOIN Users CU
--    ON C.UserId = CU.Id;
*/

/*Question 11 :
● Write a query to display all votes with post information and vote
type name. Show post title, vote type name, creation date, and
bounty amount. 

--SELECT TOP 50
--    P.Title AS PostTitle,
--    VT.Name AS VoteTitle,
--    V.CreationDate,
--    V.BountyAmount
--FROM Votes V
--INNER JOIN Posts P
--    ON V.PostId = P.Id
--INNER JOIN VoteTypes VT
--    ON V.VoteTypeId = VT.Id;
*/

/*Write a query to show all users along with their posts and
comments on those posts. Include users even if they have no
posts or comments. Display user name, post title, and comment
text 

--select top 50 U.DisplayName  As username ,
--              P.Title As posttitle  ,
--			  C.Text As commenttext
--from Users U
--left join Posts P 
--on U.Id = P.OwnerUserId
--left join Comments C
--on U.Id = C.UserId ;
*/


/*Question 13 :
● Write a query to retrieve posts with their authors, post types, and
any badges the author has earned. Show post title, author name,
post type, and badge name.


--select top 50  P.Title As PostTitle ,
--       U.DisplayName As AuthorName ,
--	   PT.Type As PostType ,
--	   B.Name As BadgeName
--from  Posts P 
--inner join Users U
--on P.OwnerUserId = U.Id
--inner join PostTypes PT
--on P.PostTypeId = PT.Id
--inner join Badges B
--on U.Id = B.UserId ;
*/

/*Write a query to create a comprehensive report showing:
post title, post author name, author reputation, comment text,
commenter name, vote type, and vote creation date. Include
posts even if they don't have comments or votes. Filter to only
show posts with a score greater than 5.*/

--SELECT top 50 
--    P.Title AS PostTitle,
--    U.DisplayName AS AuthorName,
--    U.Reputation AS AuthorReputation,
--    C.Text AS CommentText,
--    CU.DisplayName AS CommenterName,
--    VT.Name AS VoteType,
--    V.CreationDate AS VoteCreationDate
--FROM Posts P
--INNER JOIN Users U
--    ON P.OwnerUserId = U.Id

--LEFT JOIN Comments C
--    ON C.PostId = P.Id

--LEFT JOIN Users CU
--    ON C.UserId = CU.Id

--LEFT JOIN Votes V
--    ON V.PostId = P.Id

--LEFT JOIN VoteTypes VT
--    ON V.VoteTypeId = VT.Id

--WHERE P.Score > 5;




