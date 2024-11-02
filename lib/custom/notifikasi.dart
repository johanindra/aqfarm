import 'package:flutter/material.dart';
import 'package:kolamleleiot/componen/collors.dart';

class SetNamaNull {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Peringatan'),
          content: Row(
            children: [
              Icon(Icons.warning, color: Colors.orange),
              SizedBox(width: 10),
              Expanded(
                child: Text('Silakan masukkan nama Anda.'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class KonfirmNama {
  static void show(
      BuildContext context, String name, VoidCallback onConfirmed) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(Icons.help_outline,
                  color: ColorConstants.primaryColor), // Ikon tanda tanya
              SizedBox(width: 10),
              Text('Konfirmasi Nama'),
            ],
          ),
          content: Text('Apakah Anda yakin menggunakan nama "$name"?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                onConfirmed(); // Panggil callback jika dikonfirmasi
                // Tidak perlu menutup dialog di sini, karena kita sudah navigasi.
              },
              child: Text('Ya'),
            ),
          ],
        );
      },
    );
  }
}
