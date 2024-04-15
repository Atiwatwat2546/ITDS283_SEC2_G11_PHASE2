import 'package:flutter/material.dart';
import 'package:project/todo_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Todo Page',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: ProfilePage(),
  ));
}

class ProfilePage extends StatelessWidget {
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
                Expanded(
                  child: Text(
                    'ข้อมูลส่วนตัว',
                    style: TextStyle(
                      fontFamily: "Promt",
                      fontSize: 25,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 40,
                ),
              ],
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
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Color.fromARGB(255, 129, 90, 246),
                        child: Icon(
                          Icons.person,
                          color: const Color.fromARGB(255, 0, 0, 0),
                          size: 60,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      SizedBox(height: 10.0),
                      ElevatedButton(
                        onPressed: () {
                          ////////////////////////////////////////
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('ชื่อ : ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Promt',
                                  fontSize: 16,
                                )),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 117, 150, 217),
                          minimumSize: Size(double.infinity, 55),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      ElevatedButton(
                        onPressed: () {
                          ////////////////////////////////////////
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('วันเกิด : ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Promt',
                                  fontSize: 16,
                                )),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 117, 150, 217),
                          minimumSize: Size(double.infinity, 55),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                ////////////////////////////////////////
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'เพศ : ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Promt',
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 117, 150, 217),
                                minimumSize: Size(double.infinity, 55),
                              ),
                            ),
                          ),
                          SizedBox(width: 30), // ระยะห่างระหว่างปุ่ม
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                ////////////////////////////////////////
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'อายุ : ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Promt',
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 117, 150, 217),
                                minimumSize: Size(double.infinity, 55),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      ElevatedButton(
                        onPressed: () {
                          ////////////////////////////////////////
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('อาชีพ : ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Promt',
                                  fontSize: 16,
                                )),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 117, 150, 217),
                          minimumSize: Size(double.infinity, 55),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      ElevatedButton(
                        onPressed: () {
                          ////////////////////////////////////////
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('ที่อยู่ : ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Promt',
                                  fontSize: 16,
                                )),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 117, 150, 217),
                          minimumSize: Size(double.infinity, 55),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      ElevatedButton(
                        onPressed: () {
                          ////////////////////////////////////////
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('อีเมล : ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Promt',
                                  fontSize: 16,
                                )),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 117, 150, 217),
                          minimumSize: Size(double.infinity, 55),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      ElevatedButton(
                        onPressed: () {
                          ////////////////////////////////////////
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('เบอร์โทร : ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Promt',
                                  fontSize: 16,
                                )),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 117, 150, 217),
                          minimumSize: Size(double.infinity, 55),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          Stack(
            children: [
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
                      // เพิ่มโค้ดสำหรับการเข้าสู่ระบบที่นี่
                      Navigator.push(context,
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
        ],
      ),
    );
  }
}
