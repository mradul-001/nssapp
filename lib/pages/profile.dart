// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';


// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   File? _profileImage;
//   final ImagePicker _picker = ImagePicker();

//   // Controllers for the form fields
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _rollNumberController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _departmentController = TextEditingController();

//   Future<void> _pickImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _profileImage = File(pickedFile.path);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Header Section
//             Stack(
//               children: [
//                 Container(
//                   height: 180,
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [
//                         Color(0xFF3B3F97),
//                         Color(0xFF6367DA)
//                       ], // Gradient color
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: 50,
//                   left: 20,
//                   child: GestureDetector(
//                     onTap: () {},
//                     child: Container(
//                       padding: EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.white.withOpacity(0.2), // transparent
//                       ),
//                       child: Icon(
//                         Icons.arrow_back,
//                         color: Colors.white,
//                         size: 28,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: 130,
//                   left: MediaQuery.of(context).size.width / 2 - 50,
//                   child: GestureDetector(
//                     onTap: _pickImage,
//                     child: Column(
//                       children: [
//                         CircleAvatar(
//                           radius: 50,
//                           backgroundColor: Colors.grey[300],
//                           backgroundImage: _profileImage != null
//                               ? FileImage(_profileImage!)
//                               : null,
//                           child: _profileImage == null
//                               ? Icon(
//                                   Icons.person,
//                                   size: 50,
//                                   color: Colors.grey[700],
//                                 )
//                               : null,
//                         ),
//                         SizedBox(height: 10),
//                         Text(
//                           "Change Photo",
//                           style: TextStyle(
//                             color: Colors.black87,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             decoration: TextDecoration.underline,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 70),

//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       // Name
//                       Expanded(
//                         child: buildTextField("Name", "Name", _nameController),
//                       ),
//                       SizedBox(width: 20),
//                       // Roll Np.
//                       Expanded(
//                         child: buildTextField("Roll Number", "Roll Number",
//                             _rollNumberController),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   // Email Field
//                   buildTextField("Email", "Email", _emailController),
//                   SizedBox(height: 20),
//                   // Phone Field
//                   buildTextField("Phone", "Phone", _phoneController),
//                   SizedBox(height: 20),
//                   // Department Field
//                   buildTextField(
//                       "Department Name", "Department", _departmentController),
//                   SizedBox(height: 30),
//                   // Save Button
//                   Center(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         // Placeholder for saving data functionality
//                         print("Name: ${_nameController.text}");
//                         print("Roll Number: ${_rollNumberController.text}");
//                         print("Email: ${_emailController.text}");
//                         print("Phone: ${_phoneController.text}");
//                         print("Department: ${_departmentController.text}");
//                       },
//                       child: Text(
//                         "Save",
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Color(0xFF3B3F97),
//                         minimumSize: Size(double.infinity, 50),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // function for building text fields
//   Widget buildTextField(
//       String label, String placeholder, TextEditingController controller) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//             color: Colors.black87,
//             fontSize: 14,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         SizedBox(height: 5),
//         TextField(
//           controller: controller,
//           decoration: InputDecoration(
//             hintText: placeholder,
//             hintStyle: TextStyle(color: Colors.grey),
//             filled: true,
//             fillColor: Color(0xFFF1F1F1),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide.none,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
