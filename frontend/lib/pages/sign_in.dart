import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'SIGN IN',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Nunito',
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 1, 1, 59),
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 30,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(25),
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 242, 242, 242),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'User Name',
                      labelStyle: const TextStyle(fontSize: 18),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Roll Number',
                      labelStyle: const TextStyle(fontSize: 18),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 8,
                          backgroundColor: Color.fromARGB(255, 1, 1, 59),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Text(
                            "Student",
                            style: TextStyle(
                              color: Color.fromARGB(255, 1, 1, 59),
                              fontFamily: "Nunito",
                              fontSize: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 1, 1, 59),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 50,
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Column(
              children: [
                const Text(
                  "OR",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Nunito",
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 1, 1, 59),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  color: const Color.fromARGB(255, 1, 1, 59),
                  padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Facebook button
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.white,
                            ),
                            child: FaIcon(
                              FontAwesomeIcons
                                  .facebook, // Use FontAwesome's Facebook icon
                              color: Colors.blue[900],
                            ),
                          ),

                          const SizedBox(width: 16.0),

                          // Twitter button
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.white,
                            ),
                            child: const FaIcon(
                              FontAwesomeIcons
                                  .twitter, // Use FontAwesome's Twitter icon
                              color: Colors.lightBlue,
                            ),
                          ),

                          const SizedBox(width: 16.0),

                          // Google button
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.white,
                            ),
                            child: const FaIcon(
                              FontAwesomeIcons
                                  .google, // Use FontAwesome's Google icon
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Create a new account",
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 16,
                          color: Colors.white.withOpacity(.9),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
