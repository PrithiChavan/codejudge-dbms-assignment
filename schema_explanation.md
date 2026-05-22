# CodeJudge Database Schema Explanation
## students.csv
This table stores information about students in the CodeJudge platform.
Important columns:
student_id uniquely identifies each student
roll_number stores the unique academic roll number
full_name stores the student full name
email stores the student email address
batch_id identifies the batch assigned to the student
admission_date stores the admission date
enrollment_status stores whether the student is active inactive dropped or graduated
graduation_year stores the expected graduation year

Relationships:
batch_id connects students table with batches table

Possible issues:
duplicate emails
missing admission dates
invalid enrollment status values

## batches.csv
This table stores information about student batches.
Important columns:
batch_id uniquely identifies each batch
batch_code stores batch code
program stores the program name
start_date stores batch starting date
end_date stores batch ending date
batch_status stores batch status

Relationships:
batch_id connects with students table

Possible issues:
duplicate batch codes
missing dates
invalid batch status values

## courses.csv
This table stores information about available courses.
Important columns:
course_id uniquely identifies each course
course_code stores course code
course_title stores course title
course_status stores course availability status
credit_hours stores course credits

Relationships:
course_id connects with enrollments problems contests and sessions tables

Possible issues:
duplicate course codes
negative credit hours
invalid course statuses

## enrollments.csv
This table stores which students enrolled in which courses.
Important columns:
enrollment_id uniquely identifies enrollment
student_id identifies the student
course_id identifies the course
enrolled_on stores enrollment date
enrollment_status stores enrollment state
final_grade stores final course grade

Relationships:
student_id connects with students table
course_id connects with courses table

Possible issues:
duplicate enrollments
invalid grades
missing course ids

## problems.csv
This table stores coding problems.
Important columns:
problem_id uniquely identifies each problem
course_id identifies related course
problem_title stores problem title
difficulty stores difficulty level
max_score stores maximum score
created_at stores creation timestamp
is_active stores whether problem is active

Relationships:
course_id connects with courses table

Possible issues:
invalid difficulty values
inactive problems mapped to contests
negative scores

## test_cases.csv
This table stores test cases for coding problems.
Important columns:
test_case_id uniquely identifies test case
problem_id identifies related problem
case_no stores test case number
input_label stores test input
expected_output stores expected output
points stores marks assigned
is_hidden stores whether case is hidden

Relationships:
problem_id connects with problems table

Possible issues:
duplicate case numbers
missing expected output
invalid points values

## contests.csv
This table stores coding contest information.
Important columns:
contest_id uniquely identifies contest
course_id identifies associated course
contest_title stores contest title
start_time stores contest start time
end_time stores contest end time
contest_status stores contest state

Relationships:
course_id connects with courses table

Possible issues:
invalid contest status
end time earlier than start time
invalid course references

## contest_problems.csv
This table maps problems to contests.
Important columns:
contest_id identifies contest
problem_id identifies problem
problem_order stores sequence of problem in contest

Relationships:
contest_id connects with contests table
problem_id connects with problems table

Possible issues:
duplicate mappings
duplicate problem order values

## submissions.csv
This table stores student code submissions.
Important columns:
submission_id uniquely identifies submission
student_id identifies student
problem_id identifies problem
contest_id identifies contest
language stores programming language used
submitted_at stores submission timestamp
status stores submission result
score stores marks obtained
runtime_ms stores execution runtime

Relationships:
student_id connects with students table
problem_id connects with problems table
contest_id connects with contests table

Possible issues:
invalid programming languages
negative scores
missing submission timestamps

## test_results.csv
This table stores execution results for test cases.
Important columns:
result_id uniquely identifies result
submission_id identifies submission
test_case_id identifies test case
result_status stores execution result
runtime_ms stores runtime
memory_kb stores memory usage
awarded_points stores marks awarded

Relationships:
submission_id connects with submissions table
test_case_id connects with test_cases table

Possible issues:
negative runtime values
invalid result status
awarded points greater than test case points

## sessions.csv
This table stores academic sessions for courses.
Important columns:
session_id uniquely identifies session
course_id identifies course
session_title stores session title
session_date stores session date
session_type stores session type

Relationships:
course_id connects with courses table
Possible issues:
invalid session types
missing session dates

## attendance.csv
This table stores student attendance records.
Important columns:
attendance_id uniquely identifies attendance record
session_id identifies session
student_id identifies student
attendance_status stores attendance state
marked_at stores attendance timestamp

Relationships:
session_id connects with sessions table
student_id connects with students table

Possible issues:
duplicate attendance entries
invalid attendance status
missing timestamps

## regrade_requests.csv
This table stores requests for submission rechecking.
Important columns:
request_id uniquely identifies request
submission_id identifies submission
student_id identifies student
requested_at stores request time
reason stores regrade reason
request_status stores approval status
resolved_at stores resolution time

Relationships:
submission_id connects with submissions table
student_id connects with students table

Possible issues:
duplicate requests
invalid request statuses
missing reasons

## plagiarism_flags.csv
This table stores plagiarism detection records.
Important columns:
flag_id uniquely identifies plagiarism flag
submission_id identifies original submission
matched_submission_id identifies matched submission
similarity_percent stores similarity percentage
flag_status stores plagiarism review state
created_at stores creation timestamp

Relationships:
submission_id connects with submissions table
matched_submission_id connects with submissions table

Possible issues:
similarity percentage above 100
duplicate plagiarism records
invalid statuses

## raw_student_import.csv
This table stores raw imported student records before validation.
Important columns:
raw_row_id uniquely identifies raw row
roll_number stores imported roll number
full_name stores imported student name
email stores imported email
batch_code stores imported batch code
admission_date stores imported date
import_status stores validation status
import_notes stores validation notes

Relationships:
batch_code connects with batches table

Possible issues:
invalid emails
duplicate roll numbers
invalid batch codes

## operation_requests.csv
This table stores administrative database operation requests.
Important columns:
operation_id uniquely identifies operation request
requested_by stores requester email
operation_type stores operation type
target_table stores affected table
target_record_id stores affected record
requested_at stores request timestamp
reason stores operation reason
approval_status stores approval state
executed_at stores execution time

Relationships:
target_record_id may connect with multiple tables depending on operation

Possible issues:
invalid operation types
missing approval status
operations executed without approval