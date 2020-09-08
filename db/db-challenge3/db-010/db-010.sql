SELECT u.name AS ユーザー名, p2.投稿日時 AS 投稿日時, c.name AS チャットルーム名
  FROM post p1
  JOIN (SELECT MAX(created_at) AS 投稿日時 FROM post WHERE is_deleted <> 1 GROUP BY chat_id) AS p2
    ON p1.created_at = p2.投稿日時
  JOIN user u
    ON p1.create_user_id = u.id
  JOIN chat c
    ON p1.chat_id = c.id
 WHERE u.is_deleted <> 1;
