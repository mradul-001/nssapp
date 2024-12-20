// imports here
const app = require("./app");
const db = require("./config/db");
const userModel = require("./models/user.model");

// some static variables
const port = 3000;

app.listen(port, () => {
  console.log(`App is running on port ${port}`);
});
