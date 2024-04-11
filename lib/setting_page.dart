import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Todo Page',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: TodoPage(),
  ));
}

class TodoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Color.fromARGB(255, 49, 60, 128),
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'อติวัศว์ สารบรรณ',
                  style: TextStyle(
                    fontFamily: "Promt",
                    fontSize: 30,
                    color: Colors.white,
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
                    SizedBox(height: 10.0),
                    SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: () {}, 
                      child: Text('ข้อมูลส่วนตัว',
                      style: TextStyle(
                        color: Colors.white
                      )),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 117, 150, 217),                         
                          ),
                      ),
                    SizedBox(height: 10.0),
                    ElevatedButton(onPressed: () {}, 
                      child: Text('แนะนำการใช้งาน',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Promt',
                      )),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 117, 150, 217), 
                      ),
                    ),
                    SizedBox(height: 10.0),
                    ElevatedButton(onPressed: () {}, 
                      child: Text('รายงานปัญหา')),
                    SizedBox(height: 10.0),
                    ElevatedButton(onPressed: () {}, 
                      child: Text('เกี่ยวกับ')),
                    SizedBox(height: 100.0),
                    ElevatedButton(onPressed: () {}, 
                      child: Text('ออกจากระบบ'))
                  ],
                ),
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
                          // โค้ดสำหรับการเปลี่ยนหน้า
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
