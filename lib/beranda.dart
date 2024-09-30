import 'package:flutter/material.dart';
import 'grafik/kadar_amonia.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  final Function(int) onTapNotification;

  HomeScreen({required this.onTapNotification});

  // Fungsi untuk mendapatkan ucapan berdasarkan waktu
  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) {
      return 'Selamat Pagi!';
    } else if (hour >= 12 && hour < 15) {
      return 'Selamat Siang!';
    } else if (hour >= 15 && hour < 18) {
      return 'Selamat Sore!';
    } else {
      return 'Selamat Malam!';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Mengambil waktu saat ini
    String currentTime = DateFormat('HH:mm').format(DateTime.now());

    // Menentukan nilai kadar amonia saat ini (ganti dengan nilai yang sesuai)
    double currentAmoniaLevel = 0.67; // Contoh kadar amonia
    String amoniaLevelText = (currentAmoniaLevel * 100).toStringAsFixed(0) +
        '%'; // Menghitung persen

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF62CDFA), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  // Header
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 44, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              getGreeting(),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Nama Pengguna",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            onTapNotification(2); // Ganti ke indeks notifikasi
                          },
                          child: Image.asset(
                            'assets/notifikasi icon.png', // Pastikan nama file benar
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Kadar Amonia
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 30), // Jarak dari kiri
                    child: Align(
                      alignment: Alignment
                          .centerLeft, // Memastikan teks terletak di kiri
                      child: Text(
                        "Kadar Amonia",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  // Grafik kadar amonia dan Card Kadar Amonia
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .start, // Memastikan elemen berada di kiri
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Mengatur posisi vertikal
                    children: [
                      // Grafik kadar amonia
                      Container(
                        padding:
                            const EdgeInsets.only(left: 40), // Jarak dari kiri
                        child: AmoniaChart(), // Grafik kadar amonia
                      ),
                      SizedBox(width: 30), // Jarak antara grafik dan kartu
                      // Card Kadar Amonia
                      Container(
                        width:
                            200, // Atur lebar yang diinginkan untuk Card Kadar Amonia
                        child: Column(
                          // Menambahkan Column untuk menampung Card
                          children: [
                            Card(
                              color: Colors.white,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              margin: EdgeInsets.only(
                                  right: 16), // Mengurangi margin
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      currentTime,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "Kadar Amonia",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Saat Ini",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          amoniaLevelText,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Card Kadar Amonia Info
                            Container(
                              width:
                                  250, // Atur lebar yang diinginkan untuk Card Kadar Amonia Info
                              child: Card(
                                color: Colors.white,
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                margin: EdgeInsets.all(10),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                      ),
                                      children: [
                                        TextSpan(
                                          text:
                                              "Pengurasan kolam akan dilakukan secara otomatis ketika kadar amonia mencapai ",
                                        ),
                                        TextSpan(
                                          text: "0,05 ppm",
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // Suhu Air
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft, // Menjaga teks di kiri
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 30), // Jarak dari kiri
                      child: Text(
                        "Suhu Air",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),

                  // Card Suhu Air
                  Card(
                    color: Colors.white,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.only(
                        left: 30, right: 30, top: 5), // Jarak kiri dan kanan
                    child: Stack(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.all(15), // Padding untuk teks
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Suhu Air 30°C",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey,
                                ),
                              ),
                              // SizedBox(height: 0),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 60), // Jarak dari atas
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            child: Image.asset(
                              'assets/gelombang.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 90,
                          child: Image.asset(
                            'assets/waterdrop.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Kartu Hari & Tanggal
                  SizedBox(
                      height:
                          30), // Jarak antara kartu suhu air dan kartu hari & tanggal
                  Container(
                    width:
                        double.infinity, // Mengatur lebar container ke maksimum
                    child: Card(
                      color: Color(0xFF62CDFA), // Warna biru untuk kartu
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top:
                              Radius.circular(30), // Lengkungan pada pojok atas
                        ),
                      ),
                      margin: EdgeInsets.all(
                          0), // Tidak ada jarak antara kiri dan kanan
                      child: Padding(
                        padding:
                            const EdgeInsets.all(20), // Padding di dalam kartu
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment
                              .center, // Menyusun isi di tengah secara vertikal
                          crossAxisAlignment: CrossAxisAlignment
                              .center, // Menyusun isi di tengah secara horizontal
                          children: [
                            Text(
                              "Hari & Tanggal",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                              textAlign:
                                  TextAlign.center, // Menyusun teks di tengah
                            ),
                            SizedBox(height: 10),
                            // Menampilkan tanggal, bulan, dan tahun saat ini
                            Text(
                              DateFormat('EEEE, dd MMMM yyyy')
                                  .format(DateTime.now()),
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors
                                    .black, // Mengubah warna teks menjadi hitam
                              ),
                              textAlign:
                                  TextAlign.center, // Menyusun teks di tengah
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 300),
                  Text("hallo")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
