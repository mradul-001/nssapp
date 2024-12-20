const mongoose = require("mongoose");

const connection = mongoose
  .createConnection("mongodb://localhost:27017/nssapp")
  .on("open", () => {
    console.log("Connected to database");
  })
  .on("error", () => {
    console.log("Connection to database failed!");
  });

module.exports = connection;
