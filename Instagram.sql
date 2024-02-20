 /* find 5 instagram oldest users */
 
SELECT 
    *
FROM
    users
ORDER BY created_at
LIMIT 5;

 
 /* In which day of week most new user join*/
 
 SELECT 
    DAYNAME(created_at) AS day, COUNT(*) AS count
FROM
    users
GROUP BY day
order by count desc 
limit 2;


/*Users who have never posted photos*/

SELECT 
    username
FROM
    users
        LEFT JOIN
    photos ON users.id = photos.user_id
WHERE
    photos.id IS NULL;    
     
    
    /*find person who can get most likes*/
   
SELECT 
    username, photos.id, image_url, COUNT(photos.id) AS total
FROM
    photos
        INNER JOIN
    likes ON likes.photo_id = photos.id
        INNER JOIN
    users ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;


/*how many time avg user post photos*/
SELECT 
    (SELECT 
            COUNT(*)
        FROM
            Photos) / (SELECT 
            COUNT(*)
        FROM
            users) AS AVG;
            
            
 /* which 5 Hastags commonly used*/
 
 SELECT 
    tags.tag_name, COUNT(*) AS total
FROM
    photo_tags
        JOIN
    tags ON photo_tags.tag_id = tags.id
GROUP BY tags.id
ORDER BY total DESC
LIMIT 5; 
 
 
 /*find user who have liked every single photo*/
 
 SELECT username, 
       Count(*) AS num_likes 
FROM   users 
       INNER JOIN likes 
               ON users.id = likes.user_id 
GROUP  BY likes.user_id 
HAVING num_likes = (SELECT Count(*) 
                    FROM   photos); 
 
 
