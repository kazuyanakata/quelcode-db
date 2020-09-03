SELECT COUNT(*) AS 投稿数, c.name AS チャットルーム名
  FROM post p
  JOIN user u
    ON p.create_user_id = u.id
  JOIN chat c
    ON p.chat_id = c.id
 WHERE p.is_deleted <> 1
   AND u.is_deleted <> 1
GROUP BY c.id
ORDER BY COUNT(*) DESC;
