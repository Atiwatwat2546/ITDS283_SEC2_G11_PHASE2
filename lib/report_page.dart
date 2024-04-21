import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:PW/todo_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ReportPage());
}

class ReportPage extends StatelessWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Report',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Report'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController problemController = TextEditingController();
  final TextEditingController guidenesController = TextEditingController();

  void saveDataToFirebase({
    String? problem,
    String? guidelines,
  }) async {
    // Collection reference
    final CollectionReference users =
        FirebaseFirestore.instance.collection('report');

    try {
      // Add document
      await users.add({
        'problem': problem,
        'guidelines': guidelines,
      });

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('แจ้งปัญหาสำเร็จ'),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (e) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('แจ้งปัญห่ไม่สำเร็จ'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

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
                  'รายงานปัญหา',
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
                      'ปัญหาที่ผู้ใช้พบ :',
                      style: TextStyle(
                        fontFamily: 'Promt-Medium',
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: problemController,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 15.0), // ปรับขนาดของช่องข้อความ
                        hintText: 'ระบุปัญหาที่พบ',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(255, 120, 154, 228),
                        hintStyle: TextStyle(
                          fontFamily: 'Promt-Thin',
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 206, 206, 206),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Text(
                      'เราจะปรับปรุงให้ดีขึ้นได้อย่างไร :',
                      style: TextStyle(
                        fontFamily: 'Promt-Medium',
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: guidenesController,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 15.0), // ปรับขนาดของช่องข้อความ
                        hintText: 'กรอกความคิดเห็นเพิ่มเติม',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(255, 120, 154, 228),
                        hintStyle: TextStyle(
                          fontFamily: 'Promt-Thin',
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 206, 206, 206),
                        ),
                      ),
                    ),
                    SizedBox(height: 50.0),
                    ElevatedButton(
                      onPressed: () {
                        final String problem = problemController.text;
                        final String guidelines = guidenesController.text;

                        // ตรวจสอบว่ามีข้อมูลในช่องข้อความหรือไม่
                        if (problem.isEmpty && guidelines.isEmpty) {
                          // แสดง Snackbar เพื่อแจ้งเตือนผู้ใช้
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'กรุณาระบุปัญหาหรือความคิดเห็นเพิ่มเติม'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        } else {
                          // ถ้ามีข้อมูลในช่องข้อความทั้งคู่ให้บันทึกข้อมูล
                          saveDataToFirebase(
                            problem: problem,
                            guidelines: guidelines,
                          );

                          // ล้างข้อมูลในช่องข้อความ
                          problemController.clear();
                          guidenesController.clear();
                        }
                      },
                      child: Text(
                        'รายงานปัญหา',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Promt',
                          fontSize: 25,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 26, 27, 63),
                        minimumSize:
                            Size(double.infinity, 60), //กำหนดค.กว้าง/สูง
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
        ],
      ),
    );
  }
}
