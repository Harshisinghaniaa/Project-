use ig_clone;

#Launch AD Campaign: The team wants to know, which day would be the best day to launch ADs. 
#Task 5 : What day of the week do most users register on? Provide insights on 
#when to schedule an ad campaign.
select dayname(created_at) as day,count(*) as `Total registered users` from users
 group by day order by `Total registered users` desc;

#User Engagement: Are users still as active and post on Instagram or they are making fewer posts 
#Task 6 : Provide how many times does average user posts on Instagram. 
#Also, provide the total number of photos on Instagram/total number of users 
select (select count(*) from photos)/(select count(*) from users) as Avg_posts;

#Bots & Fake Accounts: The investors want to know if the platform is crowded with fake 
#and dummy accounts 
#Task 7: Provide data on users (bots) who have liked every single photo on the site 
#(since any normal user would not be able to do this). 
select users.id,users.username,count(*) as `Total likes by user` from users 
inner join likes on likes.user_id = users.id 
group by likes.user_id 
order by `Total likes by user` desc;