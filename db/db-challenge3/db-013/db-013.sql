BEGIN;
UPDATE user
   SET is_deleted = 1
 WHERE (businessphone_number IS NULL OR businessphone_number = '')
   AND (cellphone_number IS NULL OR cellphone_number = '')
   AND is_deleted <> 1;
COMMIT;
