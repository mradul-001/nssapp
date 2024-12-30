const userModel = require("../models/user.model");
const jwt = require("jsonwebtoken");

class userServices {
  // function to register user - send the user data to the database
  static async registerUser(name, rollNo, phone, department, email, password) {
    try {
      // create a user
      const createUser = new userModel({
        name: name,
        rollNo: rollNo,
        phone: phone,
        department: department,
        email: email,
        password: password,
      });
      // save the user
      return await createUser.save();
    } catch (error) {
      throw error;
    }
  }

  // function to check whether a user exist given a username
  static async checkUser(rollNo) {
    try {
      return await userModel.findOne({
        rollNo: rollNo,
      });
    } catch (error) {
      throw error;
    }
  }

  // login functionality
  static async generateToken(
    tokenData,
    secretKey,
    jwtExpiry /* the time till when the login is valid*/
  ) 
  {
    jwt.sign(tokenData, secretKey, { expiresIn: jwtExpiry });
  }
}

module.exports = userServices;
