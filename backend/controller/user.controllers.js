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
    const isPasswordCorrect = await user.comparePassword(password);

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

      // send the response to the flutter app
      res.status(200).json({
        status: true,
        token: tokenData,
        message: "Login successful",
      });
    }
  }
}

async function addEvent(req, res) {
  const jsonFilePath = "../assets/info.json";
  const newEvent = req.body;

  fs.readFile(jsonFilePath, "utf8", (err, data) => {
    if (err) {
      console.error("Error reading file:", err);
      return res.status(500).send("Internal Server Error");
    }

    let events = [];

    try {
      events = JSON.parse(data);
    } catch (parseErr) {
      console.error("Error parsing JSON:", parseErr);
    }

    events.push(newEvent);

    fs.writeFile(jsonFilePath, JSON.stringify(events, null, 2), (writeErr) => {
      if (writeErr) {
        console.error("Error writing file:", writeErr);
        return res.status(500).send("Internal Server Error");
      }

      res.status(200).send("Event added successfully");
    });
  });
}

module.exports = { register, login, addEvent };
