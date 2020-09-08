BEGIN;
DELETE FROM chat_participant
 WHERE EXISTS
(SELECT * FROM user WHERE user.id = chat_participant.user_id AND user.is_deleted = 1);
COMMIT;
