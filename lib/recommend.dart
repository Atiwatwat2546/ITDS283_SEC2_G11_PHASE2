import 'package:flutter/material.dart';
import 'package:PW/todo_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Todo Page',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: RecommandPage(),
  ));
}

class RecommandPage extends StatelessWidget {
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
                  'แนะนำการใช้งาน',
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('คำอธิบายการใช้แอพ',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Promt',
                                fontSize: 16,
                              )),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 45, 74, 134),
                        minimumSize: Size(double.infinity, 55),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                        'TO DO APP สร้างขึ้นมาเพื่อช่วยให้ผู้ใช้สามารถจัดการงานและกิจกรรมต่างๆ ได้อย่างมีระเบียบ และสะดวกสบาย',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Promt-Medium',
                          fontSize: 14,
                        )),
                    SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: () {
                        ////////////////////////////////////////
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('การใช้งานแอพ',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Promt',
                                fontSize: 16,
                              )),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 45, 74, 134),
                        minimumSize: Size(double.infinity, 55),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Text('1. เข้าสู่ระบบ',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Promt-Medium',
                          fontSize: 14,
                        )),
                    Text(
                        '2. กดปุ่ม " + เพิ่มงาน" เพื่อใส่กิจกรรมต่าง ๆ ที่จะต้องทำ',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Promt-Medium',
                          fontSize: 14,
                        )),
                    Text('3. ใช้ข้อมูลกิจกรรมเสร็จแล้วกดปุ่ม "บันทึก" ',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Promt-Medium',
                          fontSize: 14,
                        )),
                    Text('หากต้องการแก้ไข หรือยกเลิกกิจกรรมที่บันทึกไป',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Promt-Medium',
                          fontSize: 14,
                        )),
                    Text('1. กดกิจกรรมที่ได้บันทึกไว้',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Promt-Medium',
                          fontSize: 14,
                        )),
                    Text(
                        '2. กดปุ่ม "แก้ไข" เพื่อทำการแก้ไขข้อมูล และกดปุ่ม "ลบ" เพื่อทำการลบข้อมูลที่ไม่ต้องการ',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Promt-Medium',
                          fontSize: 14,
                        )),
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
                    Navigator.pushReplacement(context,
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
