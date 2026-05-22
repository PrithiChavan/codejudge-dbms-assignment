CREATE TABLE batches (
    batch_id VARCHAR(10) PRIMARY KEY,
    batch_code VARCHAR(20) UNIQUE NOT NULL,
    program VARCHAR(50) NOT NULL,
    start_date DATE,
    end_date DATE,
    batch_status VARCHAR(20) CHECK (batch_status IN ('active','completed'))
);

CREATE TABLE students (
    student_id VARCHAR(10) PRIMARY KEY,
    roll_number VARCHAR(20) UNIQUE NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    batch_id VARCHAR(10),
    admission_date DATE,
    enrollment_status VARCHAR(20),
    graduation_year INT,
    FOREIGN KEY (batch_id) REFERENCES batches(batch_id)
);

CREATE TABLE courses (
    course_id VARCHAR(10) PRIMARY KEY,
    course_code VARCHAR(20) UNIQUE NOT NULL,
    course_title VARCHAR(100) NOT NULL,
    course_status VARCHAR(20),
    credit_hours INT CHECK (credit_hours > 0)
);

CREATE TABLE enrollments (
    enrollment_id VARCHAR(15) PRIMARY KEY,
    student_id VARCHAR(10),
    course_id VARCHAR(10),
    enrolled_on DATE,
    enrollment_status VARCHAR(20),
    final_grade CHAR(2),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE problems (
    problem_id VARCHAR(10) PRIMARY KEY,
    course_id VARCHAR(10),
    problem_code VARCHAR(30),
    title VARCHAR(200),
    difficulty VARCHAR(20),
    max_score INT,
    created_at TIMESTAMP,
    is_active BOOLEAN,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE test_cases (
    test_case_id VARCHAR(15) PRIMARY KEY,
    problem_id VARCHAR(10),
    case_no INT,
    input_label VARCHAR(100),
    expected_output VARCHAR(100),
    points INT,
    is_hidden BOOLEAN,
    FOREIGN KEY (problem_id) REFERENCES problems(problem_id)
);

CREATE TABLE contests (
    contest_id VARCHAR(10) PRIMARY KEY,
    course_id VARCHAR(10),
    contest_title VARCHAR(100),
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    contest_status VARCHAR(20),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE contest_problems (
    contest_id VARCHAR(10),
    problem_id VARCHAR(10),
    problem_order INT,
    PRIMARY KEY (contest_id, problem_id),
    FOREIGN KEY (contest_id) REFERENCES contests(contest_id),
    FOREIGN KEY (problem_id) REFERENCES problems(problem_id)
);

CREATE TABLE submissions (
    submission_id VARCHAR(15) PRIMARY KEY,
    student_id VARCHAR(10),
    problem_id VARCHAR(10),
    contest_id VARCHAR(10),
    language VARCHAR(20),
    submitted_at TIMESTAMP,
    status VARCHAR(30),
    score INT,
    runtime_ms INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (problem_id) REFERENCES problems(problem_id),
    FOREIGN KEY (contest_id) REFERENCES contests(contest_id)
);

CREATE TABLE test_results (
    result_id VARCHAR(15) PRIMARY KEY,
    submission_id VARCHAR(15),
    test_case_id VARCHAR(15),
    result_status VARCHAR(30),
    runtime_ms INT,
    memory_kb INT,
    awarded_points INT,
    FOREIGN KEY (submission_id) REFERENCES submissions(submission_id),
    FOREIGN KEY (test_case_id) REFERENCES test_cases(test_case_id)
);

CREATE TABLE sessions (
    session_id VARCHAR(10) PRIMARY KEY,
    course_id VARCHAR(10),
    session_title VARCHAR(100),
    session_date DATE,
    session_type VARCHAR(20),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE attendance (
    attendance_id VARCHAR(15) PRIMARY KEY,
    session_id VARCHAR(10),
    student_id VARCHAR(10),
    attendance_status VARCHAR(20),
    marked_at TIMESTAMP,
    FOREIGN KEY (session_id) REFERENCES sessions(session_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

CREATE TABLE regrade_requests (
    request_id VARCHAR(15) PRIMARY KEY,
    submission_id VARCHAR(15),
    student_id VARCHAR(10),
    requested_at TIMESTAMP,
    reason VARCHAR(255),
    request_status VARCHAR(20),
    resolved_at TIMESTAMP,
    FOREIGN KEY (submission_id) REFERENCES submissions(submission_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

CREATE TABLE plagiarism_flags (
    flag_id VARCHAR(15) PRIMARY KEY,
    submission_id VARCHAR(15),
    matched_submission_id VARCHAR(15),
    similarity_percentage DECIMAL(5,2),
    flag_status VARCHAR(20),
    created_at TIMESTAMP,
    FOREIGN KEY (submission_id) REFERENCES submissions(submission_id),
    FOREIGN KEY (matched_submission_id) REFERENCES submissions(submission_id)
);

CREATE TABLE raw_student_import (
    raw_row_id VARCHAR(15) PRIMARY KEY,
    roll_number VARCHAR(20),
    full_name VARCHAR(100),
    email VARCHAR(100),
    batch_code VARCHAR(20),
    admission_date DATE,
    import_status VARCHAR(20),
    import_notes VARCHAR(255)
);

CREATE TABLE operation_requests (
    operation_id VARCHAR(15) PRIMARY KEY,
    requested_by VARCHAR(100),
    operation_type VARCHAR(20),
    target_table VARCHAR(50),
    target_record_id VARCHAR(20),
    requested_at TIMESTAMP,
    reason VARCHAR(255),
    approval_status VARCHAR(20),
    executed_at TIMESTAMP
);