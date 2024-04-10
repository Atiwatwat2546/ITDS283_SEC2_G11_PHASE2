import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _tasks = ['กวาดบ้าน', 'ล้างจาน', 'เตะบอล'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(45, 74, 134, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(45, 74, 134, 1),
        title: Text('สิ่งที่ต้องทำ'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          // Container สำหรับช่องค้นหา
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(26, 27, 63, 1),
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(30.0),
            ),
            padding: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'ค้นหา...',
                border: InputBorder.none,
              ),
            ),
          ),

          // เพิ่ม FloatingActionButton สำหรับปุ่มเพิ่ม TO-DO
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // จัดปุ่มชิดขวา
            children: <Widget>[
              FloatingActionButton(
                backgroundColor: Color.fromRGBO(26, 27, 63, 1), // สีเดียวกับกล่องค้นหา
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), // มุมโค้งมน
                ),
                onPressed: () {
                  // เพิ่ม TO-DO ใหม่
                },
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add),
                    SizedBox(width: 8.0), // ขยายระยะห่างระหว่างไอคอนและข้อความ
                    Text(
                      'เพิ่มงาน',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0), // ปรับขนาดตัวอักษร
                    ),
                  ],
                ),
              ),
            ],
          ),

          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(_tasks[index]),
                    subtitle: Text('29 สิงหาคม 2546'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
