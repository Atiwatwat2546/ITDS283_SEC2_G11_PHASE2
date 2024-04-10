import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'PW TO-DO APP',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: FirstPage(),
  ));
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 49, 60, 128),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PW',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 70.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'TO-DO',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 70.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'APP',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 70.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Container(
                width: 350,
                height: 65,
                child: ElevatedButton(onPressed: () {
                  // เพิ่มโค้ดสำหรับการเข้าสู่ระบบที่นี่
                },
                child: Text('เข้าสู่ระบบ',
                style: TextStyle(
                      color: Color.fromARGB(255, 49, 60, 128),
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),),)
                
              ),
            ),
          ),
        ],
      ),
    );
  }
}
