import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 40, 25, 40),
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
              labelText: 'Roll Number',
              labelStyle: const TextStyle(fontSize: 18),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              labelText: 'Password',
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
          // const Padding(
          //   padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          //   child: Row(
          //     children: [
          //       CircleAvatar(
          //         radius: 8,
          //         backgroundColor: Color.fromARGB(255, 1, 1, 59),
          //       ),
          //       Padding(
          //         padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          //         child: Text(
          //           "Student",
          //           style: TextStyle(
          //             color: Color.fromARGB(255, 1, 1, 59),
          //             fontFamily: "Nunito",
          //             fontSize: 20,
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
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
    );
  }
}
