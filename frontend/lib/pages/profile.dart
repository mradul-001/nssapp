import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nssapp/utils/authenticator.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _rollNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchToken();
  }

  String? rollNo;
  String? name;
  String? phone;
  String? email;
  String? dept;

  void fetchToken() async {
    final AuthService authService = AuthService();
    Map<String, dynamic>? token = await authService.getToken();
    if (token != null) {
      setState(() {
        rollNo = token['rollNo'];
        name = token['name'];
        phone = token['phone'];
        email = token['email'];
        dept = token['department'];
      });
    } else {
      print("No token found");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 180,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 1, 1, 59),
                        Color.fromARGB(200, 1, 1, 59)
                      ], // Gradient color
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 20,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context); // go back to previous page
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      )),
                ),
                Positioned(
                  top: 115,
                  left: MediaQuery.of(context).size.width / 2 - 60,
                  child: GestureDetector(
                    onTap: _pickImage,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.grey[300],
                          backgroundImage: _profileImage != null
                              ? FileImage(_profileImage!)
                              : null,
                          child: _profileImage == null
                              ? Icon(
                                  Icons.person,
                                  size: 50,
                                  color: Colors.grey[700],
                                )
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 100),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Name
                      Expanded(
                        child: buildTextField("Name", "$name", _nameController),
                      ),
                      const SizedBox(width: 20),
                      // Roll Np.
                      Expanded(
                        child: buildTextField(
                            "Roll Number", "$rollNo", _rollNumberController),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Email Field
                  buildTextField("Email", "$email", _emailController),
                  const SizedBox(height: 20),
                  // Phone Field
                  buildTextField("Phone", "$phone", _phoneController),
                  const SizedBox(height: 20),
                  // Department Field
                  buildTextField("Department", "$dept", _departmentController),
                  const SizedBox(height: 30),
                  // Save Button
                  //   Center(
                  //     child: ElevatedButton(
                  //       onPressed: () {
                  //         // Placeholder for saving data functionality
                  //         print("Name: ${_nameController.text}");
                  //         print("Roll Number: ${_rollNumberController.text}");
                  //         print("Email: ${_emailController.text}");
                  //         print("Phone: ${_phoneController.text}");
                  //         print("Department: ${_departmentController.text}");
                  //       },
                  //       style: ElevatedButton.styleFrom(
                  //         backgroundColor: const Color.fromARGB(255, 1, 1, 59),
                  //         padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(8),
                  //         ),
                  //       ),
                  //       child: const Text(
                  //         "Save",
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //           fontSize: 18,
                  //           fontWeight: FontWeight.normal,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // function for building text fields
  Widget buildTextField(
      String label, String placeholder, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          readOnly: true,
          controller: controller,
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: const Color(0xFFF1F1F1),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
