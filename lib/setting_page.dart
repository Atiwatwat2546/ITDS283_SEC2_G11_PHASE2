import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.only(
              left: 30.0), // เพิ่ม padding เพื่อขยับไอคอนไปทางซ้าย
          icon: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                radius: 16,
                child: Icon(Icons.person),
              ),
            ],
          ),
          onPressed: () {},
        ),
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
              onPressed: () {},
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
                        ////////////////////////////////////////
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
                        ////////////////////////////////////////
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
                        Navigator.pushNamed(context, '/report');
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
                        Navigator.pushNamed(context, '/aboutus');
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
                        Navigator.pushNamed(context, '/');
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
                      // โค้ดสำหรับการเปลี่ยนหน้า
                      Navigator.pushNamed(context, '/home');
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
