import 'package:flutter/material.dart';
import 'package:nssapp/widgets/app_drawer.dart';
import 'package:nssapp/widgets/title_with_box.dart';
import 'package:nssapp/widgets/square_box.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      drawer: const AppDrawer(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 10, 20, 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First three
            TitleWithBox(
              title: "Mark your attendance",
              imagePath: "assets/attendance.png",
              onImageOrArrowPressed: () {},
            ),
            const SizedBox(height: 24),
            TitleWithBox(
              title: "Get your Certificate",
              imagePath: "assets/certificate.png",
              onImageOrArrowPressed: () {},
            ),
            const SizedBox(height: 24),
            TitleWithBox(
              title: "Upcoming Events",
              imagePath: "assets/events.png",
              onImageOrArrowPressed: () {},
            ),
            const SizedBox(height: 24),

            // Bottom 2 rows
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Feedback",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00124C),
                        ),
                      ),
                      const SizedBox(height: 8),
                      SquareBox(
                        imagePath: "assets/feedback.png",
                        onImageOrArrowPressed: () {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Miscellaneous",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00124C),
                        ),
                      ),
                      const SizedBox(height: 8),
                      SquareBox(
                        imagePath: "assets/misc.png",
                        onImageOrArrowPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
