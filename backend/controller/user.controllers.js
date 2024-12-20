const userModel = require("../models/user.model");
const userServices = require("../services/user.services");

// this function takes the request body, and send the object to the registerUser function in services
async function register(req, res, next) {
  try {
    const { name, rollNo, phone, department, email, password } = req.body;
    const successResponse = userServices.registerUser(
      name,
      rollNo,
      phone,
      department,
      email,
      password
    );
    res.json({
      status: true,
      message: "User registered successfully",
    });
  } catch (error) {
    throw error;
  }
}

async function login(req, res, next) {
  const { rollNo, password } = req.body;
  const user = await userServices.checkUser(rollNo);

  if (!user) {
    throw new Error("User does not exist!");
  } else {
    const isPasswordCorrect = await userModel.comparePassword(password);

    if (isPasswordCorrect === false) {
      throw new Error("Password incorrect!");
    } else {
      const tokenData = {
        _id: user._id,
        rollNo: user.rollNo,
        name: user.name,
        phone: user.phone,
        email: user.email,
        department: user.department,
      };
      const token = await userServices.generateToken(
        tokenData,
        "someSecretKey",
        "1h"
      );
      // send the response to the flutter app
      res.status(200).json({
        status: true,
        token: token,
        message: "Login successful",
      });
    }
  }
}

module.exports = { register, login };
