# CodeJudge ERD / Relationship Diagram

batches
PK: batch_id

students
PK: student_id
FK: batch_id → batches.batch_id

courses
PK: course_id

enrollments
PK: enrollment_id
FK: student_id → students.student_id
FK: course_id → courses.course_id

problems
PK: problem_id
FK: course_id → courses.course_id

test_cases
PK: test_case_id
FK: problem_id → problems.problem_id

contests
PK: contest_id
FK: course_id → courses.course_id

contest_problems
PK: (contest_id, problem_id)
FK: contest_id → contests.contest_id
FK: problem_id → problems.problem_id

submissions
PK: submission_id
FK: student_id → students.student_id
FK: problem_id → problems.problem_id
FK: contest_id → contests.contest_id

test_results
PK: result_id
FK: submission_id → submissions.submission_id
FK: test_case_id → test_cases.test_case_id

sessions
PK: session_id
FK: course_id → courses.course_id

attendance
PK: attendance_id
FK: session_id → sessions.session_id
FK: student_id → students.student_id

regrade_requests
PK: request_id
FK: submission_id → submissions.submission_id
FK: student_id → students.student_id

plagiarism_flags
PK: flag_id
FK: submission_id → submissions.submission_id
FK: matched_submission_id → submissions.submission_id

raw_student_import
PK: raw_row_id

operation_requests
PK: operation_id

Relationships
One batch can have many students
One student can have many enrollments
One course can have many enrollments
One course can have many problems
One problem can have many test cases
One course can have many contests
One contest can contain many problems through contest_problems
One student can make many submissions
One submission can have many test results
One course can have many sessions
One session can have many attendance records
One submission can have many regrade requests
One submission can be linked with plagiarism flags