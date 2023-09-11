import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/Screen/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topLeft,
              children: [
                // ส่วนรูปภาพโปรไฟล์
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      child: Center(
                        child: CircleAvatar(
                          radius: 80,
                          backgroundImage: NetworkImage(
                              'https://scontent-sin6-2.xx.fbcdn.net/v/t39.30808-6/308872634_616048150111752_3628626420771260878_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=a2f6c7&_nc_ohc=YYon9swwLu0AX88ob0k&_nc_ht=scontent-sin6-2.xx&oh=00_AfCDeeFUtvSio86n8UiLWAe7dQYBTtuCHXerOE0JFnUOUQ&oe=6503018F'),
                        ),
                      ),
                    ),
                    SizedBox(width: 10), // ระยะห่างระหว่างส่วนรูปภาพและข้อความ
                    // ส่วนของข้อความและกล่องข้อมูล
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ข้อความ @may_ihealthyou
                          Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              '@may_ihealthyou',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                              height:
                                  20), // ระยะห่างระหว่างข้อความและกล่องข้อมูล
                          // กล่องข้อมูล
                          Container(
                            padding: EdgeInsets.all(16),
                            color: Color.fromARGB(255, 255, 183, 216), // เปลี่ยนสีพื้นหลังกล่องข้อมูลตามต้องการ
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'หมอเมย์ พญ.เมชฌวิกาศ์ อารยางกูร',
                                  style: TextStyle(fontSize: 14),
                                ),
                                Text(
                                  'แพทย์ศาตร์บัณฑิตคณะแพทย์ศาตร์ศิริราชพยาบาล มหาวิทยาลัยมหิดล',
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  'ปัจจุบัน หมอปฏิบัติงานในฐาน',
                                  style: TextStyle(fontSize: 14),
                                ),
                                SizedBox(
                                    height:
                                        8), // ระยะห่างระหว่างข้อความและรูปภาพเล็กๆ
                                Row(
                                  children: [
                                    Icon(Icons.star,
                                        color: Color.fromARGB(255, 255, 96, 178), size: 20),
                                    Icon(Icons.star,
                                        color: Color.fromARGB(255, 255, 135, 225), size: 20),
                                    Icon(Icons.star,
                                        color: Color.fromARGB(255, 249, 184, 234), size: 20),
                                    Icon(Icons.star,
                                        color: Color.fromARGB(255, 251, 211, 241), size: 20),
                                    Icon(Icons.star_border,
                                        color: Color.fromARGB(255, 255, 226, 246), size: 20),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // ลูกศรกลับไปหน้าถัดไป
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                    },
                  ),
                ),
              ],
            ),

            // กล่องข้อความถึงหมอ
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.white, // เปลี่ยนสีพื้นหลังกล่องข้อความตามต้องการ
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'หมอเมย์ Dr.May',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                      height:
                          8), // เพิ่มระยะห่างระหว่างข้อความ "หมอเมย์ Dr.May" และกล่องข้อความใต้
                  Container(
                    padding: EdgeInsets.all(5),
                    color:
                        Colors.white, // เปลี่ยนสีพื้นหลังกล่องข้อความตามต้องการ
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ความรู้สุขภาพ วิตามินอาหารเสริม จากหมอฉะลอวัย',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      height:
                          0), // เพิ่มระยะห่างระหว่างข้อความ "หมอเมย์ Dr.May" และกล่องข้อความใต้
                  Container(
                    padding: EdgeInsets.all(5),
                    color:
                        Colors.white, // เปลี่ยนสีพื้นหลังกล่องข้อความตามต้องการ
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'แจกสูตรอาหารคลีน ทำเองได้',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 242, 207, 207),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'ส่งข้อความของคุณเพื่อคุยกับหมอ',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // ใส่โค้ดส่งข้อความของคุณที่นี่
                          },
                          child: Text(
                            'ส่ง',
                            style: TextStyle(
                              color: Color.fromARGB(255, 252, 203, 225),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
