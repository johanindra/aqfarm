import 'package:flutter/material.dart';

class CustomNotificationIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40, // Ukuran lingkaran
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle, // Membuat background berbentuk lingkaran
        color: Colors.white, // Warna background lingkaran
      ),
      child: Center(
        child: Icon(
          Icons.notifications, // Ikon notifikasi
          color: Color(0xFF62CDFA), // Warna ikon
          size: 24, // Ukuran ikon
        ),
      ),
    );
  }
}
