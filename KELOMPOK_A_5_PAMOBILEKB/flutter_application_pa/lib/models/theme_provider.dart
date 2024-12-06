import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme(bool isOn) {
    _isDarkMode = isOn;
    notifyListeners();
  }

  ThemeData get themeData {
    return _isDarkMode
        ? ThemeData.dark().copyWith(
            snackBarTheme: SnackBarThemeData(
              backgroundColor:
                  Colors.grey[800], // Warna latar belakang saat mode gelap
              contentTextStyle: TextStyle(color: Colors.white), // Warna teks
              actionTextColor: Colors.greenAccent, // Warna teks aksi
            ),
          )
        : ThemeData.light().copyWith(
            snackBarTheme: SnackBarThemeData(
              backgroundColor:
                  Colors.white, // Warna latar belakang saat mode terang
              contentTextStyle: TextStyle(color: Colors.black), // Warna teks
              actionTextColor: Colors.blueAccent, // Warna teks aksi
            ),
          );
  }
}
