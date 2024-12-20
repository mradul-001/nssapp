import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 1, 59),
      body: Column(
        children: [
          const Spacer(flex: 3,),
          Container(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/nsslogo.png',
                    alignment: Alignment.center,
                    height: 200,
                    width: 200,
                  ),
                  Column(
                    children: [
                      const Text(
                        "NSS IITB",
                        style: TextStyle(
                          fontSize: 60,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Transform.translate(
                        offset:
                            const Offset(0, -15), // Negative value to move upwards
                        child: const Text(
                          "National Service Scheme",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "THINK WE NOT ME!",
                    style: TextStyle(
                      color: Color.fromARGB(255, 186, 153, 100),
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Image.asset("assets/images/handimage.png"),
        ],
      ),
    );
  }
}
