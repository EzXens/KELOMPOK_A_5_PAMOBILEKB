import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_pa/pages/ProfilePage.dart';
import 'package:flutter_application_pa/pages/getstartedpage.dart';
import 'package:flutter_application_pa/pages/introductions_screen.dart';
import 'package:flutter_application_pa/pages/loginpage.dart';
import 'package:flutter_application_pa/pages/registerpage.dart';
import 'package:flutter_application_pa/pages/homepage.dart';
import 'package:flutter_application_pa/pages/settingpage.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_pa/models/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Flutter Application PA',
      theme: themeProvider.themeData,
      initialRoute: '/getStarted',
      routes: {
        '/': (context) => const MyHomePage(),
        '/settings': (context) => const MySettingPage(),
        '/introduction': (context) => const IntroductionPage(),
        '/getStarted': (context) => const GetStartedPage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}
