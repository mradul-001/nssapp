const userServices = require("../services/user.services");

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

module.exports = { register };
