import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/firebase_options.dart';
import 'package:project/model/activity.dart';
import 'package:project/todo_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const AddworkPage());
}

class AddworkPage extends StatelessWidget {
  const AddworkPage({Key? key}) : super(key: key);

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

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController detailController = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  void saveDataToFirebase(BuildContext context, Activity activity) async {
  final CollectionReference activityCollection =
      FirebaseFirestore.instance.collection('activity');

  try {
    await activityCollection.add(activity.toMap());

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('กิจกรรม "${activity.name}" ถูกสร้างเรียบร้อยแล้ว'),
        duration: Duration(seconds: 2),
      ),
    );

    // เมื่อบันทึกข้อมูลเรียบร้อยแล้ว ทำการเปลี่ยนหน้าไปยัง TodoPage()
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return TodoPage();
    }));
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('การสร้างกิจกรรม "${activity.name}" ล้มเหลว: $e'),
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
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        'ชื่อเรื่อง',
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
                      controller: nameController,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 15.0,
                        ),
                        hintText: 'ป้อนชื่อกิจกรรม',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
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
                            onPressed: () async {
                              final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                              );
                              if (picked != null) {
                                setState(() {
                                  selectedDate = picked;
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(
                                  255, 120, 154, 228), // สีพื้นหลังของปุ่ม
                            ),
                            child: Text(
                              selectedDate == null
                                  ? 'เลือกวันที่'
                                  : DateFormat('yyyy-MM-dd')
                                      .format(selectedDate!),
                              style: TextStyle(
                                  fontFamily: "Promt-SemiBold",
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              final TimeOfDay? picked = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              if (picked != null) {
                                setState(() {
                                  selectedTime = picked;
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(
                                  255, 120, 154, 228), // สีพื้นหลังของปุ่ม
                            ),
                            child: Text(
                              selectedTime == null
                                  ? 'เลือกเวลา'
                                  : selectedTime!.format(context),
                              style: TextStyle(
                                  fontFamily: "Promt-SemiBold",
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
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
                      controller: locationController,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 15.0,
                        ),
                        hintText: 'ป้อนทีอยู่',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
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
                      padding: const EdgeInsets.only(left: 20.0),
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
                      controller: detailController,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 15.0,
                        ),
                        hintText: 'ป้อนรายละเอียด',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
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
                              final Timestamp datetimeTimestamp =
                                  Timestamp.fromDate(DateTime(
                                selectedDate!.year,
                                selectedDate!.month,
                                selectedDate!.day,
                                selectedTime!.hour,
                                selectedTime!.minute,
                              ));

                              Activity newActivity = Activity(
                                name: nameController.text,
                                datetime: datetimeTimestamp,
                                location: locationController.text.isNotEmpty
                                    ? locationController.text
                                    : '',
                                detail: detailController.text.isNotEmpty
                                    ? detailController.text
                                    : '',
                              );

                              saveDataToFirebase(context, newActivity);

                              // ล้างข้อมูลและข้อความ
                              nameController.clear();
                              locationController.clear();
                              detailController.clear();
                              setState(() {
                                selectedDate = null;
                                selectedTime = null;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 131, 193, 81),
                            ),
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
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return TodoPage();
                              }));
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
        ],
      ),
    );
  }
}
