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
titles. Display the comment text, comment score, and post title*/

select p.Title , c.Text ,c.Score
from Posts p  inner join Comments c
on p.Id = c.PostId ;سس


