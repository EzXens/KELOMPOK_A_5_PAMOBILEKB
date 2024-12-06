import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _usernameController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final List<String> _profilePictures = [
    'assets/avatar1.png',
    'assets/avatar2.png',
    'assets/avatar3.png',
    'assets/avatar4.png',
  ];
  String? _selectedProfilePicture;
  bool _isLoading = false;

  Future<void> _updateProfile() async {
    if (_usernameController.text.trim().isEmpty && _selectedProfilePicture == null) {
      _showErrorDialog("Please provide a new username or select a profile picture.");
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final user = _auth.currentUser;

      if (user == null) {
        throw Exception("User not found. Please re-login.");
      }

      if (_usernameController.text.trim().isNotEmpty) {
        await _firestore.collection('users').doc(user.uid).update({
          'username': _usernameController.text.trim(),
        });
        await user.updateDisplayName(_usernameController.text.trim());
      }


      if (_selectedProfilePicture != null) {
        await _firestore.collection('users').doc(user.uid).update({
          'profile_picture': _selectedProfilePicture,
        });
        await user.updatePhotoURL(_selectedProfilePicture);
      }

      Navigator.pop(context); 
    } catch (e) {
      _showErrorDialog("Failed to update profile: $e");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Close"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        backgroundColor: const Color(0xFF107115),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Select Profile Picture:',
                    style: TextStyle(fontSize: 16, color: Color(0xFF107115)),
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: _profilePictures.map((picture) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedProfilePicture = picture;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: _selectedProfilePicture == picture
                                    ? Colors.green
                                    : Colors.transparent,
                                width: 3,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: CircleAvatar(
                              backgroundImage: AssetImage(picture),
                              radius: 40,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: "New Username",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _updateProfile,
                    child: Text("Save Changes"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF107115),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
