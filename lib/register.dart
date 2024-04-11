import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
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
        toolbarHeight: 150,
        backgroundColor: Color.fromARGB(255, 49, 60, 128),
        title: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'สมัครสมาชิก',
                  style: TextStyle(
                    fontFamily: "Promt",
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'สมัครสมาชิกเพื่อเข้าสู่ระบบของคุณ',
                  style: TextStyle(
                    fontFamily: "Promt",
                    fontSize: 18,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ],
            ),
          ],
        ),
        elevation: 0,
      ),
      backgroundColor: Color.fromARGB(255, 49, 60, 128),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 237, 237, 237),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45),
              topRight: Radius.circular(45.0),
            ),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 0,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // ไอคอนแบบวงกลมอยู่ด้านบนอันแรกตรงกลางจอ
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Color.fromARGB(255, 129, 90, 246),
                  child: Icon(
                    Icons.person,
                    color: const Color.fromARGB(255, 0, 0, 0),
                    size: 50,
                  ),
                ),
                SizedBox(height: 10.0),
                // ช่องข้อความ Username
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: TextStyle(
                      fontFamily: "Prompt-Thin.ttf",
                      color: Color.fromARGB(255, 133, 133, 133),
                    ),
                    contentPadding: EdgeInsets.only(left: 20.0, bottom: 30),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 206, 206, 206),
                  ),
                ),

                SizedBox(height: 10.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      fontFamily: "Prompt-Thin.ttf",
                      color: Color.fromARGB(255, 133, 133, 133),
                    ), // เพิ่มสีให้กับข้อความ Label
                    contentPadding: EdgeInsets.only(
                        left: 20.0,
                        bottom: 30), // ปรับระยะห่างระหว่างข้อความและขอบทางซ้าย
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      borderSide: BorderSide.none, // ปิดเส้นขอบ
                    ),
                    filled: true, // เปิดการเติมสีพื้นหลัง
                    fillColor: Color.fromARGB(
                        255, 206, 206, 206), // สีที่ใช้เติมพื้นหลัง
                  ),
                ),
                SizedBox(height: 10.0),

                TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      fontFamily: "Prompt-Thin.ttf",
                      color: Color.fromARGB(255, 133, 133, 133),
                    ), // เพิ่มสีให้กับข้อความ Label
                    contentPadding: EdgeInsets.only(
                        left: 20.0,
                        bottom: 30), // ปรับระยะห่างระหว่างข้อความและขอบทางซ้าย
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      borderSide: BorderSide.none, // ปิดเส้นขอบ
                    ),
                    filled: true, // เปิดการเติมสีพื้นหลัง
                    fillColor: Color.fromARGB(
                        255, 206, 206, 206), // สีที่ใช้เติมพื้นหลัง
                    suffixIcon: GestureDetector(
                      onTap: () {
                        // โค้ดสำหรับแสดงหรือซ่อนรหัสผ่าน
                      },
                      child: Icon(
                        Icons.visibility, // ไอคอนใช้สำหรับแสดงรหัสผ่าน
                        color: Colors.grey, // สีของไอคอน
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                    // โค้ดสำหรับการสมัครสมาชิก
                    Navigator.pushNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 49, 60, 128), // สีพื้นหลังของปุ่ม
                    padding: EdgeInsets.symmetric(
                        horizontal: 50, vertical: 7), // ปรับขนาดของปุ่ม
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
                  ' หรือ ',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Promt-Thin",
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // โค้ดสำหรับการสมัครสมาชิก
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Color.fromARGB(255, 255, 255, 255), // สีพื้นหลังของปุ่ม
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ), // ปรับขนาดของปุ่ม
                    elevation: 5, // ระดับของเงา
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ClipOval(
                          child: Image.asset(
                            'assets/google_logo.png',
                            width: 35, // ขนาดของโลโก้ Facebook
                            height: 35,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20), // ขยับข้อความไปทางขวาจากโลโก้ Facebook
                        child: Text(
                          'ดำเนินการโดย Google',
                          style: TextStyle(
                            fontFamily: "Promt-Thin",
                            fontWeight: FontWeight.w800,
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.arrow_forward_ios,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ), // ลูกศรชี้ไปทางขวา
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // โค้ดสำหรับการสมัครสมาชิก
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Color.fromARGB(255, 255, 255, 255), // สีพื้นหลังของปุ่ม
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ), // ปรับขนาดของปุ่ม
                    elevation: 5, // ระดับของเงา
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ClipOval(
                          child: Image.asset(
                            'assets/facebook_logo.png',
                            width: 35, // ขนาดของโลโก้ Facebook
                            height: 35,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                        ), // ขยับข้อความไปทางขวาจากโลโก้ Facebook
                        child: Text(
                          'ดำเนินการโดย Facebook',
                          style: TextStyle(
                            fontFamily: "Promt-Thin",
                            fontWeight: FontWeight.w800,
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ), // ลูกศรชี้ไปทางขวา
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
