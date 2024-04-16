import 'package:flutter/material.dart';
import 'package:project/Profile_page.dart';
import 'package:project/aboutus_page.dart';
import 'package:project/first_page.dart';
import 'package:project/recommend.dart';
import 'package:project/report_page.dart';
import 'package:project/todo_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                'อติวัศว์ สารบรรณ',
                style: TextStyle(
                  fontFamily: "Promt",
                  fontSize: 25,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
                size: 40,
              ),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return SettingPage();
                }));
              },
            ),
          ],
        ),
        elevation: 0,
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
                          return ProfilePage();
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
                    ElevatedButton(
                      onPressed: () {
                        auth.signOut().then((value) {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return FirstPage();
                          }));
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
                        backgroundColor: const Color.fromARGB(255, 50, 39, 39),
                        minimumSize: Size(double.infinity, 60),
                      ),
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
                left: 160,
                bottom: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Color.fromARGB(255, 154, 120, 255),
                      child: IconButton(
                        icon: Icon(
                          Icons.person,
                          size: 55,
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return TodoPage();
                          }));
                        },
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
              ),
        ],
      ),
    );
  }
}
