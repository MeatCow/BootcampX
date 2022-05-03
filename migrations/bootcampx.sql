DROP TABLE IF EXISTS students CASCADE;

DROP TABLE IF EXISTS cohorts CASCADE;

DROP TABLE IF EXISTS assignments CASCADE;

DROP TABLE IF EXISTS assignment_submissions CASCADE;

DROP TABLE IF EXISTS teachers CASCADE;

DROP TABLE IF EXISTS assistance_requests CASCADE;

CREATE TABLE cohorts(
  id SERIAL PRIMARY KEY,
  name VARCHAR(250) NOT NULL,
  start_date DATE,
  end_date DATE
);

CREATE TABLE students(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255),
  phone VARCHAR(50),
  github VARCHAR(255),
  start_date DATE,
  end_date DATE,
  cohort_id INT REFERENCES cohorts(id) ON DELETE CASCADE
);

CREATE TABLE assignments(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  content TEXT,
  "day" INT,
  chapter SMALLINT,
  duration INT
);

CREATE TABLE assignment_submissions(
  id SERIAL PRIMARY KEY,
  assignment_id INT REFERENCES assignments(id) ON DELETE CASCADE,
  student_id INT REFERENCES students(id) ON DELETE CASCADE,
  duration INT,
  submission_date DATE
);

CREATE TABLE teachers(
  id serial PRIMARY KEY,
  name varchar(255) NOT NULL,
  is_active boolean DEFAULT TRUE,
  start_date date,
  end_date date
);

CREATE TABLE assistance_requests(
  id serial PRIMARY KEY,
  assignment_id INT REFERENCES assignments(id) ON DELETE CASCADE,
  student_id INT REFERENCES students(id) ON DELETE CASCADE,
  teacher_id INT REFERENCES teachers(id) ON DELETE CASCADE,
  created_at TIMESTAMP,
  started_at TIMESTAMP,
  completed_at TIMESTAMP,
  student_feedback TEXT,
  teacher_feedback TEXT
);