const express = require("express");
// Import and require mysql2
const mysql = require("mysql2");

const PORT = process.env.PORT || 3001;
const app = express();

// Express middleware
app.use(express.urlencoded({ extended: false }));
app.use(express.json());

// Connect to database
const db = mysql.createConnection(
  {
    host: "localhost",
    // MySQL username,
    user: "root",
    // MySQL password
    password: "password",
    database: "movies_db",
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
app.get("/api/movies", (req, res) => {
  db.query("SELECT * FROM movies", function (err, results) {
    return res.json(results);
  });
});

app.get("/api/movie-reviews", (req, res) => {
    db.query("SELECT * FROM movies JOIN reviews ON movies.id = reviews.movie_id", function (err, results) {
      return res.json(results);
    });
  });

// Query database
app.delete("/api/movies/:movie_id", (req, res) => {
  console.log(req.params.movie_id);
  db.query(
    "DELETE FROM movies WHERE id = ?", (req.params.movie_id),
    function (err, results) {
        console.log(`Movie ${req.params.movie_id} has been removed`);
        return res.json(`Movie ${req.params.movie_id} has been removed`);
    }
  );
});

app.put('/api/review/:id', (req, res) => {
    const sql = `UPDATE reviews SET review = ? WHERE id = ?`;
    const params = [req.body.review, req.params.id];
  
    db.query(sql, params, (err, result) => {
      if (err) {
        res.status(400).json({ error: err.message });
      } else if (!result.affectedRows) {
        res.json({
          message: 'Movie not found'
        });
      } else {
        res.json({
          message: 'success',
          data: req.body,
          changes: result.affectedRows
        });
      }
    });
  });

app.post("/api/add-movie", (req, res) => {
    const {movie_name} = req.body;
    db.query(
        "INSERT INTO movies (movie_name) VALUES (?)", [movie_name],
        function (err, results) {
            return res.json("Movie added to db");
        });
});

// Default response for any other request (Not Found)
// app.use((req, res) => {
//   res.status(404).end();
// });
app.get("/", (req, res) => {
  res.send("Hello World");
});

app.listen(PORT, () => {
  console.log(`Example app listening at http://localhost:${PORT}`);
});
