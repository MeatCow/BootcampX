const { Pool } = require("pg");

const pool = new Pool({
  user: 'labber',
  password: 'labber',
  host: 'localhost',
  database: 'bootcampx'
});

pool.query(`
SELECT DISTINCT teachers.name as teacher,
  cohorts.name as cohort
FROM assistance_requests
  JOIN teachers ON teachers.id = teacher_id
  JOIN students ON students.id = student_id
  JOIN cohorts ON cohorts.id = students.cohort_id
WHERE cohorts.name = $1
ORDER BY teachers.name;
`, process.argv.slice(2))
  .then(res => {
    res.rows.forEach(line => {
      console.log(`${line.cohort}: ${line.teacher}`);
    });
  })
  .catch(err => {
    console.error(`Query error:`, err.stack);
  });