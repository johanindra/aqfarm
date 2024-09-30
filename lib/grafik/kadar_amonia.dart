import 'package:flutter/material.dart';

Widget AmoniaChart() {
  return Stack(
    alignment: Alignment.center,
    children: [
      SizedBox(
        width: 100,
        height: 100,
        child: CircularProgressIndicator(
          value: 0.67, // Nilai 67%
          strokeWidth: 8,
          backgroundColor: Colors.grey[300],
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
      ),
      Text(
        '67%',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ],
  );
}
