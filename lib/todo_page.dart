import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/addwork_page.dart';
import 'package:project/setting_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(TODO());
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
      home: TodoPage(),
    );
  }
}

class TodoPage extends StatefulWidget {
  @override
  _TodoPageState createState() => _TodoPageState();
}

void _deleteData(String documentId, BuildContext context) {
  FirebaseFirestore.instance
      .collection('activity')
      .doc(documentId)
      .delete()
      .then((value) {
    print("รายการถูกลบแล้ว");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("รายการถูกลบแล้ว"),
      ),
    );
  }).catchError((error) {
    print("เกิดข้อผิดพลาดในการลบ: $error");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("เกิดข้อผิดพลาดในการลบ"),
      ),
    );
  });
}

class _TodoPageState extends State<TodoPage> {
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
                            .orderBy(
                                'datetime') // เรียงลำดับตาม datetime แทน date และ time
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
                                              data['name'] ?? '}',
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
                                            _deleteData(document.id, context);
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
            left: 160,
            bottom: 35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
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
                        return TodoPage();
                      }));
                    },
                    color: const Color.fromARGB(255, 255, 255, 255),
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
