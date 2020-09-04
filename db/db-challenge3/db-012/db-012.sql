BEGIN;
UPDATE chat 
   SET is_file_sendable = 0, update_user_id = 1
 WHERE id NOT IN (SELECT chat_id FROM chat_participant WHERE user_id = 1)
   AND is_deleted <> 1
   AND is_file_sendable <> 0;
COMMIT;
