import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PredictPage extends StatefulWidget {
  @override
  _PredictPageState createState() => _PredictPageState();
}

class _PredictPageState extends State<PredictPage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _getImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }


  Future<void> _pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

 
  Future<void> _savePredictionToFirestore(String result) async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser.uid)
            .collection('predictions')
            .add({
          'result': result,
          'timestamp': Timestamp.now(),
          'imagePath': _image!.path, 
        });
      }
    } catch (e) {
      print("Error saving prediction: $e");
    }
  }

  Future<void> _sendImageToFlask() async {
    if (_image == null) {
    
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Silahkan masukkan gambar terlebih dahulu'),
          action: SnackBarAction(
            label: 'OK',
            onPressed:
                () {},
          ),
        ),
      );
      return;
    }

    // Tampilkan dialog loading 
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Theme.of(context).dialogBackgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  strokeWidth: 10.5, 
                ),
                SizedBox(height: 16),
                Text(
                  'Memproses...',
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        );
      },
    );

    try {
      var uri = Uri.parse(
          'https://classify.roboflow.com/rice-plant-leaf-disease-classification/1?api_key=5gOJ8v7HoEPKM73z4sIk'); // URL
      var request = http.MultipartRequest('POST', uri);
      var pic = await http.MultipartFile.fromPath('file', _image!.path);
      request.files.add(pic);

      var response = await request.send();

      Navigator.of(context).pop(); 

      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseData);

        String formattedResult = _formatPredictionResult(jsonResponse);

   
        await _savePredictionToFirestore(formattedResult);

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Hasil Prediksi'),
              content: Text(formattedResult),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else {
        print('Failed to predict');
      }
    } catch (e) {
      Navigator.of(context).pop(); 
      print('Error: $e');
    }
  }


  String _formatPredictionResult(Map<String, dynamic> jsonResponse) {
    if (jsonResponse['predictions'] != null &&
        jsonResponse['predictions'].isNotEmpty) {
      var topPrediction = jsonResponse['predictions'][0];
      String topClass = topPrediction['class'];
      double confidence = topPrediction['confidence'] * 100;

      return 'Prediksi Terbaik: $topClass\nConfidence: ${confidence.toStringAsFixed(2)}%';
    } else {
      return 'Tidak ada prediksi tersedia.';
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.grey[300],
                width: screenWidth * 0.9,
                height: screenWidth * 0.7,
                child: _image == null
                    ? Center(
                        child: Text(
                        'Tidak ada gambar yang dipilih',
                        style: TextStyle(color: Colors.black),
                      ))
                    : Image.file(
                        _image!,
                        fit: BoxFit.cover,
                      ),
              ),
              SizedBox(height: 100),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 10.0,
                runSpacing: 8.0,
                children: [
                  _buildButton(
                    icon: Icons.camera_alt,
                    label: 'Ambil Gambar',
                    onPressed: _getImageFromCamera,
                  ),
                  _buildButton(
                    icon: Icons.photo_library,
                    label: 'Pilih Gambar',
                    onPressed: _pickImageFromGallery,
                  ),
                  SizedBox(height: 70),
                  _buildButton(
                    icon: Icons.health_and_safety,
                    label: 'Prediksi Penyakit',
                    onPressed: _sendImageToFlask,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF107115),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
      ),
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white),
      label: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
