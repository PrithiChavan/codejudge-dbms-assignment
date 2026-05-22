# Reliability Incident Note

## Incident Title
Accidental UPDATE Without WHERE Clause in CodeJudge Database

---

## What Went Wrong

A developer accidentally executed the following query:

```sql
UPDATE submissions
SET score = 0;