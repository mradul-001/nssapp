const mongoose = require("mongoose");
const db = require("../config/db");

// structure for a user

const userSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
  },
  rollNo: {
    type: String,
    required: true,
    unique: true,
    lowercase: true,
  },
  phone: {
    type: String,
    required: true,
  },
  department: {
    type: String,
    required: true,
  },
  email: {
    type: String,
    required: true,
    // unique: true,
    lowercase: true,
  },
  password: {
    type: String,
    required: true,
  },
});

userSchema.methods.comparePassword = async function (userPassword) {
  try {
    return userPassword == this.password;
  } catch (error) {}
};

const userModel = db.model("user", userSchema);

module.exports = userModel;
