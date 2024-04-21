import 'package:flutter/material.dart';
import 'package:project/Profile_page.dart';
import 'package:project/aboutus_page.dart';
import 'package:project/first_page.dart';
import 'package:project/recommend.dart';
import 'package:project/report_page.dart';
import 'package:project/todo_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Todo Page',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: SettingPage(),
  ));
}

class SettingPage extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Color.fromARGB(255, 49, 60, 128),
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'การตั้งค่า', // ชื่อผู้ใช้
                  style: TextStyle(
                    fontFamily: "Promt",
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 49, 60, 128),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 237, 237, 237),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
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
                    SizedBox(height: 10.0),
                    SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: () {
                        // เพิ่มโค้ดสำหรับการเข้าสู่ระบบที่นี่
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ProfileShow();
                        }));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('ข้อมูลส่วนตัว',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Promt',
                                fontSize: 25,
                              )),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 117, 150, 217),
                        minimumSize: Size(double.infinity, 60),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: () {
                        // เพิ่มโค้ดสำหรับการเข้าสู่ระบบที่นี่
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return RecommandPage();
                        }));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('แนะนำการใช้งาน',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Promt',
                                fontSize: 25,
                              )),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 117, 150, 217),
                        minimumSize: Size(double.infinity, 60),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: () {
                        // เพิ่มโค้ดสำหรับการเข้าสู่ระบบที่นี่
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ReportPage();
                        }));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'รายงานปัญหา',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Promt',
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 117, 150, 217),
                        minimumSize: Size(double.infinity, 60),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: () {
                        // เพิ่มโค้ดสำหรับการเข้าสู่ระบบที่นี่
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return AboutusPage();
                        }));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'เกี่ยวกับ',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Promt',
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 117, 150, 217),
                        minimumSize: Size(double.infinity, 60),
                      ),
                    ),
                    SizedBox(height: 170.0),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        onPressed: () {
                          auth.signOut().then((value) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FirstPage()),
                              (route) => false,
                            );
                          });
                        },
                        child: Text(
                          'ออกจากระบบ',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Promt',
                            fontSize: 25,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 50, 39, 39),
                          minimumSize: Size(double.infinity, 60),
                        ),
                      ),
                      widthFactor: 1.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 49, 60, 128),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 40,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CircleAvatar(
                radius: 35,
                backgroundColor: const Color.fromARGB(255, 154, 120, 255),
                child: IconButton(
                  icon: const Icon(
                    Icons.person,
                    size: 55,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const TodoPage();
                    }));
                  },
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
