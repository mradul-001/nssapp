const express = require("express");
const bodyParser = require("body-parser");
const fs = require('fs');
const path = require('path');
const userRouter = require("./routes/user.routes");

const app = express();

// setting the view engine
app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views"));

// middlewares
app.use(bodyParser.json());

app.use("/", userRouter);

module.exports = app;
