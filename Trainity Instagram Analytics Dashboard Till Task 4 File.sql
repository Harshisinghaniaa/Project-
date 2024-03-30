show databases;
use ig_clone;
select * from users;
#Rewarding Most Loyal Users: People who have been using the platform for the longest time. 
#Task 1 : Find the 5 oldest users of the Instagram from the database provided
select * from users order by created_at asc limit 5; 

#Remind Inactive Users to Start Posting: By sending them promotional emails to post their 1st photo. 
#Task 2 : Find the users who have never posted a single photo on Instagram 
SELECT users.id, username
FROM users
LEFT JOIN photos ON users.id = photos.user_id
WHERE photos.id IS NULL
ORDER BY username ASC;

#Declaring Contest Winner: The team started a contest and the user who gets the most likes on a single photo will win the contest now they wish to declare the winner.
# Task_3 : Identify the winner of the contest and provide their details to the team
select users.id,users.username ,photos.image_url,count(*) as `Total Likes` from likes 
inner join photos on photos.id = likes.photo_id
inner join users on users.id = likes.photo_id
group by photos.id
 order by `Total Likes` desc limit 1;
 
 #Hashtag Researching: A partner brand wants to know, which hashtags to use in the post to reach the most people on the platform. 
 #Task 4 : Identify and suggest the top 5 most commonly used hashtags on the platform
 select tag_name , count(*) as `Total occurences` from tags 
 inner join photo_tags on tags.id = photo_tags.tag_id 
 group by tags.id 
 order by `Total occurences` desc limit 5;
 