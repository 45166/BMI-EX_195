import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  const Bmi({super.key});

  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  TextEditingController txHight = TextEditingController();
  TextEditingController txWidth = TextEditingController();
  TextEditingController txName = TextEditingController();
  TextEditingController txAge = TextEditingController();

  String _result = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "BMI-Exchange",
            style: TextStyle(fontSize: 40.0),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 255, 242, 0),
      ),
      backgroundColor:
          Color.fromARGB(255, 249, 255, 128), // เพิ่มสีพื้นหลังใน Scaffold
      body: Center(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.person),
              title: TextField(
                controller: txName,
                maxLength: 100,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: "ชื่อ-นามสกุล",
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person_outline),
              title: TextField(
                controller: txAge,
                maxLength: 3,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "ระบุอายุ",
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.height),
              title: TextField(
                controller: txHight,
                maxLength: 3,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "ระบุส่วนสูง (cm)",
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.add_chart),
              title: TextField(
                controller: txWidth,
                maxLength: 3,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "ระบุน้ำหนัก (kg)",
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                ),
              ),
            ),
            ListTile(
              title: Text("$_result"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(245, 141, 255, 149),
                padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 45.0),
              ),
              onPressed: () {
                setState(() {
                  var _heightM = double.parse(txHight.text) / 100;
                  var _bmi = double.parse(txWidth.text) / (_heightM * _heightM);
                  _result = _bmi.toStringAsFixed(3);
                  if (_bmi >= 30) {
                    _result = "อ้วนมาก";
                  } else if (_bmi >= 25) {
                    _result = "อ้วน";
                  } else if (_bmi >= 23) {
                    _result = "น้ำหนักเกิน";
                  } else {
                    _result = "ผอม";
                  }

                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            "ผล BMI",
                            style: TextStyle(fontSize: 18.0),
                          ),
                          content: Container(
                            width: 300,
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'ชื่อ: ${txName.text}',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                Text(
                                  'อายุ${txAge.text}',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                Text(
                                  'มีค่า BMI = ${_bmi.toStringAsFixed(3)}',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                Text(
                                  '$_result',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('ปิด'))
                          ],
                        );
                      });
                });
              },
              child: Text(
                "หาBMI",
                style: TextStyle(fontSize: 30.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
