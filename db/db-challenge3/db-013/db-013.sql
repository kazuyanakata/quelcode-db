BEGIN;
UPDATE user
   SET is_deleted = 1
 WHERE businessphone_number IS NULL
   AND cellphone_number IS NULL
   AND is_deleted <> 1;
COMMIT;
