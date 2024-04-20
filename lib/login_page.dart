import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:project/model/profile.dart';
import 'package:project/register_page.dart';
import 'package:project/todo_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Login Page',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: LoginPage(),
  ));
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: firebase,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Error"),
            ),
            body: Center(
              child: Text("${snapshot.error}"),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              toolbarHeight: 150,
              backgroundColor: Color.fromARGB(255, 49, 60, 128),
              title: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'เข้าสู่ระบบ',
                        style: TextStyle(
                          fontFamily: "Promt",
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'ลงชื่อเพื่อเข้าสู่ระบบของคุณ',
                        style: TextStyle(
                          fontFamily: "Promt",
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              elevation: 0,
            ),
            backgroundColor: Color.fromARGB(255, 49, 60, 128),
            body: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 237, 237, 237),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45.0),
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
                  padding: const EdgeInsets.all(25.0),
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Color.fromARGB(255, 129, 90, 246),
                            child: Icon(
                              Icons.person,
                              color: const Color.fromARGB(255, 0, 0, 0),
                              size: 50,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'อีเมล',
                              labelStyle: TextStyle(
                                fontFamily: "Prompt-Thin.ttf",
                                color: Color.fromARGB(255, 133, 133, 133),
                              ),
                              contentPadding:
                                  EdgeInsets.only(left: 20.0, bottom: 30),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Color.fromARGB(255, 206, 206, 206),
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "โปรดป้อนอีเมล"),
                              EmailValidator(
                                  errorText: "รูปแบบอีเมลไม่ถูกต้อง"),
                            ]),
                            // Save logic for the field
                            onSaved: (email) {
                              profile.email = email;
                            },
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            obscureText:
                                _obscureText, // ใช้ตัวแปร _obscureText เพื่อกำหนดสถานะการแสดงหรือซ่อนรหัสผ่าน
                            decoration: InputDecoration(
                              labelText: 'รหัสผ่าน', // กำหนดข้อความใน Label
                              labelStyle: TextStyle(
                                fontFamily: "Prompt-Thin.ttf",
                                color: Color.fromARGB(255, 133, 133, 133),
                              ),
                              contentPadding:
                                  EdgeInsets.only(left: 20.0, bottom: 30),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Color.fromARGB(255, 206, 206, 206),
                              // ใช้ GestureDetector เพื่อให้ไอคอนตาเปิดและปิดเมื่อถูกแตะ
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText =
                                        !_obscureText; // สลับสถานะการแสดงหรือซ่อนรหัสผ่านเมื่อไอคอนตาถูกแตะ
                                  });
                                },
                                child: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons
                                          .visibility_off, // เลือกไอคอนตาตามสถานะการแสดงหรือซ่อนรหัสผ่าน
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "โปรดป้อนรหัสผ่าน"),
                            ]),
                            // Save logic for the field
                            onSaved: (password) {
                              profile.password = password;
                            },
                          ),
                          SizedBox(height: 10.0),
                          ElevatedButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                print(
                                    "email = ${profile.email} password = ${profile.password}");
                                try {
                                  await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: profile.email!,
                                          password: profile.password!)
                                      .then((value) {
                                    formKey.currentState!.reset();
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return TodoPage();
                                    }));
                                  });
                                } on FirebaseAuthException catch (e) {
                                  print(e.code);
                                  print(e.message);
                                  String message;
                                  if (e.code == 'invalid-credential') {
                                    message = "อีเมล หรือ รหัสผ่านไม่ถูกต้อง";
                                  } else {
                                    message = e
                                        .message!; // ใช้ข้อความข้อผิดพลาดที่ส่งกลับจาก Firebase
                                  }
                                  Fluttertoast.showToast(
                                    msg: message,
                                    gravity: ToastGravity.CENTER,
                                  );
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 49, 60, 128),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 7),
                            ),
                            child: Text(
                              'เข้าสู่ระบบ',
                              style: TextStyle(
                                fontFamily: "Promt",
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          SizedBox(height: 16.0),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return RegistrationPage();
                              }));
                            },
                            child: Text(
                              'สมัครสมาชิก',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Promt-Thin',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            ' หรือ ',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Promt-Thin",
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 16.0),
                          ElevatedButton(
                            onPressed: () {
                              // โค้ดสำหรับการสมัครสมาชิก
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(
                                  255, 255, 255, 255), // สีพื้นหลังของปุ่ม
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ), // ปรับขนาดของปุ่ม
                              elevation: 5, // ระดับของเงา
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/google_logo.png',
                                      width: 35, // ขนาดของโลโก้ Facebook
                                      height: 35,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left:
                                          20), // ขยับข้อความไปทางขวาจากโลโก้ Facebook
                                  child: Text(
                                    'ดำเนินการโดย Google',
                                    style: TextStyle(
                                      fontFamily: "Promt-Thin",
                                      fontWeight: FontWeight.w800,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    ), // ลูกศรชี้ไปทางขวา
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16.0),
                          ElevatedButton(
                            onPressed: () {
                              // โค้ดสำหรับการสมัครสมาชิก
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(
                                  255, 255, 255, 255), // สีพื้นหลังของปุ่ม
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ), // ปรับขนาดของปุ่ม
                              elevation: 5, // ระดับของเงา
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/facebook_logo.png',
                                      width: 35, // ขนาดของโลโก้ Facebook
                                      height: 35,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                  ), // ขยับข้อความไปทางขวาจากโลโก้ Facebook
                                  child: Text(
                                    'ดำเนินการโดย Facebook',
                                    style: TextStyle(
                                      fontFamily: "Promt-Thin",
                                      fontWeight: FontWeight.w800,
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ), // ลูกศรชี้ไปทางขวา
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
