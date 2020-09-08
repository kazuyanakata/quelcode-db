SELECT u.name AS ユーザー名, c.name AS チャットルーム名, SUBSTRING(p.created_at, 1, 10) AS 参加日時
  FROM chat_participant p
  JOIN user u
    ON p.user_id = u.id
  JOIN chat c
    ON p.chat_id = c.id
WHERE u.is_deleted <> 1
  AND c.is_deleted <> 1
ORDER BY p.created_at;
