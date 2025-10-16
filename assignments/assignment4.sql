-- 1. Combine Two Tables
SELECT p.firstName, p.lastName, a.city, a.state
FROM Person p
LEFT JOIN Address a
ON p.personId = a.personId;

-- 2. Secod Highest Salary
select (select distinct salary
from employee 
order by salary desc
limit 1 offset 1) as SecondHighestSalary;

-- 3. Nth Highest Salary
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  DECLARE M INT;
  SET M = N - 1;
  RETURN (
      SELECT DISTINCT Salary
      FROM Employee
      ORDER BY Salary DESC
      LIMIT 1 OFFSET M
  );
END

-- 4. Rank Scores
select score, 
(select count(distinct Score) from Scores where Score >= s.Score) 
as Rank
from Scores as s
order by Score desc;

-- 5. Consecutive numbers
select
distinct Num as ConsecutiveNums
from
(
select
Num, @cnt := if(@prev = (@prev := Num), @cnt + 1, 1) as freq
from
Logs, (select @cnt := 0, @prev := (select Num from Logs limit 1)) as c
) as n
where freq > 2;

-- 6. Employees Earning More than their Managers
select e.Name as Employee
from Employee as e inner join Employee as m on e.ManagerID = m.id
where e.Salary > m.Salary;

-- 7. Duplicate Emails
select Email from person group by Email having count(Email) > 1;

-- 8. Customers Who never order
select Name as Customers
from Customers
where Id not in (
select CustomerId
from Orders
);

-- 9. Delete Duplicate Emails
delete p1
from person as p1, person as p2
where p1.Email = p2.Email and p1.Id > p2.Id;

-- 10. Rising Temperature
select w1.Id
from weather as w1, weathre as w2
where datediff(w1.RecordDate, w2.RecordDate) = 1 and w1.Temperature >
w2.Temperature;

-- 11. Game Play Analysis I
select Player_id, min(event_date) as first_login
from Activity
group by Player_id
order by Player_id;

-- 12. Game play Analysis III
select player_id, event_date, games_played_so_far
from (
select player_id, event_date,
@games := if(player_id =@player, @games + games_played, games_played)
as games_played_so_far,
@player := Player_id
from (select * from Activity order by player_id, event_date) as a,
(select @ player := -1, @games := 0) as tmp
) as t;

-- 13. Managers with at Least 5 Direct Reports
select name from employee
where id in (
select ManagerID
from employee
group by ManagerID
having count(*) >= 5
);

-- 14. Employee Bonus
select name, bonus
from Employee as e left join Bonus as b on e.empId = b.empId
where bonus < 1000 or bonus is null;

-- 15. Find Customer Referee
select name
from customer
where referee_id is null or referee_id <> 2;

-- 16. Customer Placing the Largest Number of Orders
select Customer_number
from (
select customer_number, count(*) as cnt
from orders
group by customer_number
) as e 
order by e.cnt desc
limit 1;

-- 17. Big Countries
select name, population, area
from World
where area >= 3000000 or population >= 25000000;

-- 18. Classes More than 5 students
select class from courses
group by class
having count(distinct student) >= 5;

-- 19. Friend request I: Overall Acceptance Rate
select round(if(requests = 0, 0, accepts / requests), 2) as accept_rate
from 
(
select count(distinct sender_id, send_to_id) as requests
from friend_request
) as a;

-- 20. Consecutive Avaiable Seats
select distinct c1.seat_id
from cinema as c1 join cinema as c2 join cinema as c3 on c1.seat_id = c2.seat_id
+ 1 || c1.seat_id = c3.seat_id - 1
where c1.free = 1 and c22.free = 1 and c3.free = 1;

-- 21. Sales Person
select s.name
from salesperson as s
where s.sales_id not in(
select sales_id from orders as o left join company as c on o.com_id = c.com_id
where c.name = 'RED');

-- 22. Tree Node
select id, case when p_id is null then 'Root'
when p_id is not null and id in (select distinct p_id from tree) then 'Inner' else 
'Leaf' end as type from tree;

-- 23. Triangle Judgement
select x, y, z,
case
when x + y > z and x + z > y and y + z > x then 'Yes'
else 'No' end as triangle from triangle;

-- 24. shortest Distance in a Plane
select round(min(dist), 2) as shortest
from (
select if(a.x = b.x and a.y = b.y, 10000, sqrt(power(a.x - b.x, 2) +
power(a.y - b.y, 2))) as dist from point_2nd as a, point_2nd as b
) as d;

-- 25. Shortest Distance in a line
select min(abs(a.x - b.x)) as shortest
from point as a, point as b
where a.x != b.x;

