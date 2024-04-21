import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:PW/Profile_page.dart';
import 'package:PW/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const EditProfilePage());
}

class Userinfo {
  final String name;
  final String birthday;
  final String sex;
  final String age;
  final String job;
  final String address;
  final String phone;

  Userinfo({
    required this.name,
    required this.birthday,
    required this.sex,
    required this.age,
    required this.job,
    required this.address,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'birthday': birthday,
      'sex': sex,
      'age': age,
      'job': job,
      'address': address,
      'phone': phone,
    };
  }
}

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edit Profile',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyWidget(title: 'Profile'),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyWidget> createState() => _MyWidgetState();

  static _MyWidgetState? of(BuildContext context) {
    return context.findAncestorStateOfType<_MyWidgetState>();
  }
}

class _MyWidgetState extends State<MyWidget> {
  File? _image;

  final picker = ImagePicker();
  late String _currentUserUID;
  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _getCurrentUserUID();
      });

      // Upload image to Firebase Storage
      Reference ref = FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child('$_currentUserUID.jpg'); // ใช้ UID ของผู้ใช้เป็นชื่อไฟล์
      UploadTask uploadTask = ref.putFile(_image!);
      TaskSnapshot taskSnapshot = await uploadTask;
      String imageUrl = await taskSnapshot.ref.getDownloadURL();

      // Update user's profile image URL in Firestore
      await FirebaseFirestore.instance
          .collection('user')
          .doc(_currentUserUID)
          .update({'profile_image': imageUrl});
    } else {
      print('No image selected.');
    }
  }

  void _getCurrentUserUID() {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      setState(() {
        _currentUserUID = uid;
      });
    } else {
      print('ไม่พบผู้ใช้ที่ล็อกอินอยู่');
    }
  } 

  final auth = FirebaseAuth.instance;
  User? currentUser = FirebaseAuth.instance.currentUser;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController sexController = TextEditingController();
  final TextEditingController jobController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  void saveDataToFirebase(BuildContext context) async {
    final CollectionReference userCollection =
        FirebaseFirestore.instance.collection('user');

    var userDoc = await userCollection.doc(currentUser!.uid).get();

    if (userDoc.exists) {
      Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;

      userData['name'] = nameController.text.isNotEmpty
          ? nameController.text
          : userData['name'];
      userData['birthday'] = birthdayController.text.isNotEmpty
          ? birthdayController.text
          : userData['birthday'];
      userData['age'] =
          ageController.text.isNotEmpty ? ageController.text : userData['age'];
      userData['sex'] =
          sexController.text.isNotEmpty ? sexController.text : userData['sex'];
      userData['job'] =
          jobController.text.isNotEmpty ? jobController.text : userData['job'];
      userData['address'] = addressController.text.isNotEmpty
          ? addressController.text
          : userData['address'];
      userData['phone'] = phoneController.text.isNotEmpty
          ? phoneController.text
          : userData['phone'];

      try {
        await userCollection.doc(currentUser!.uid).update(userData);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('อัปเดตข้อมูลสำเร็จ'),
            duration: Duration(seconds: 2),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('การอัปเดตข้อมูลล้มเหลว'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } else {
      Userinfo userInfo = Userinfo(
        name: nameController.text,
        birthday: birthdayController.text,
        age: ageController.text,
        sex: sexController.text,
        job: jobController.text,
        address: addressController.text,
        phone: phoneController.text,
      );

      try {
        await userCollection.doc(currentUser!.uid).set(userInfo.toMap());

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('บันทึกข้อมูลสำเร็จ'),
            duration: Duration(seconds: 2),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('การบันทึกข้อมูลล้มเหลว'),
            duration: Duration(seconds: 2),
          ),
        );
      }
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
                  'Edit Profile',
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
      body: SingleChildScrollView(
        child: Stack(
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
                      color:
                          const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 0,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          getImage();
                        },
                        child: CircleAvatar(
                            radius: 60,
                            backgroundColor: Color.fromARGB(255, 183, 160, 255),
                            child: _image != null
                                ? ClipOval(
                                    child: Image.file(
                                      _image!,
                                      fit: BoxFit.cover,
                                      width: 125,
                                      height: 125,
                                    ),
                                  )
                                : Icon(Icons
                                    .camera_alt) // ปรับให้แสดงไอคอนกล้องเมื่อไม่มีรูป
                            ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              'ชื่อ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Promt-SemiBold",
                              ),
                            ),
                          ),
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
                              hintText: 'ป้อนชื่อของคุณ',
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
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: Text(
                                        'วันเกิด',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Promt-SemiBold",
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      controller: birthdayController,
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
                                        hintText: 'ป้อนวันเกิดของคุณ',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                          ),
                                        ),
                                        filled: true,
                                        fillColor:
                                            Color.fromARGB(255, 120, 154, 228),
                                        hintStyle: TextStyle(
                                          fontFamily: 'Promt-Thin',
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              255, 206, 206, 206),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 20), // เพิ่มระยะห่างระหว่างกล่อง
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: Text(
                                        'อายุ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Promt-SemiBold",
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      controller: ageController,
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
                                        hintText: 'ป้อนอายุของคุณ',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                          ),
                                        ),
                                        filled: true,
                                        fillColor:
                                            Color.fromARGB(255, 120, 154, 228),
                                        hintStyle: TextStyle(
                                          fontFamily: 'Promt-Thin',
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              255, 206, 206, 206),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              'เพศ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Promt-SemiBold",
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: sexController,
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
                              hintText: 'ป้อนเพศของคุณ',
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
                              'อาชีพ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Promt-SemiBold",
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: jobController,
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
                              hintText: 'ป้อนอาชีพของคุณ',
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
                              'ที่อยู่',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Promt-SemiBold",
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: addressController,
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
                              hintText: 'ป้อนที่อยู่ของคุณ',
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
                              'เบอร์โทร',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Promt-SemiBold",
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: phoneController,
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
                              hintText: 'ป้อนเบอร์โทรของคุณ',
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
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    // สร้าง Userinfo object จากข้อมูลที่ผู้ใช้กรอก

                                    // บันทึกข้อมูลไปยัง Firestore
                                    saveDataToFirebase(context);
                                    // พาผู้ใช้กลับไปยังหน้าโปรไฟล์
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return ProfileShow();
                                    }));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 131, 193, 81),
                                    padding: EdgeInsets.symmetric(vertical: 14),
                                  ),
                                  child: Text(
                                    'บันทึก',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(width: 16), // เพิ่มระยะห่างระหว่างปุ่ม
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return ProfileShow();
                                    }));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 177, 67, 67),
                                    padding: EdgeInsets.symmetric(vertical: 14),
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
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildTextField({
  required TextEditingController controller,
  required String hintText,
}) {
  return TextFormField(
    controller: controller,
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
      hintText: hintText,
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
  );
}

Widget buildColumnTextField({
  required TextEditingController controller,
  required String labelText,
  required String hintText,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Text(
          labelText,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: "Promt-SemiBold",
          ),
        ),
      ),
      SizedBox(height: 10),
      buildTextField(controller: controller, hintText: hintText),
    ],
  );
}
