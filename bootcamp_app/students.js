const { Pool } = require('pg');

const pool = new Pool({
  user: 'labber',
  password: 'labber',
  host: 'localhost',
  database: 'bootcampx'
});

const args = process.argv.slice(2);
args[0] = '%' + args[0] + '%';

pool.query(`
SELECT students.id, students.name, cohorts.name
FROM students
JOIN cohorts on cohorts.id = students.cohort_id
WHERE cohorts.name like $1
LIMIT $2;
`, args)
  .then(res => {
    console.table(res.rows);
  })
  .catch(err => {
    console.error(`Query error:`, err.stack);
  });