-- 26. Biggest Single Number
select max(num) as num
from (
select num
from my_numbers
group by num
having count(num) = 1
) as n;

-- 27. Not boring Movies
select id, movie, description, rating
from cinema
where id % 2 = 1 and description <> 'boring'
order by rating desc;

-- 28. Exchange Seats
select if(mod(id, 2) = 0, id - 1, if(id < (select max(id) from seat), id + 1,id))
as id, student from seat order by id;

-- 29. swap salary
select sex = case when sex = 'm' then 'f' else 'm' end;

-- 30. Customers who bought all products
select customer_id from customer group by customer_id
having sum(distinct product_key) = (
select sum(product_key) from product );

-- 31. Actors and directors who cooperated at least three times
select actor_id, director_id from ActorDirector
group by actor_id, director_id
having count(*) >= 3;

-- 32. Product Sales Analysis I
select distinct
p.product_name, s.year, s.price
from (select distinct product_id, year, price from sales) s
inner join product as p
using (product_id);

-- 33. Product Sales Analysis II
select product_id, sum(quantity) as total_quantity from sales group by product_id;

-- 34. Product sales Analysis III
select product_id, year as first_year, quantity, price
from sales 
where (product_id, year) in (select product_id, min(year) as year from sales
group by product_id);

-- 35. Project Employees I
select project_id, round(avg(experience_years), 2) as average_years
from project as p left join employee as e on p.employee_id = e.employee_id
group by project_id;

-- 36. Project employees II
select project_id from project group by project_id having count(employee_id) >= (
select count(smployee_id) as cnt
from project group by project_id order by cnt desc limit 1 );

-- 37. Project Employees III
select p.project_id, e.employee_id from (
select project_id, max(experience_years) as max_years
from project as p join Employee as e
on p.employee_id = e.employee_id
group by project_id ) as q,
project as p, 
Employee as e
where p.project_id = q.project_id and p.employee_id = e.employee_id and e.experience_years >= max_years;

-- 38. Sales Analysis I
select seller_id from sales group by seller_id having sum(price) >= (
select sum(price) as total_price from sales group by seller_id order by total_price desc limit 1);

-- 39. Sales analysis II
select distinct s.buyer_id from sales as s join product as p on s.product_id = p.product_id
where product_name = 'S8' and s.buyer_id not in (
select buyer_id from sales as s join product as p on s.product_id = p.product_id
where product_name = 'iphone' );

-- 40. Sales Analysis III
select product_id, product_name
from sales inner join product using(product_id)
group by product_id having sum(if(sales_date between '2019-01-01' and '2019-03-31', 1, 0)) =
sum (if(sale_date, 1, 0));

-- 41. Highest Grade for Each Student
select student_id, min(course_id) as course_id, grade
from Enrollments
where (student_id, grade) in (
select student_id, max(grade)
from Enrollments
group by student_id
)
group by student_id
order by student_id asc;

-- 42. Reported Posts
select extra as report_reason, count(*) as report_count
from (
select post_id, extra
from Actions
where action_date = '2019-07-04' and action = 'report'
group by post_id, extra) as t
group by t.extra;

-- 43. Active Businesses
select business_id
from Events e,
(
select event_type, avg(occurences) as avg_occurences
from Events
group by event_type
) as a
where e.event_type = a.event_type and e.occurences > a.avg_occurences
group by e.business_id
having count(*) > 1;

-- 44. User Activity for the past 30 days I
select activity_date as day, count(distinct user_id) as active_users
from Activity
where activity_date between '2019-06-28' and '2019-07-27'
group by day;

-- 45. User Activity for the past 30 days II
select round(ifnull(sum(sessions) / count(user_id), 0), 2) as
average_sessions_per_user
from (
select distinct user_id, count(distinct session_id) as sessions
from Activity
where activity_date between '2019-06-28' and '2019-07-27'
group by user_id
having count(*) >= 1
) as u;

-- 46. Article Views I
select distinct author_id as id
from Views
where author_id = viewer_id
order by author_id;

-- 47. Product price at a given date
select
i.product_id,
max(if(i.product_id not in (select product_id from Products where change_date
<= date '2019-08-16' group by product_id), 10, (select new_price from Products
where product_id = i.product_id and product_id = q.product_id and change_date =
q.max_change_date))) as price
from
(select distinct product_id from Products) as i,
(
select product_id, max(change_date) as max_change_date
from Products
where change_date <= date '2019-08-16'
group by product_id
) as q
group by i.product_id;

-- 48. Immediate Food Delivery I
select round(
sum(case when order_date = customer_pref_delivery_date then 1 else 0 end) /
count(delivery_id) * 100
, 2) as immediate_percentage
from Delivery;

