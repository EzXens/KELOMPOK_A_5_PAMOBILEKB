import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io'; // Tambahkan ini untuk menampilkan gambar lokal

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      return Center(child: Text("Silahkan Login Sebagai Pengguna Terlebih dahulu",style: TextStyle(fontWeight: FontWeight.bold),));
    }

    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser.uid)
            .collection('predictions')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("Tidak ada riwayat prediksi"));
          }

          var predictions = snapshot.data!.docs;

          return ListView.separated(
            itemCount: predictions.length,
            itemBuilder: (context, index) {
              var prediction = predictions[index];
              String? imagePath = prediction['imagePath']; // Path gambar

              return ListTile(
                title: Text(prediction['result']),
                subtitle: Text(
                  prediction['timestamp'].toDate().toString(),
                ),
                trailing: imagePath != null
                    ? Image.file(
                        File(imagePath),
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      )
                    : Icon(Icons.image_not_supported, size: 30),
              );
            },
            separatorBuilder: (context, index) => Divider(
              thickness: 1,
              color: Colors.grey[300],
            ),
          );
        },
      ),
    );
  }
}
