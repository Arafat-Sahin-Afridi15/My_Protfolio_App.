import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController bioController;
  late File? _image;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    bioController = TextEditingController();

    // Load user data from local storage
    loadUserData();
  }

  Future<void> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nameController.text = prefs.getString('name') ?? '';
      emailController.text = prefs.getString('email') ?? '';
      bioController.text = prefs.getString('bio') ?? '';
    });
  }

  Future<void> saveUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', nameController.text);
    prefs.setString('email', emailController.text);
    prefs.setString('bio', bioController.text);
  }

  Future<void> _getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void _showUpdateInfoDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Update Information'),
          content: Column(
            children: [
              _buildRoundedTextField(nameController, 'Name'),
              _buildRoundedTextField(emailController, 'Email'),
              _buildRoundedTextField(bioController, 'Bio', maxLines: 3),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Save user data and update the UI
                saveUserData();
                setState(() {});
                Navigator.pop(context);
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                _getImage();
              },
              child: CircleAvatar(
                radius: 80,

              ),
            ),
            SizedBox(height: 16),
            // Enhanced text fields with rounded corners
            _buildRoundedTextField(nameController, 'Name'),
            SizedBox(height: 8),
            _buildRoundedTextField(emailController, 'Email'),
            SizedBox(height: 16),
            _buildRoundedTextField(bioController, 'Bio', maxLines: 3),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Save user data and update the UI
                saveUserData();
                setState(() {});
              },
              child: Text("Save"),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Show update information dialog
                _showUpdateInfoDialog();
              },
              child: Text("Update Information"),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build rounded text fields
  Widget _buildRoundedTextField(
      TextEditingController controller, String labelText,
      {int maxLines = 1}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }
}