-- 49. Immerdiate Foor Delivery II
select round(sum(if(order_date = customer_pref_delivery_date, 1, 0)) / count(*)
* 100, 2) as immediate_percentage
from Delivery
where (customer_id, order_date) in (
select customer_id, min(order_date)
from Delivery
group by customer_id
);

-- 50. Reformat Department Table
select id,
sum(if(month = 'Jan', revenue, null)) as Jan_Revenue,
sum(if(month = 'Feb', revenue, null)) as Feb_Revenue,
sum(if(month = 'Mar', revenue, null)) as Mar_Revenue,
sum(if(month = 'Apr', revenue, null)) as Apr_Revenue,
sum(if(month = 'May', revenue, null)) as May_Revenue,
sum(if(month = 'Jun', revenue, null)) as Jun_Revenue,
sum(if(month = 'Jul', revenue, null)) as Jul_Revenue,
sum(if(month = 'Aug', revenue, null)) as Aug_Revenue,
sum(if(month = 'Sep', revenue, null)) as Sep_Revenue,
sum(if(month = 'Oct', revenue, null)) as Oct_Revenue,
sum(if(month = 'Nov', revenue, null)) as Nov_Revenue,
sum(if(month = 'Dec', revenue, null)) as Dec_Revenue
from Department
group by id;

-- 51. Monthly Transactions I
select
date_format(trans_date, '%Y-%m') as month, country,
count(*) as trans_count,
sum(if(state='approved', 1, 0)) as approved_count,
sum(amount) as trans_total_amount,
sum(if(state='approved', amount, 0)) as approved_total_amount
from Transactions
group by date_format(trans_date, '%Y-%m'), country;

-- 52. Last Person to fit in the Elevator
select person_name
from
(
select
person_name, @total_weight := @total_weight + weight as total_weight
from
Queue,
(select @total_weight := 0) as tmp
order by turn
) as t
where total_weight <= 1000
order by total_weight desc
limit 1;

-- 53. Queries Quality and Percentage
select query_name, round(avg(rating / position), 2) as quality,
round(avg(if(rating < 3, 1, 0)) * 100, 2) as poor_query_percentage
from Queries
group by query_name;

-- 54. Team Scores in Football Tournament
select t.team_id, team_name, ifnull(num_points, 0) as num_points
from
Teams as t
left join
(
select team_id, sum(num_points) as num_points
from
(
select
host_team as team_id,
sum(case
when host_goals > guest_goals then 3
when host_goals = guest_goals then 1
else 0 end) as num_points
from Matches
group by host_team
union all
select
guest_team as team_id,
sum(case
when host_goals < guest_goals then 3
when host_goals = guest_goals then 1
else 0 end) as num_points
from Matches
group by guest_team
) as u
group by team_id
) as r
on t.team_id = r.team_id
order by num_points desc, team_id asc;

-- 55. Report Contiguous Dates
select period_state, start_date, end_date
from
(
select 'failed' as period_state, f1.fail_date as start_date, f2.fail_date as
end_date
from
(
select fail_date
from Failed
where fail_date between '2019-01-01' and '2019-12-31' and
date_sub(fail_date, interval 1 day) not in (select * from Failed where fail_date
between '2019-01-01' and '2019-12-31')
) as f1,
(
select fail_date
from Failed
where fail_date between '2019-01-01' and '2019-12-31' and
date_add(fail_date, interval 1 day) not in (select * from Failed where fail_date
between '2019-01-01' and '2019-12-31')
) as f2
where f1.fail_date <= f2.fail_date
group by f1.fail_date
union
select 'succeeded' as period_state, s1.success_date as start_date,
s2.success_date as end_date
from
(
select success_date
from Succeeded
where success_date between '2019-01-01' and '2019-12-31' and
date_sub(success_date, interval 1 day) not in (select * from Succeeded where
success_date between '2019-01-01' and '2019-12-31')
) as s1,
(
select success_date
from Succeeded
where success_date between '2019-01-01' and '2019-12-31' and
date_add(success_date, interval 1 day) not in (select * from Succeeded where
success_date between '2019-01-01' and '2019-12-31')
) as s2
where s1.success_date <= s2.success_date
group by s1.success_date
) as p
order by start_date;

-- 56. Number of comments per post
select t.post_id, count(distinct s.sub_id) as number_of_comments
from (
select distinct sub_id as post_id
from Submissions
where parent_id is null
) as t
left join
Submissions as s
on t.post_id = s.parent_id
group by t.post_id
order by t.post_id;

-- 57. Average Selling Price
select distinct p.product_id, round(sum(price * units) / sum(units), 2) as
average_price
from Prices as p join UnitsSold as u
on p.product_id = u.product_id and u.purchase_date between p.start_date and
p.end_date
group by p.product_id
order by p.product_id;

