import 'package:flutter/material.dart';

import 'waveDesign.dart';
import 'custom_nav_item.dart';


class CustomBottomNavigationBar extends StatefulWidget {
  final Function(int) setPage;

  const CustomBottomNavigationBar({required this.setPage, Key? key})
      : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentIndex = 0; // Menyimpan indeks halaman aktif


  void setPage(int index) {
    setState(() {
      currentIndex = index; // Mengatur halaman berdasarkan indeks
    });
     widget.setPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              child: ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                     color: Color(0xFF107115),
                    // gradient: LinearGradient(
                    //   begin: Alignment.topCenter,
                    //   end: Alignment.bottomCenter,
                    //   colors: [
                    //     // Theme.of(context).primaryColor.withAlpha(150),
                    //     // Theme.of(context).primaryColor,
                    //      Color.fromARGB(255, 118, 224, 123),
                    //      Color(0xFF107115),
                    //   ],
                    // ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 45,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                   CustomNavItem(
                  setPage: setPage,
                  icon: Icons.home,
                  id: 0,
                  isActive: currentIndex == 0,
                ),
                Container(),
                CustomNavItem(
                  setPage: setPage,
                  icon: Icons.camera,
                  id: 1,
                  isActive: currentIndex == 1,
                ),
                Container(),
                CustomNavItem(
                  setPage: setPage,
                  icon: Icons.history,
                  id: 2,
                  isActive: currentIndex == 2,
                ),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const Text(
                    'Home',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Container(),
                  const Text(
                    'Identifikasi',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Container(),
                  const Text(
                    'Histori',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
