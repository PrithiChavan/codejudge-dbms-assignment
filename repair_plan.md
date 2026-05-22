# TASK 5 : REPAIR PLAN

## 1. Duplicate Student Emails
Issue:
Some students may have duplicate email IDs.

Action:
Ask for manual verification before correction.

Reason:
Two different students should not share the same email. Wrong correction may affect login and communication.

Example:
Student IDs: 101 and 145 using email `student@gmail.com`

Repair Decision:
Manual verification required.


## 2. Negative Scores
Issue:
Some submissions contain scores less than 0.

Action:
Correct the value to 0.

Reason:
Scores cannot be negative in the grading system.

Example:
Submission ID: 2051
Current Score: -5

Repair Decision:
UPDATE score to 0.


## 3. Scores Greater Than Maximum Marks
Issue:
Some submission scores exceed allowed marks.

Action:
Correct the value to maximum allowed marks.

Reason:
Scores higher than maximum marks are invalid.

Example:
Submission ID: 3010
Current Score: 120

Repair Decision:
UPDATE score to 100.


## 4. Invalid Difficulty Values
Issue:
Problems contain invalid difficulty levels.

Action:
Move records to staging table for verification.

Reason:
Difficulty should only be Easy, Medium, or Hard.

Example:
Problem ID: 501
Difficulty: `Very Hard`

Repair Decision:
Move to staging table.


## 5. Invalid Submission Status
Issue:
Some submissions have unsupported statuses.

Action:
Correct the status after verification.

Reason:
Submission status should follow system-defined values.

Example:
Submission ID: 4022
Status: `Done`

Repair Decision:
Change to appropriate valid status.


## 6. Students Linked to Missing Batches
Issue:
Some students reference batch IDs that do not exist.

Action:
Move records to staging table.

Reason:
Foreign key relationship is broken.

Example:
Student ID: 190
Batch ID: 9999

Repair Decision:
Move to staging and verify batch details.


## 7. Duplicate Enrollment Records
Issue:
Same student enrolled multiple times in same course.

Action:
Delete duplicate rows.

Reason:
Enrollment should be unique for each student-course pair.

Example:
Enrollment IDs: 7001 and 7002
Student ID: 55
Course ID: 12

Repair Decision:
Keep one row and delete duplicates.


## 8. NULL Student Names
Issue:
Some student records have blank names.

Action:
Ask for manual verification.

Reason:
Student name is mandatory information.

Example:
Student ID: 212
Name: NULL

Repair Decision:
Manual correction required.


## 9. End Time Before Start Time
Issue:
Contest end time is earlier than start time.

Action:
Correct timestamps.

Reason:
Contest duration becomes invalid.

Example:
Contest ID: 44

Repair Decision:
Update correct end time.


## 10. Invalid Programming Language
Issue:
Some submissions contain unsupported languages.

Action:
Move records to staging table.

Reason:
Only approved languages are allowed.

Example:
Submission ID: 5100
Language: `Ruby`

Repair Decision:
Staging verification required.