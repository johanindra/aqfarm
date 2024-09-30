import 'package:flutter/material.dart';

class NotifikasiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF62CDFA), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            SizedBox(height: 20),
            _buildAmoniaLevel(),
            SizedBox(height: 20),
            _buildWaterTemperature(),
            SizedBox(height: 20),
            _buildDateSection(),
            SizedBox(height: 20),
            _buildFeedingSchedule(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Good Morning,',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Text(
          'Aashifa Sheikh',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildAmoniaLevel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Kadar Amonia',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Row(
          children: [
            Expanded(
              child: LinearProgressIndicator(
                value: 0.67,
                backgroundColor: Colors.grey[300],
                color: Colors.blue,
              ),
            ),
            SizedBox(width: 10),
            Text('67%', style: TextStyle(fontSize: 16)),
          ],
        ),
        SizedBox(height: 5),
        Text(
          'Kadar Amonia saat ini: 0.01 ppm',
          style: TextStyle(color: Colors.grey),
        ),
        Text(
          'Pengurasan kolam akan dilakukan secara otomatis ketika kadar amonia mencapai 0.05 ppm',
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildWaterTemperature() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Suhu Air',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Row(
          children: [
            Icon(Icons.water, size: 30, color: Colors.blue),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('11:00 AM', style: TextStyle(fontSize: 16)),
                Text('Suhu Air 30°C', style: TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDateSection() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Color(0xFF62CDFA),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            'Hari & Tanggal',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(height: 5),
          Text(
            '16 Juni 2023',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildFeedingSchedule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Berat Pakan yang Diberikan (kg)',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(height: 10),
        _buildFeedingRow('Pagi', '06:41 AM', 125),
        _buildFeedingRow('Sore', '14:41 PM', 57),
        _buildFeedingRow('Malam', '22:41 PM', 0),
      ],
    );
  }

  Widget _buildFeedingRow(String time, String label, double weight) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 4, spreadRadius: 2),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(time, style: TextStyle(fontSize: 16)),
              Text(label, style: TextStyle(fontSize: 16)),
            ],
          ),
          Column(
            children: [
              Text(weight.toString(), style: TextStyle(fontSize: 16)),
              Slider(
                value: weight,
                min: 0,
                max: 200,
                onChanged: (value) {},
                activeColor: Colors.blue,
                inactiveColor: Colors.grey[300],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