-- 58. Page Recommendations
select distinct page_id as recommended_page
from Likes as l left join Friendship as f on f.user2_id = l.user_id
where f.user1_id = 1 and page_id not in (
select page_id from Likes where user_id = 1
)
union
select distinct page_id as recommended_page
from Likes as l left join Friendship as f on f.user1_id = l.user_id
where f.user2_id = 1 and page_id not in (
select page_id from Likes where user_id = 1
);

-- 60. All people Report to the given Manager
select distinct e1.employee_id
from Employees as e1 inner join Employees as e2 inner join Employees as e3 on
e1.manager_id = e2.employee_id and e2.manager_id = e3.employee_id
where e1.employee_id <> 1 and (e1.manager_id = 1 or e2.manager_id = 1 or
e3.manager_id = 1);

-- 61. Students and Examinations
select s.student_id, s.student_name, u.subject_name, count(e.subject_name) as
attended_exams
from
Students as s join Subjects as u left join Examinations as e
on
s.student_id = e.student_id and u.subject_name = e.subject_name
group by s.student_id, u.subject_name
order by s.student_id, u.subject_name;

-- 62. Find the start and end number of continuous ranges
select l1.log_id as start_id, l2.log_id as end_id
from
(
select log_id
from Logs
where log_id - 1 not in (select * from Logs)
) as l1,
(
select log_id
from Logs
where log_id + 1 not in (select * from Logs)
) as l2
where l1.log_id <= l2.log_id
group by l1.log_id;

-- 63. Weather Type in Each country
select
country_name,
case
when avg(weather_state) <= 15 then 'Cold'
when avg(weather_state) >= 25 then 'Hot'
else 'Warm'
end as weather_type
from
Weather as w
left join
Countries as c
on c.country_id = w.country_id
where day between '2019-11-01' and '2019-11-30'
group by w.country_id;

-- 64. find the Team Size
select employee_id, team_size
from Employee as e join (select team_id, count(*) as team_size from employee
group by team_id) as t
on e.team_id = t.team_id;

-- 65. Running Total for Different Genders
select s1.gender, s1.day, sum(s2.score_points) as total
from Scores as s1 join Scores as s2 on s1.gender = s2.gender and s1.day >=
s2.day
group by s1.gender, s1.day
order by gender, day;

-- 66. Restaurant Growth
select 
visited_on, amount, average_amount
from (
select
visited_on,
@cnt := @cnt + 1 as cnt,
@d7 := @d6,
@d6 := @d5,
@d5 := @d4,
@d4 := @d3,
@d3 := @d2,
@d2 := @d1,
@d1 := amount,
@total := @d1 + @d2 + @d3 + @d4 + @d5 + @d6 + @d7 as amount,
round(@total / 7, 2) as average_amount
from
(
select visited_on, sum(amount) as amount
from Customer
group by visited_on
) as c,
(
select
@cnt := 0,
@total := 0,
@d1 := 0,
@d2 := 0,
@d3 := 0,
@d4 := 0,
@d5 := 0,
@d6 := 0,
@d7 := 0
) as t
) as s
where cnt >= 7;

-- 67. Ads Performance
select ad_id, round(if(clicks + views = 0, 0, clicks / (clicks + views) * 100),
2) as ctr
from (
select ad_id, sum(if(action='Clicked', 1, 0)) as clicks,
sum(if(action='Viewed', 1, 0)) as views
from Ads
group by ad_id
) as a
order by ctr desc, ad_id asc;

-- 68. List the Products ordered in a period
select product_name, sum(unit) as unit
from Orders as o left join Products as p on o.product_id = p.product_id
where order_date between '2020-02-01' and '2020-02-29'
group by o.product_id
having sum(unit) >= 100;

-- 69. Number of Transactions per Visit
select (select 0) as transactions_count, count(*) as visits_count
from Visits
where (user_id, visit_date) not in (
select user_id, transaction_date
from Transactions
)
union
select s.transactions_count, if(visits_count is null, 0, visits_count) as
visits_count
from (
select tc as transactions_count
from (
select t.user_id, @tc := @tc + 1 as tc
from Transactions as t, (select @tc := 0) as u
) as s
where tc <= (
select ifnull(max(transactions_count), 0)
from (
select count(*) as transactions_count
from Transactions
group by user_id, transaction_date
) as t
)
) as s left join (
select transactions_count, count(*) as visits_count
from (
select count(*) as transactions_count
from Transactions
group by user_id, transaction_date
) as t
group by transactions_count
) as t on s.transactions_count = t.transactions_count
order by transactions_count;
