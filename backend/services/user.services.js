const userModel = require("../models/user.model");

class userServices {
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
}

module.exports = userServices;
