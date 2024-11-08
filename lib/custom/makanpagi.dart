import 'package:flutter/material.dart';

class MakanPagi extends StatefulWidget {
  @override
  _MakanPagiState createState() => _MakanPagiState();
}

class _MakanPagiState extends State<MakanPagi> {
  bool _switchValuePagi = false;
  double _beratPakanPagi = 1.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 60,
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Card(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Pagi",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(width: 5),
                  Image.asset(
                    'assets/ic-pagi.png',
                    width: 24,
                    height: 24,
                  ),
                  Spacer(),
                  Text(
                    _switchValuePagi ? "ON" : "OFF",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: _switchValuePagi ? Colors.green : Colors.red,
                    ),
                  ),
                  SizedBox(width: 10),
                  Switch(
                    value: _switchValuePagi,
                    onChanged: (bool value) {
                      setState(() {
                        _switchValuePagi = value;
                      });
                    },
                    activeColor: Colors.green,
                    inactiveThumbColor: Colors.red,
                    inactiveTrackColor: Colors.grey[300],
                  ),
                ],
              ),
              Column(
                children: [
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 14, color: Colors.black),
                        children: [
                          TextSpan(
                            text: "Berat pakan yang diberikan ",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                          TextSpan(
                            text: "(kg)",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Slider(
                    value: _beratPakanPagi,
                    min: 1,
                    max: 5,
                    divisions: 4,
                    label: "${_beratPakanPagi.toStringAsFixed(1)} kg",
                    onChanged: (double value) {
                      setState(() {
                        _beratPakanPagi = value;
                      });
                    },
                    activeColor: Colors.green,
                    inactiveColor: Colors.grey[300],
                  ),
                  Text(
                    "Berat pakan: ${_beratPakanPagi.toStringAsFixed(1)} kg",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
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
