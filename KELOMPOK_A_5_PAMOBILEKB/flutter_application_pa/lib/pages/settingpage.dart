import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_pa/models/theme_provider.dart';

class MySettingPage extends StatefulWidget {
  const MySettingPage({super.key});

  @override
  State<MySettingPage> createState() => _MySettingPageState();
}

class _MySettingPageState extends State<MySettingPage> {
  bool incognitoOn = false;

  bool showPopup = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.dark_mode, color: Color(0xFF107115)),
                title: const Text('Dark Mode'),
                subtitle:
                    const Text('Mengaktifkan dark mode dengan tema kegelapan'),
                trailing: Switch(
                  value: themeProvider.isDarkMode,
                  activeColor: const Color(0xFF107115),
                  onChanged: (bool value) {
                    themeProvider.toggleTheme(value);
                  },
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.info, color: Color(0xFF107115)),
                title: const Text('About Us'),
                subtitle: const Text('Tentang Kami'),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () {
                    setState(() {
                      showPopup = true;
                    });
                  },
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 150),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 150,
                      width: 150, 
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            12.0), 
                        image: DecorationImage(
                          image: AssetImage('assets/setting_logo.jpg'),
                          fit:
                              BoxFit.cover, 
                        ),
                        border: Border.all(
                          color: Colors.green, 
                          width: 2.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Versi Aplikasi: 1.4.3',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Dibuat oleh Tim Kelompok 5 (Noobieman)',
                      style: TextStyle(fontSize: 14 , fontWeight: FontWeight.bold ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (showPopup)
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).dialogBackgroundColor,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'About Us',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            setState(() {
                              showPopup = false;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          'Kami adalah tim yang berkomitmen untuk membantu petani meningkatkan hasil pertanian dengan memanfaatkan teknologi kecerdasan buatan (AI). Aplikasi kami, yang menggunakan model Convolutional Neural Network (CNN) untuk deteksi penyakit padi, memungkinkan petani mengidentifikasi penyakit pada daun padi hanya dengan mengunggah gambar melalui ponsel. Dengan menggunakan dataset Rice Plant Leaf Disease Classification, aplikasi ini memberikan diagnosis cepat dan akurat, membantu petani melakukan tindakan preventif untuk mencegah kerugian dan meningkatkan produktivitas pertanian. Kami berusaha menyediakan solusi yang sederhana dan efektif untuk mendukung ketahanan pangan global.\n\n'
                          'Anggota Kelompok 5\n\n'
                          'Alianur (2209106025) (Ketua) => Machine Learning Development\n\n'
                          'Ashadi Permana (2209106033) => Fullstack Development\n\n'
                          'Dustin Hessel Kopalit (2209106045) => Backend Development\n\n'
                          'Muhammad Reyhanafi (2209106028) => Frontend Development\n\n',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
