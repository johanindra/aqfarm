import 'package:flutter/material.dart';
import 'package:kolamleleiot/custom/bottom_navigation.dart';
// import 'beranda.dart';
// import 'custom/bottom_navigation.dart';
import 'view/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splash Screen Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(), // Panggil SplashScreen sebagai halaman pertama
      routes: {
        '/home': (context) => BottomNavigation(), // Halaman setelah splash
      },
    );
  }
}
