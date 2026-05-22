# ACID Explanation

## Transaction Scenario Used
Score correction using SAVEPOINT and partial rollback.

```sql
START TRANSACTION;

UPDATE submissions
SET score = 95
WHERE submission_id = 5;

SAVEPOINT score_update_done;

UPDATE submissions
SET score = -50
WHERE submission_id = 5;

ROLLBACK TO score_update_done;

COMMIT;