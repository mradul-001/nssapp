const userRouter = require("./routes/user.routes");
const bodyParser = require("body-parser");
const express = require("express");
const cors = require("cors");
const path = require("path");
const fs = require("fs");

const app = express();

// setting the view engine
app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views"));

// setting path for static assets
app.use(express.static(path.join(__dirname, "public")));

// middlewares
app.use(express.json());
app.use(cors());

app.use("/", userRouter);

module.exports = app;
