DROP TABLE IF EXISTS students;

DROP TABLE IF EXISTS cohorts;

DROP TABLE IF EXISTS assignments;

DROP TABLE IF EXISTS assignments_submissions;

DROP TABLE IF EXISTS teachers;

DROP TABLE IF EXISTS assistance_requests;

CREATE TABLE cohorts(
  id SERIAL PRIMARY KEY,
  name VARCHAR(250) NOT NULL,
  start_date DATE,
  end_date DATE
);

CREATE TABLE students(
  id serial PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255),
  phone VARCHAR(50),
  github VARCHAR(255),
  start_date DATE,
  end_date DATE,
  cohort_id INT REFERENCES cohorts(id) ON DELETE CASCADE
);