const router = require("express").Router();
const userController = require("../controller/user.controllers");

router.post("/registration", userController.register);
router.post("/login", userController.login);
router.post("/addEvents", userController.addEvent);
router.get("/addEvents", (req, res) => {
  res.render("addEvent");
});

module.exports = router;
