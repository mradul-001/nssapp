// Used in Home Page

import 'package:flutter/material.dart';

class SquareBox extends StatelessWidget {
  final String imagePath;
  final VoidCallback onImageOrArrowPressed;

  const SquareBox({super.key, 
    required this.imagePath,
    required this.onImageOrArrowPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onImageOrArrowPressed,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: const Color(0xFFC5C5D0),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Centered Image
            Center(
              child: Image.asset(
                imagePath,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),

            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                icon: const Icon(Icons.arrow_forward, color: Color(0xFF00124C)),
                onPressed: onImageOrArrowPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
