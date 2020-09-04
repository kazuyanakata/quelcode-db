BEGIN;
UPDATE task
   SET is_completed = 1, update_user_id = 1
WHERE created_at BETWEEN '2020-04-26 09:00:00' AND '2020-04-26 11:30:00'
  AND is_deleted <> 1;
COMMIT;
