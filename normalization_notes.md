# Normalization Notes
## Redundant Data Examples
Student details such as student_id appear repeatedly in enrollments submissions attendance and regrade_requests tables
Course information such as course_id is repeatedly stored in problems contests sessions and enrollments tables
Problem information is repeatedly referenced in submissions test_cases and contest_problems tables
Contest information is repeatedly used in submissions and contest_problems tables
Submission ids are repeatedly used in plagiarism_flags test_results and regrade_requests tables

## Examples Where Separate Tables Improve Design
Keeping students and batches in separate tables avoids repeating batch details for every student
Keeping problems and test_cases in separate tables allows multiple test cases for one problem without duplicating problem details
Using contest_problems as a mapping table supports many to many relationships between contests and problems
Using attendance as a separate table avoids storing attendance data inside sessions table
Using test_results as a separate table prevents storing multiple result values inside submissions table

## Functional Dependencies
student_id determines full_name email batch_id admission_date and graduation_year
course_id determines course_code course_title course_status and credit_hours
problem_id determines problem_title difficulty max_score and created_at
contest_id determines contest_title start_time end_time and contest_statussubmission_id determines language submitted_at status score and runtime_ms
session_id determines session_title session_date and session_type

## Partial Dependency Examples
In contest_problems table problem_order depends on both contest_id and problem_id together
In enrollments table final_grade depends on the enrollment between student and course
In attendance table attendance_status depends on both student_id and session_id

## 1NF First Normal Form
All tables store atomic values
There are no repeating groups or multiple values inside a single column
Each table has a primary key

## 2NF Second Normal Form
Partial dependencies are removed by separating mapping tables like contest_problems and enrollments
Non key attributes fully depend on the entire primary key
Repeated course and student information is separated into individual tables

## 3NF Third Normal Form
Transitive dependencies are minimized
Batch information is stored separately from students
Course details are separated from problems contests and sessions
Submission results are separated into test_results table instead of storing everything in submissions

## Trade Offs In Design
Some status columns are repeated across tables for easier filtering and reporting
Keeping raw_student_import table separately helps preserve original imported data before cleaning
Some duplicated ids are retained for faster joins and query performance
Separate mapping tables increase normalization but also increase join complexity

## Final Normalization Level
The final database design is approximately in Third Normal Form 3NF because redundancy is reduced and most non key attributes depend only on primary keys