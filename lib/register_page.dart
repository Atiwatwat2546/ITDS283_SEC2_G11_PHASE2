import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:project/model/profile.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Register Page',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: RegistrationPage(),
  ));
}

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

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
                          'สมัครสมาชิก',
                          style: TextStyle(
                            fontFamily: "Promt",
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'สมัครสมาชิกเพื่อเข้าสู่ระบบของคุณ',
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
                              backgroundColor:
                                  Color.fromARGB(255, 129, 90, 246),
                              child: Icon(
                                Icons.person,
                                color: const Color.fromARGB(255, 0, 0, 0),
                                size: 50,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'ชื่อ',
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
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'โปรดป้อนชื่อ';
                                }
                                return null;
                              },
                              onSaved: (name) {
                                profile.name = name;
                              },
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
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'รหัสผ่าน',
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
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    // Toggle password visibility
                                  },
                                  child: Icon(
                                    Icons.visibility,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'โปรดป้อนรหัสผ่าน';
                                }
                                // Add password validation logic if necessary
                                return null;
                              },
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
                                      "name = ${profile.name} email = ${profile.email} password = ${profile.password}");

                                  try {
                                    await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                            email: profile.email!,
                                            password: profile.password!);
                                    formKey.currentState!.reset();
                                  } on FirebaseAuthException catch (e) {
                                    print(e.message);
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
                                'สมัครสมาชิก',
                                style: TextStyle(
                                  fontFamily: "Promt",
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
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
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
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
        });
  }
}
