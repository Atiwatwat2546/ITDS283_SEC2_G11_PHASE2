import 'package:flutter/material.dart';
import 'package:project/aboutus_page.dart';
import 'package:project/addwork_page.dart';
import 'package:project/first_page.dart';
import 'package:project/register.dart';
import 'package:project/report_page.dart';
import 'package:project/setting_page.dart';
import 'package:project/todo_page.dart';
import 'package:project/login_page.dart'; // Import your login page file here


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => FirstPage(), // หน้าแรกของแอป
        '/login': (context) => LoginPage(), // หน้าเข้าสู่ระบบ
        '/register': (context) => RegistrationPage(), // หน้าลงทะเบียน
        '/home': (context) => TodoPage(), // หน้ารายการทำ
        '/setting' :(context) => SettingPage(),
        '/aboutus':(context) => AboutusPage(),
        '/addwork':(context) => AddworkPage(),
        '/report':(context) => ReportPage(),

      },
    );
  }
}
