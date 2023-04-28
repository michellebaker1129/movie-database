const express = require('express');
// Import and require mysql2
const mysql = require('mysql2');

const PORT = process.env.PORT || 3001;
const app = express();

// Express middleware
app.use(express.urlencoded({ extended: false }));
app.use(express.json());

// Connect to database
const db = mysql.createConnection(
  {
    host: 'localhost',
    // MySQL username,
    user: 'root',
    // MySQL password
    password: 'password',
    database: 'movies_db'
  },
  console.log(`Connect to our movies_db.`)
);

// db.query(`DELETE FROM course_names WHERE id = ?`, num, (err, result) => {
//   if (err) {
//     console.log(err);
//   }
//   console.log("affectedRows: ", result.affectedRows);

// });

// Query database
app.get('/api/movies', (req, res) => {
    db.query('SELECT * FROM movies', function (err, results) {
        return res.json(result);
      });
}
);

// Query database
app.get('/api/movies/:movie_id', (req, res) => {
    db.query(`SELECT * FROM movies WHERE movie_id = ${req.params.movie_id}`, function (err, results) {
        return res.json(result);
      });
}
);

// Default response for any other request (Not Found)
// app.use((req, res) => {
//   res.status(404).end();
// });
app.get('/', (req, res) => {
  res.send('Hello World');
});


app.listen(PORT, () => {
  console.log(`Example app listening at http://localhost:${PORT}`);
});
