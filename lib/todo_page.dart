import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:PW/addwork_page.dart';
import 'package:PW/setting_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';

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
      title: 'TODO APP',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const TodoPage(),
    );
  }
}

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  late Timer _timer;
  late String _currentUserUID; // กำหนดให้เป็น late

  @override
  void initState() {
    super.initState();
    _startTimer();
    _getCurrentUserUID(); // เรียกใช้ฟังก์ชั่นเพื่อดึง UID ของผู้ใช้ที่ล็อกอิน
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final now = DateTime.now();

      FirebaseFirestore.instance
          .collection('activity')
          .where('datetime', isLessThan: now)
          .where('uid',
              isEqualTo:
                  _currentUserUID) // เพิ่มเงื่อนไขเพื่อค้นหาเฉพาะข้อมูลของผู้ใช้ปัจจุบัน
          .get()
          .then((querySnapshot) {
        if (querySnapshot.docs.isNotEmpty) {
          querySnapshot.docs.forEach((doc) {
            doc.reference.delete().then((_) {
              print("รายการ ${doc.id} ถูกลบแล้ว");
            }).catchError((error) {
              print("เกิดข้อผิดพลาดในการลบรายการ ${doc.id}: $error");
            });
          });
        }
      });
    });
  }

  // ดึง UID ของผู้ใช้ที่ล็อกอิน
  void _getCurrentUserUID() {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      setState(() {
        _currentUserUID =
            uid; // กำหนดค่าให้กับ _currentUserUID ใน setState เพื่อสร้าง UI ใหม่
      });
      print('UID ของผู้ใช้: $_currentUserUID');
    } else {
      print('ไม่พบผู้ใช้ที่ล็อกอินอยู่');
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
                const Text(
                  'สิ่งที่ต้องทำ',
                  style: TextStyle(
                    fontFamily: "Promt",
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SettingPage();
                    }));
                  },
                  child: const Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ],
            ),
          ],
        ),
        automaticallyImplyLeading: false, // ไม่แสดงปุ่มย้อนกลับ
        elevation: 0,
      ),
      backgroundColor: const Color.fromARGB(255, 49, 60, 128),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 237, 237, 237),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 0, 0, 0),
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
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: const TextStyle(
                            color: Colors.grey, fontFamily: "Promt-Thin"),
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                        prefixIconConstraints:
                            const BoxConstraints(minWidth: 60),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 26, 27, 63),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return const AddworkPage();
                        }));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 26, 27, 63),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.add, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            'เพิ่มงาน',
                            style: TextStyle(
                              fontFamily: "Promt-SemiBold",
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Expanded(
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('activity')
                            .where('uid',
                                isEqualTo:
                                    _currentUserUID) // เพิ่มเงื่อนไขเพื่อค้นหาเฉพาะข้อมูลของผู้ใช้ปัจจุบัน
                            .orderBy('datetime')
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (snapshot.hasError) {
                            return const Center(
                              child: Text('Something went wrong'),
                            );
                          }
                          return ListView(
                            children: snapshot.data!.docs
                                .map((DocumentSnapshot document) {
                              Map<String, dynamic> data =
                                  document.data() as Map<String, dynamic>;
                              return Card(
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                margin: const EdgeInsets.only(top: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 120, 154, 228),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data['name'] ?? '',
                                              style: const TextStyle(
                                                fontFamily: "Promt",
                                                fontSize: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              'วันที่ : ${data['datetime'] is Timestamp ? DateFormat('dd-MM-yyyy').format((data['datetime'] as Timestamp).toDate()) : ''}',
                                              style: const TextStyle(
                                                fontFamily: "Promt",
                                                fontSize: 13,
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                              ),
                                            ),
                                            Text(
                                              'เวลา : ${data['datetime'] is Timestamp ? DateFormat('HH:mm').format((data['datetime'] as Timestamp).toDate()) : ''} น.',
                                              style: const TextStyle(
                                                fontFamily: "Promt",
                                                fontSize: 13,
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                              ),
                                            ),
                                            Text(
                                              'สถานที่ : ${data['location'] ?? ''}',
                                              style: const TextStyle(
                                                fontFamily: "Promt",
                                                fontSize: 13,
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                              ),
                                            ),
                                            Text(
                                              'รายละเอียด : ${data['detail'] ?? ''}',
                                              style: const TextStyle(
                                                fontFamily: "Promt",
                                                fontSize: 13,
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: IconButton(
                                          onPressed: () {
                                            _deleteData(document.id);
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                            size: 24,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          );
                        },
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

  void _deleteData(String documentId) {
    FirebaseFirestore.instance
        .collection('activity')
        .doc(documentId)
        .delete()
        .then((value) {
      print("รายการถูกลบแล้ว");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("รายการถูกลบแล้ว"),
        ),
      );
    }).catchError((error) {
      print("เกิดข้อผิดพลาดในการลบ: $error");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("เกิดข้อผิดพลาดในการลบ"),
        ),
      );
    });
  }
}
