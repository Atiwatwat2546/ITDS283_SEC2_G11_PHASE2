import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart'; // เพิ่ม import นี้
import 'package:project/edit_Profile_page.dart';
import 'dart:async';

import 'package:project/todo_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const TODO());
}

class TODO extends StatelessWidget {
  const TODO({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const ProfileShow(),
    );
  }
}

class ProfileShow extends StatefulWidget {
  const ProfileShow({Key? key}) : super(key: key);

  @override
  _ProfileShowState createState() => _ProfileShowState();
}

class _ProfileShowState extends State<ProfileShow> {
  late String _currentUserUID;
  late String _profileImageUrl =''; // เพิ่มตัวแปรเก็บ URL รูปภาพโปรไฟล์

  @override
  void initState() {
    super.initState();
    _getCurrentUserUID();
    _loadProfileImage(); // เรียกใช้ฟังก์ชันเมื่อโพรไฟล์โหลดเสร็จ
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _getCurrentUserUID() {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      setState(() {
        _currentUserUID = uid;
      });
      print('UID ของผู้ใช้: $_currentUserUID');
    } else {
      print('ไม่พบผู้ใช้ที่ล็อกอินอยู่');
    }
  }

  // ฟังก์ชันดึง URL รูปภาพโปรไฟล์จาก Firebase Storage
  void _loadProfileImage() async {
    String profileImageName = '$_currentUserUID.jpg'; // ใช้ UID เป็นชื่อไฟล์ภาพ
    try {
      String url = await FirebaseStorage.instance
          .ref('profile_images/$profileImageName')
          .getDownloadURL();
      setState(() {
        _profileImageUrl = url; // เก็บ URL รูปภาพ
      });
    } catch (e) {
      print('เกิดข้อผิดพลาดในการดึงรูปภาพ: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: const Color.fromARGB(255, 49, 60, 128),
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ข้อมูลส่วนตัว',
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
      backgroundColor: const Color.fromARGB(255, 49, 60, 128),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(45),
                  topRight: const Radius.circular(45),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: Offset(0, 3),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CircleAvatar(
                      radius: 68,
                      backgroundColor: Color.fromARGB(255, 183, 160, 255),
                      child: _profileImageUrl
                              .isNotEmpty // ตรวจสอบว่ามี URL รูปภาพหรือไม่
                          ? ClipOval(
                              child: Image.network(
                                _profileImageUrl,
                                fit: BoxFit.cover,
                                width: 125,
                                height: 125,
                              ),
                            )
                          : Icon(Icons.camera_alt),
                    ),
                    StreamBuilder<DocumentSnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('user')
                          .doc(_currentUserUID)
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<DocumentSnapshot> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        }
                        if (snapshot.hasError) {
                          return Text('เกิดข้อผิดพลาด: ${snapshot.error}');
                        }
                        if (!snapshot.hasData || !snapshot.data!.exists) {
                          final emptyUserData = {
                            'name': '',
                            'birthday': '',
                            'sex': '',
                            'age': '',
                            'job': '',
                            'address': '',
                            'phone': '',
                          };
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            
                            children: [
                              SizedBox(height: 10,),
                              Text(
                                'ชื่อ: ${emptyUserData['name']}',
                                style: TextStyle(
                                  fontFamily: "Promt-Medium",
                                  fontSize: 20,
                                  color: Colors.black,
                                  shadows: [
                                    Shadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      offset: Offset(0, 2),
                                      blurRadius: 3,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'อายุ: ${emptyUserData['age']}',
                                style: TextStyle(
                                  fontFamily: "Promt-Medium",
                                  fontSize: 20,
                                  color: Colors.black,
                                  shadows: [
                                    Shadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      offset: Offset(0, 2),
                                      blurRadius: 3,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'วันเกิด: ${emptyUserData['birthday']}',
                                style: TextStyle(
                                  fontFamily: "Promt-Medium",
                                  fontSize: 20,
                                  color: Colors.black,
                                  shadows: [
                                    Shadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      offset: Offset(0, 2),
                                      blurRadius: 3,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'อาชีพ: ${emptyUserData['job']}',
                                style: TextStyle(
                                  fontFamily: "Promt-Medium",
                                  fontSize: 20,
                                  color: Colors.black,
                                  shadows: [
                                    Shadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      offset: Offset(0, 2),
                                      blurRadius: 3,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'เพศ: ${emptyUserData['sex']}',
                                style: TextStyle(
                                  fontFamily: "Promt-Medium",
                                  fontSize: 20,
                                  color: Colors.black,
                                  shadows: [
                                    Shadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      offset: Offset(0, 2),
                                      blurRadius: 3,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'ที่อยู่: ${emptyUserData['address']}',
                                style: TextStyle(
                                  fontFamily: "Promt-Medium",
                                  fontSize: 20,
                                  color: Colors.black,
                                  shadows: [
                                    Shadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      offset: Offset(0, 2),
                                      blurRadius: 3,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'เบอร์โทร: ${emptyUserData['phone']}',
                                style: TextStyle(
                                  fontFamily: "Promt-Medium",
                                  fontSize: 20,
                                  color: Colors.black,
                                  shadows: [
                                    Shadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      offset: Offset(0, 2),
                                      blurRadius: 3,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        }
                        final userData =
                            snapshot.data!.data() as Map<String, dynamic>;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            Text(
                              'ชื่อ: ${userData['name']}',
                              style: TextStyle(
                                fontFamily: "Promt-Medium",
                                fontSize: 20,
                                color: Colors.black,
                                shadows: [
                                  Shadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    offset: Offset(0, 2),
                                    blurRadius: 3,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // เพิ่ม Text Widgets อื่นๆ ตามฟิลด์ที่ต้องการแสดง
                            Text(
                              'วันเกิด: ${userData['birthday']}',
                              style: TextStyle(
                                fontFamily:
                                    "Promt-Medium", // เปลี่ยนฟอนท์เป็น Promt-thin
                                fontSize: 20, // ปรับขนาดข้อความ
                                color: Colors.black, // สีข้อความ
                                shadows: [
                                  Shadow(
                                    color:
                                        Colors.grey.withOpacity(0.5), // สีเงา
                                    offset: Offset(0, 2), // ตำแหน่งเงา
                                    blurRadius: 3, // ขนาดของเงา
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'เพศ: ${userData['sex']}',
                              style: TextStyle(
                                fontFamily:
                                    "Promt-Medium", // เปลี่ยนฟอนท์เป็น Promt-thin
                                fontSize: 20, // ปรับขนาดข้อความ
                                color: Colors.black, // สีข้อความ
                                shadows: [
                                  Shadow(
                                    color:
                                        Colors.grey.withOpacity(0.5), // สีเงา
                                    offset: Offset(0, 2), // ตำแหน่งเงา
                                    blurRadius: 3, // ขนาดของเงา
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'อายุ: ${userData['age']}',
                              style: TextStyle(
                                fontFamily:
                                    "Promt-Medium", // เปลี่ยนฟอนท์เป็น Promt-thin
                                fontSize: 20, // ปรับขนาดข้อความ
                                color: Colors.black, // สีข้อความ
                                shadows: [
                                  Shadow(
                                    color:
                                        Colors.grey.withOpacity(0.5), // สีเงา
                                    offset: Offset(0, 2), // ตำแหน่งเงา
                                    blurRadius: 3, // ขนาดของเงา
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'อาชีพ: ${userData['job']}',
                              style: TextStyle(
                                fontFamily:
                                    "Promt-Medium", // เปลี่ยนฟอนท์เป็น Promt-thin
                                fontSize: 20, // ปรับขนาดข้อความ
                                color: Colors.black, // สีข้อความ
                                shadows: [
                                  Shadow(
                                    color:
                                        Colors.grey.withOpacity(0.5), // สีเงา
                                    offset: Offset(0, 2), // ตำแหน่งเงา
                                    blurRadius: 3, // ขนาดของเงา
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'ที่อยู่: ${userData['address']}',
                              style: TextStyle(
                                fontFamily:
                                    "Promt-Medium", // เปลี่ยนฟอนท์เป็น Promt-thin
                                fontSize: 20, // ปรับขนาดข้อความ
                                color: Colors.black, // สีข้อความ
                                shadows: [
                                  Shadow(
                                    color:
                                        Colors.grey.withOpacity(0.5), // สีเงา
                                    offset: Offset(0, 2), // ตำแหน่งเงา
                                    blurRadius: 3, // ขนาดของเงา
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'เบอร์โทรศัพท์: ${userData['phone']}',
                              style: TextStyle(
                                fontFamily:
                                    "Promt-Medium", // เปลี่ยนฟอนท์เป็น Promt-thin
                                fontSize: 20, // ปรับขนาดข้อความ
                                color: Colors.black, // สีข้อความ
                                shadows: [
                                  Shadow(
                                    color:
                                        Colors.grey.withOpacity(0.5), // สีเงา
                                    offset: Offset(0, 2), // ตำแหน่งเงา
                                    blurRadius: 3, // ขนาดของเงา
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return EditProfilePage();
                            }));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 255, 145, 0),
                            padding: const EdgeInsets.symmetric(
                                vertical: 14, horizontal: 30),
                          ),
                          child: const Text(
                            'แก้ไขข้อมูลส่วนตัว',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
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
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 49, 60, 128),
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
