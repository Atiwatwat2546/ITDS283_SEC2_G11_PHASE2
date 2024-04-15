import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Todo Page',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: TodoPage(),
  ));
}

class TodoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var key = null;
    var key2 = null;
    var key3 = null;
    var key4 = null;
    var key5 = null;
    var key6 = null;
    var key7 = null;
    var key8 = null;
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
                Expanded(
                  child: Text(
                    'ข้อมูลส่วนตัว',
                    style: TextStyle(
                      fontFamily: "Promt",
                      fontSize: 25,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 40,
                ),
              ],
            ),
          ],
        ),
        elevation: 0,
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
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
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
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Color.fromARGB(255, 129, 90, 246),
                        child: Icon(
                          Icons.person,
                          color: const Color.fromARGB(255, 0, 0, 0),
                          size: 60,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      SizedBox(height: 10.0),
                      // ช่องกรอกข้อมูลและปุ่มแก้ไขข้อมูล
                      EditableField(
                        labelText: 'ชื่อ',
                        initialValue: 'John Doe', // ค่าเริ่มต้น
                        onChanged: (value) {
                          // โค้ดสำหรับการอัพเดตข้อมูล
                          print('ชื่อ: $value');
                        }, key: key2,
                      ),
                      SizedBox(height: 10.0),
                      EditableField(
                        labelText: 'วันเกิด',
                        initialValue: '01/01/2000', // ค่าเริ่มต้น
                        onChanged: (value) {
                          // โค้ดสำหรับการอัพเดตข้อมูล
                          print('วันเกิด: $value');
                        }, key: key,
                      ),
                      SizedBox(height: 10.0),
                      EditableField(
                        labelText: 'เพศ',
                        initialValue: 'ชาย', // ค่าเริ่มต้น
                        onChanged: (value) {
                          // โค้ดสำหรับการอัพเดตข้อมูล
                          print('เพศ: $value');
                        }, key: key3,
                      ),
                      SizedBox(height: 10.0),
                      EditableField(
                        labelText: 'อายุ',
                        initialValue: '30', // ค่าเริ่มต้น
                        onChanged: (value) {
                          // โค้ดสำหรับการอัพเดตข้อมูล
                          print('อายุ: $value');
                        }, key: key4,
                      ),
                      SizedBox(height: 10.0),
                      EditableField(
                        labelText: 'อาชีพ',
                        initialValue: 'Developer', // ค่าเริ่มต้น
                        onChanged: (value) {
                          // โค้ดสำหรับการอัพเดตข้อมูล
                          print('อาชีพ: $value');
                        }, key: key5,
                      ),
                      SizedBox(height: 10.0),
                      EditableField(
                        labelText: 'ที่อยู่',
                        initialValue: '123 Main Street', // ค่าเริ่มต้น
                        onChanged: (value) {
                          // โค้ดสำหรับการอัพเดตข้อมูล
                          print('ที่อยู่: $value');
                        }, key: key6,
                      ),
                      SizedBox(height: 10.0),
                      EditableField(
                        labelText: 'อีเมล',
                        initialValue: 'john.doe@example.com', // ค่าเริ่มต้น
                        onChanged: (value) {
                          // โค้ดสำหรับการอัพเดตข้อมูล
                          print('อีเมล: $value');
                        }, key: key7,
                      ),
                      SizedBox(height: 10.0),
                      EditableField(
                        labelText: 'เบอร์โทร',
                        initialValue: '123-456-7890', // ค่าเริ่มต้น
                        onChanged: (value) {
                          // โค้ดสำหรับการอัพเดตข้อมูล
                          print('เบอร์โทร: $value');
                        }, key: key8,
                      ),
                    ]),
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

// Widget สำหรับช่องกรอกข้อมูลและปุ่มแก้ไขข้อมูล
class EditableField extends StatefulWidget {
  final String labelText;
  final String initialValue;
  final Function(String) onChanged;

  const EditableField({
    required Key key,
    required this.labelText,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  _EditableFieldState createState() => _EditableFieldState();
}

class _EditableFieldState extends State<EditableField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              var key = null;
              return EditFieldScreen(
              initialValue: widget.initialValue, key: key,
            );
            },
          ),
        );
        if (result != null) {
          setState(() {
            _controller.text = result;
            widget.onChanged(result);
          });
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '${widget.labelText} : ${_controller.text}',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Promt',
              fontSize: 16,
            ),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 117, 150, 217),
        minimumSize: Size(double.infinity, 55),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class EditFieldScreen extends StatefulWidget {
  final String initialValue;

  const EditFieldScreen({required Key key, required this.initialValue}) : super(key: key);

  @override
  _EditFieldScreenState createState() => _EditFieldScreenState();
}

class _EditFieldScreenState extends State<EditFieldScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Field'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Edit ${widget.initialValue}',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, _controller.text);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
