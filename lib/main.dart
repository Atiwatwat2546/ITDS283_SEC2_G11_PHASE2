import 'package:flutter/material.dart';
import 'package:project/first_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PW TO-DO APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => FirstPage(), // หน้าแรกของแอป
      //   '/login': (context) => LoginPage(), // หน้าเข้าสู่ระบบ
      //   '/register': (context) => RegistrationPage(), // หน้าลงทะเบียน
      //   '/home': (context) => TodoPage(), // หน้ารายการทำ
      //   '/setting' :(context) => SettingPage(),
      //   '/aboutus':(context) => AboutusPage(),
      //   '/addwork':(context) => AddworkPage(),
      //   '/report':(context) => ReportPage(),
      // },
    );
  }
}
