# Keys and Relationships
## Primary Keys
students table uses student_id as primary key
batches table uses batch_id as primary key
courses table uses course_id as primary key
enrollments table uses enrollment_id as primary key
problems table uses problem_id as primary key
test_cases table uses test_case_id as primary key
contests table uses contest_id as primary key
contest_problems table uses composite key contest_id and problem_id
submissions table uses submission_id as primary key
test_results table uses result_id as primary key
sessions table uses session_id as primary key
attendance table uses attendance_id as primary key
regrade_requests table uses request_id as primary key
plagiarism_flags table uses flag_id as primary key
raw_student_import table uses raw_row_id as primary key
operation_requests table uses operation_id as primary key

## Candidate Keys
students table candidate keys are student_id roll_number and email
batches table candidate keys are batch_id and batch_code
courses table candidate keys are course_id and course_code
enrollments table candidate key is enrollment_id
problems table candidate key is problem_id
test_cases table candidate key is test_case_id
contests table candidate key is contest_id
submissions table candidate key is submission_id
attendance table candidate key is attendance_id
regrade_requests table candidate key is request_id
plagiarism_flags table candidate key is flag_id

## Alternate Keys
students table uses roll_number and email as alternate keys
batches table uses batch_code as alternate key
courses table uses course_code as alternate key

## Foreign Keys
students.batch_id references batches.batch_id
enrollments.student_id references students.student_idenrollments.course_id references courses.course_id
problems.course_id references courses.course_id
test_cases.problem_id references problems.problem_id
contests.course_id references courses.course_id
contest_problems.contest_id references contests.contest_id
contest_problems.problem_id references problems.problem_id
submissions.student_id references students.student_id
submissions.problem_id references problems.problem_id
submissions.contest_id references contests.contest_id
test_results.submission_id references submissions.submission_id
test_results.test_case_id references test_cases.test_case_id
sessions.course_id references courses.course_id
attendance.session_id references sessions.session_id
attendance.student_id references students.student_id
regrade_requests.submission_id references submissions.submission_id
regrade_requests.student_id references students.student_id
plagiarism_flags.submission_id references submissions.submission_id
plagiarism_flags.matched_submission_id references submissions.submission_id

## Composite Keys
contest_problems table uses contest_id and problem_id as composite key because one contest can contain many problems and one problem can appear in many contests

## NOT NULL Constraints
student_id should not allow NULL values
course_id should not allow NULL values
problem_id should not allow NULL values
submission_id should not allow NULL values
attendance_id should not allow NULL values
contest_id should not allow NULL values
session_id should not allow NULL values

## UNIQUE Constraints
students.email should be unique
students.roll_number should be unique
batches.batch_code should be unique
courses.course_code should be unique

## CHECK Constraints
credit_hours should be greater than 0
max_score should be greater than or equal to 0
similarity_percent should be between 0 and 100
attendance_status should contain only present absent or late
contest_status should contain only scheduled published completed or done
enrollment_status should contain only active completed dropped or inactive
score should be greater than or equal to 0