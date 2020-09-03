SELECT id, name, overview, 
       CASE is_file_sendable WHEN 1 THEN '許可'
                             WHEN 0 THEN '禁止'
       END AS is_file_sendable, is_direct_chat, is_deleted, create_user_id, created_at, update_user_id, updated_at
  FROM chat
 WHERE is_deleted <> 1
   AND overview LIKE '%ダイレクトチャット' 
ORDER BY id;
