-- TRANSACTION SCENARIO 1
-- Student submits a solution and test results are inserted

START TRANSACTION;

INSERT INTO submissions (
    submission_id,
    student_id,
    problem_id,
    score,
    status
)
VALUES (
    1001,
    1,
    2,
    85,
    'Passed'
);

INSERT INTO test_results (
    result_id,
    submission_id,
    test_case_id,
    status
)
VALUES (
    501,
    1001,
    10,
    'Passed'
);

COMMIT;

-- Expected Result:
-- Submission and related test result are permanently saved.



-- TRANSACTION SCENARIO 2
-- Enrollment creation rolled back because of invalid course

START TRANSACTION;

INSERT INTO enrollments (
    enrollment_id,
    student_id,
    course_id
)
VALUES (
    2001,
    1,
    9999
);

ROLLBACK;

-- Expected Result:
-- Invalid enrollment is removed because transaction was rolled back.



-- TRANSACTION SCENARIO 3
-- Score correction with SAVEPOINT and partial rollback

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

-- Expected Result:
-- Valid score update (95) remains.
-- Invalid negative score update is rolled back safely.



-- TRANSACTION SCENARIO 4
-- Regrade request resolved safely

START TRANSACTION;

UPDATE regrade_requests
SET status = 'Resolved'
WHERE request_id = 3;

UPDATE submissions
SET score = score + 5
WHERE submission_id = 7;

COMMIT;

-- Expected Result:
-- Regrade request marked resolved
-- Submission score updated successfully