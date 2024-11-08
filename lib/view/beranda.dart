import 'package:flutter/material.dart';
import 'package:kolamleleiot/custom/makanmalam.dart';
import 'package:kolamleleiot/custom/makanpagi.dart';
import 'package:kolamleleiot/custom/makansore.dart';
import 'package:kolamleleiot/view/notifikasi.dart';
import '../grafik/kadar_amonia.dart';
import 'package:intl/intl.dart';
import '../custom/icon_notifikasi.dart';
import 'package:kolamleleiot/componen/collors.dart';

class HomeScreen extends StatefulWidget {
  // final Function(int) onTapNotification;
  // HomeScreen({required this.onTapNotification});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              getGreeting(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: ColorConstants.whiteColor,
              ),
            ),
            // Text(
            //   "Johan",
            //   style: TextStyle(
            //     fontSize: 20,
            //     fontWeight: FontWeight.w600,
            //     color: ColorConstants.blackColor,
            //   ),
            // ),
          ],
        ),
        // backgroundColor: ColorConstants.PutihBiruColor,
        backgroundColor: ColorConstants.BiruColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
                right: 20), // Menambahkan jarak 20 dari kanan
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        NotifikasiScreen(), // Mengarahkan ke NotifikasiScreen
                  ),
                );
              },
              child: CustomNotificationIcon(
                hasNotification:
                    true, // Ganti dengan true atau false sesuai kondisi notifikasi
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // colors: ColorConstants.gradientBackgroundColors,
            colors: ColorConstants.gradientBackgroundColorsBlue,
            // colors: [Color(0xFF62CDFA), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Kadar Amonia",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: ColorConstants.blackColor,
                        ),
                      ),
                    ),
                  ),
                  // Grafik kadar amonia dan Card Kadar Amonia
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Grafik kadar amonia
                      Container(
                        padding: const EdgeInsets.only(left: 40),
                        child: AmoniaChart(),
                      ),
                      SizedBox(width: 30),
                      // Card Kadar Amonia
                      Container(
                        width: 200,
                        child: Column(
                          children: [
                            Card(
                              color: ColorConstants.whiteColor,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              margin: EdgeInsets.only(right: 16),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      currentTime,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: ColorConstants.greyColor,
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
                              width: 250,
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
                                            color: ColorConstants.redColor,
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
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30),
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
                    margin: EdgeInsets.only(left: 30, right: 30, top: 5),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
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
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 60),
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
                          // left: 90,
                          right: 30,
                          child: Image.asset(
                            'assets/waterdrop.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        Positioned(
                          top: 10,
                          // left: 300,
                          right: 10,
                          child: Image.asset(
                            'assets/suhu air.png',
                            fit: BoxFit.contain,
                          ),
                        )
                      ],
                    ),
                  ),
                  // Kartu Hari & Tanggal
                  SizedBox(height: 30),
                  Container(
                    width: double.infinity,
                    child: Card(
                      color: Color(0xFF62CDFA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                      ),
                      margin: EdgeInsets.all(0),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Hari & Tanggal",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10),
                            Text(
                              DateFormat('EEEE, dd MMMM yyyy')
                                  .format(DateTime.now()),
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // pemberian pakan pagi
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MakanPagi(),
                      // SizedBox(height: 20),
                    ],
                  ),
                  SizedBox(height: 5),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MakanSore(),
                      // SizedBox(height: 20),
                    ],
                  ),
                  SizedBox(height: 5),
                  // pemberian pakan malam
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MakanMalam(),
                      SizedBox(height: 20),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
