// Used in Home Page

import 'package:flutter/material.dart';

class TitleWithBox extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onImageOrArrowPressed;

  const TitleWithBox({super.key, 
    required this.title,
    required this.imagePath,
    required this.onImageOrArrowPressed,
  });

  @override
  build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF00124C),
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: onImageOrArrowPressed,
          child: Container(
            height: 100,
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
            child: Row(
              children: [
                // Image Section
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    imagePath,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                const Spacer(),
                //arrow icon
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward,
                        color: Color(0xFF00124C)),
                    onPressed: onImageOrArrowPressed,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
