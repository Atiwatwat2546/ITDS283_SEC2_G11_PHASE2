import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/first_page.dart';
import 'package:project/register.dart';
import 'package:project/todo_page.dart';
import 'package:project/login_page.dart'; // Import your login page file here

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'PW TO-DO APP',
      
      routerDelegate: GoRouter(
        initialLocation: '/FirstPage', // กำหนดเส้นทางเริ่มต้นเป็น '/firstPage'
        // Define your routes here
        routes: [
          GoRoute(path: '/FirstPage', builder: (context, state) => FirstPage()),
          GoRoute(path: '/LoginPage', builder: (context, state) => LoginPage()),
          GoRoute(
              path: '/RegisterPage',
              builder: (context, state) => RegistrationPage()),
          GoRoute(
            path: '/TodoPage',
            builder: (context, state) => TodoPage(),
          )
        ],
      ).routerDelegate,
      routeInformationParser: GoRouter(
        // Define your routes here (same as above)
        routes: [
          // Define your routes mappings here (same as above)
        ],
      ).routeInformationParser,
    );
  }
}
