import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Todo Page',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: AboutusPage(),
  ));
}

class AboutusPage extends StatelessWidget {
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
                  'เกี่ยวกับ',
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
          // Background container
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
                    color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
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
                    // Add your text content here
                    Text(
                      'เวอร์ชั่น 1.0.0',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'ผู้พัฒนา:',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'นายอติวัศว์ สารบรรณ และ นางสาวศิริลักษณ ์ภู่สุวรรณณรงค',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'ข้อตกลงการใช้งาน: ขอบคุณที่ใช้งานแอพพลิเคชันของเรา! แอพพลิเคชันนี้ถูกพัฒนาขึ้นโดย (PW TO-DO APP) เพื่อช่วยให้คุณจัดการกับงานและกิจกรรมของคุณได้อย่างมีประสิทธิภาพ',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'ข้อมูลเพิ่มเติม:',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'แอพพลิเคชันนี้มีเป้าหมายในการสร้างประสบการณ์การใช้งานที่เรียบง่ายและมีประสิทธิภาพสำหรับผู้ใช้ หากคุณมีข้อเสนอแนะหรือคำแนะนำใดๆ เกี่ยวกับการปรับปรุงแอพพลิเคชัน โปรดติดต่อเราที่ (อีเมล์ติดต่อหรือเว็บไซต์ของบริษัท)',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'ข้อความลิขสิทธิ์: สงวนลิขสิทธิ์ © ปี (2567) (PW TO-DO APP)',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Bottom container with profile picture
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
