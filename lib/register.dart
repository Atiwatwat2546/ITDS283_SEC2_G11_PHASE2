import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(
    title: 'Register Page',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: RegistrationPage(),
  ));
}

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(
            255, 49, 60, 128), // สีพื้นหลังของ App Bar เป็นสีน้ำเงิน
        title: Text(
          'สมัครสมาชิก',
          style:
              TextStyle(fontFamily: "Promt", fontSize: 30, color: Colors.white),
        ), // หัวข้อด้านบน
        elevation: 0, // เอียงขอบเขตของ App Bar เป็น 0 เพื่อให้ไม่มีเงา
      ),
      backgroundColor: Color.fromARGB(255, 49, 60, 128),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45),
                topRight: Radius.circular(45.0)), // มุมโค้งของกล่องสีขาวใหญ่
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 0,
                offset: Offset(0, 3), // เงาของกล่องสีขาวใหญ่
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: TextStyle(
                      fontFamily: "Prompt-Medium.ttf",
                      color: Color.fromARGB(255, 89, 89, 89),
                    ), // เพิ่มสีให้กับข้อความ Label
                    contentPadding: EdgeInsets.only(left: 20.0, bottom: 40),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ), // กำหนดสีขอบของกล่องข้อความ
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      fontFamily: "Prompt-Medium.ttf",
                      color: Color.fromARGB(255, 89, 89, 89),
                    ), // เพิ่มสีให้กับข้อความ Label
                    contentPadding: EdgeInsets.only(left: 20.0, bottom: 40),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ), // กำหนดสีขอบของกล่องข้อความ
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      fontFamily: "Prompt-Medium.ttf",
                      color: Color.fromARGB(255, 89, 89, 89),
                    ), // เพิ่มสีให้กับข้อความ Label
                    contentPadding: EdgeInsets.only(
                        left: 20.0,
                        bottom: 40), // ปรับระยะห่างระหว่างข้อความและขอบทางซ้าย
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ), // กำหนดสีขอบของกล่องข้อความ
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // โค้ดสำหรับการสมัครสมาชิก
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 49, 60, 128), // สีพื้นหลังของปุ่ม
                    padding: EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10), // ปรับขนาดของปุ่ม
                  ),
                  child: Text(
                    'สมัครสมาชิก',
                    style: TextStyle(
                      fontFamily: "Promt",
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ หรือ ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // โค้ดสำหรับการสมัครสมาชิก
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 49, 60, 128), // สีพื้นหลังของปุ่ม
                    padding: EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10), // ปรับขนาดของปุ่ม
                  ),
                  child: Text(
                    'ดำเนินการโดย Google',
                    style: TextStyle(
                      fontFamily: "Promt",
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // โค้ดสำหรับการสมัครสมาชิก
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 49, 60, 128), // สีพื้นหลังของปุ่ม
                    padding: EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10), // ปรับขนาดของปุ่ม
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Image.asset('assets/facebook_logo.png',
                                width: 30, height: 30), // ไอคอน Facebook
                          ),
                        ],
                      ),
                      Text(
                        'ดำเนินการโดย Facebook',
                        style: TextStyle(
                          fontFamily: "Promt",
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.arrow_forward_ios), // ลูกศรชี้ไปทางขวา
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
