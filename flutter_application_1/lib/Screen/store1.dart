import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/Screen/datapage.dart';


class ProductDetailPage extends StatelessWidget {
  static const routeName = "/Store";
  final Product store1;

  ProductDetailPage({required this.store1});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(store1.name),
        backgroundColor: Color.fromARGB(255, 242, 161, 177),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              store1.imageUrl,
              height: 500,
              width: 500,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 50),
            Text(
              store1.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 80),
            Text(
              store1.description,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20), // เพิ่มระยะห่างระหว่างข้อความและปุ่ม
            ElevatedButton(
              onPressed: () {
                // คุณสามารถใส่โค้ดที่คุณต้องการในปุ่มนี้
                // เช่น เพิ่มสินค้าลงตะกร้าหรือดำเนินการอื่น ๆ
              },
              child: Text('ปุ่มตัวอย่าง'),
            ),
          ],
        ),
      ),
    );
  }
}





