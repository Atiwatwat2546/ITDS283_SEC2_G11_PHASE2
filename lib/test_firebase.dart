import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart'; // Assuming this is the name of your configuration file

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add Work',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Add Work'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// ในส่วนของ _MyHomePageState class

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  DateTime? selectedDate;
  final TextEditingController timeController = TextEditingController();
  DateTime? selectTime;
  final TextEditingController locationController = TextEditingController();
  final TextEditingController detailController = TextEditingController();
  // Function to create user data
  void createUser(
      {required String name,
      required DateTime date,
      required DateTime time,
      required String location,
      required String detail}) async {
    // Collection reference
    final CollectionReference activity =
        FirebaseFirestore.instance.collection('users');

    try {
      // Add document
      await activity.add({
        'name': name,
        'date': date,
        'time': time,
        'location': location,
        'detail': detail,
      });

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('User $name created successfully'),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (e) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to create user: $e'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

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
                  'เพิ่มงาน',
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
                left: 20,
                right: 20,
                top: 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0), // กำหนดระยะห่างด้านซ้ายของข้อความ
                      child: Text(
                        'ชื่อกิจกรรม',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Promt-SemiBold",
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    TextFormField(
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
                        hintText: 'ป้อนชื่อกิจกรรม',
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
                    SizedBox(height: 20),
                    // TextButton(
                    //   onPressed: () {
                    //     showDatePicker(
                    //       context: context,
                    //       initialDate: DateTime.now(),
                    //       firstDate: DateTime(1900),
                    //       lastDate: DateTime.now(),
                    //     ).then((pickedDate) {

                    //     });
                    //   },
                    //   child: Text('Select Birthday'),
                    // ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              // โค้ดสำหรับเลือกวันที่
                              final DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2022),
                                lastDate: DateTime(2030),
                              );
                              if (pickedDate != null &&
                                  pickedDate != selectedDate) {
                                setState(() {
                                  selectedDate = pickedDate;
                                });
                              }
                            },
                            child: Text(
                              'เลือกวันที่',
                              style: TextStyle(
                                fontFamily: "Promt-SemiBold",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              // โค้ดสำหรับเลือกเวลา
                              final TimeOfDay? pickedTime =
                                  await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              if (pickedTime != null) {
                                final DateTime now = DateTime.now();
                                final DateTime selectedDateTime = DateTime(
                                  now.year,
                                  now.month,
                                  now.day,
                                  pickedTime.hour,
                                  pickedTime.minute,
                                );
                                setState(() {
                                  selectTime = selectedDateTime;
                                });
                              }
                            },
                            child: Text(
                              'เลือกเวลา',
                              style: TextStyle(
                                fontFamily: "Promt-SemiBold",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0), // กำหนดระยะห่างด้านซ้ายของข้อความ
                      child: Text(
                        'ที่อยู่',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Promt-SemiBold",
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    TextFormField(
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
                        hintText: 'ป้อนทีอยู่',
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
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0), // กำหนดระยะห่างด้านซ้ายของข้อความ
                      child: Text(
                        'รายละเอียด',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Promt-SemiBold",
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    TextFormField(
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
                        hintText: 'ป้อนรายละเอียด',
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
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // ตรวจสอบว่ามีข้อมูลทั้งหมดถูกกรอกหรือไม่
                              if (nameController.text.isNotEmpty &&
                                  selectedDate != null &&
                                  selectTime != null &&
                                  locationController.text.isNotEmpty &&
                                  detailController.text.isNotEmpty) {
                                // เรียกใช้งานฟังก์ชัน createUser() เพื่อสร้างข้อมูลใน Firebase Firestore
                                createUser(
                                  name: nameController.text,
                                  date: selectedDate!,
                                  time: selectTime!,
                                  location: locationController.text,
                                  detail: detailController.text,
                                );

                                // ล้างข้อมูลในช่องทั้งหมดหลังจากบันทึก
                                nameController.clear();
                                dateController.clear();
                                timeController.clear();
                                locationController.clear();
                                detailController.clear();

                                // ล้างข้อมูลที่เกี่ยวข้องใน state
                                setState(() {
                                  selectedDate = null;
                                  selectTime = null;
                                });
                              } else {
                                // แสดงข้อความแจ้งเตือนให้กรอกข้อมูลให้ครบถ้วน
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('กรุณากรอกข้อมูลให้ครบถ้วน'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 131, 193, 81)),
                            child: Text(
                              'บันทึก',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // โค้ดสำหรับยกเลิก
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 177, 67, 67),
                            ),
                            child: Text(
                              'ยกเลิก',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
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
                          Navigator.pushNamed(context, '/todo');
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
