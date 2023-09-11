import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/login.dart';
import 'package:http/http.dart';
import 'package:flutter_application_1/Screen/store1.dart';
import 'package:flutter_application_1/Screen/slidemenu.dart';
import 'package:flutter_application_1/Screen/home.dart';


void main() {
  runApp(MyApp());
}

class Product {
  final String name;
  final String description;
  final String imageUrl;

  Product({
    required this.name,
    required this.description,
    required this.imageUrl,
  });
}

class MyApp extends StatefulWidget {
  static const routeName = "/Datapage";
  const MyApp({super.key});
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Product> products = [
    Product(
      name: '3 ท่าลดขาเบียด',
      description: 'ลดต้นขาด้วยห่วงพิลาทิสการลดต้นขาด้านในให้เล็กลง',
      imageUrl:
          'https://scontent-sin6-4.xx.fbcdn.net/v/t1.15752-9/372296817_2395944803947690_1769258432913350211_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=ae9488&_nc_eui2=AeEfgf5REtj9o4G_jOWgDjYS7tvTw1B3DxLu29PDUHcPEsALmXqhSMGKI7rwlps2Mc71futMAPacqsSqjTcJLVbn&_nc_ohc=kUy2Gi4gelMAX-ySgZF&_nc_ht=scontent-sin6-4.xx&oh=03_AdRytPGLqxEWK_Y9FBwkYgc6K1J-Vc_O2tJeJ-2hCMhUsg&oe=65264B06',
    ),
    Product(
      name: 'มัดรวม 4 อาหารเสริมที่ใช่',
      description: 'คัดมาแล้ว ยิ่งทานร่วมกันยิ่งปัง ผิวเนียนนุ่มใสดูสุขภาพดี ริ้วรอยตื้นจุดด่างดำจางลงจริง 1.วิตามินซี blackmores 2.แคลเซียม Mega we care 3.แอสตาแซนธิน Bomi 4.คอลลาเจน Newway',
      imageUrl:
          'https://scontent-sin6-3.xx.fbcdn.net/v/t1.15752-9/371926604_288636540570569_4494400176883893747_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=ae9488&_nc_eui2=AeGCp3mCbioNOz8BOzDJqd1MMtcl3_rssIYy1yXf-uywhkT5Yk8HpSC3kQshCFOP2xYfQ_YU4yTqtCBE4s86hRaW&_nc_ohc=JnieIpD1feYAX9mXvUa&_nc_ht=scontent-sin6-3.xx&oh=03_AdSGk8aJPMEZI_JTU7GvDlQlkBJM6AS7LKuHvjUfeU2-rg&oe=65266C0C',
    ),
    Product(
      name: 'ทาครีมกันแดดยังไงให้ถูกวิธี',
      description: 'ทากันแดดให้ถูกวิธีเพื่อผลลัพธ์ที่ดีกว่า 1.ทาครีมกันแดดก่อนออกแดดประมาณ 15-30 นาที 2.บีบครีมให้ยาวประมาณ 2 ข้อนิ้วมือ 3.แต้มครีมกันแดด 5 จุดลงบนใบหน้า',
      imageUrl:
          'https://scontent-sin6-2.xx.fbcdn.net/v/t1.15752-9/373491721_1416904099040724_3264365175505978658_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=ae9488&_nc_eui2=AeEbhvg5WEnQpyRTQA7umBaTu1KYVOkgau27UphU6SBq7TbyW20-a9f4FjllPWQjxfV4WFmMQ3-qdcj3yf8_7-m4&_nc_ohc=H3td0NFrp3EAX8y_kOr&_nc_ht=scontent-sin6-2.xx&oh=03_AdR_8gO9Cf-b_Ij6F1zz2VNsgsFZ2YGYF1q1TZEWmMQUgQ&oe=6526674A',
    ),
    Product(
      name: 'รวม 9 เมนูข้าวกล่อง',
      description: 'เมนูข้าวกล่องที่น่าสนใจ ข้าวกล่องที่หลากหลาย สีสันน่าทาน คุณประโยชน์ครบถ้วน ทำให้การทานอาหารดูมีชีวิตชีวาขึ้น',
      imageUrl:
          'https://scontent.furt1-1.fna.fbcdn.net/v/t1.15752-9/375756253_330048992888580_7918506622591222786_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=ae9488&_nc_eui2=AeFHXjDiBrwvYQ-8rxCvPurJvn_7uQhCazq-f_u5CEJrOg9EnyRQZMqhqGqm-FVFdL7ymdMI8MiDNirTdNNv814l&_nc_ohc=-xB9fm00bU4AX-yCHGT&_nc_ht=scontent.furt1-1.fna&oh=03_AdQTJp0XS2Hqf4rKYDcJ1XKkCMeqNEMmddryO3sN7B1fxw&oe=65256CEA',
    ),
    // ไว้เพิ่มรายการสินค้า
  ];

  List<Product> filteredProducts = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('M Health'),
          leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
          backgroundColor: Color.fromARGB(255, 242, 161, 177),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 250, 228, 233),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        onChanged: (query) {
                          // ไว้เรียกใช้ฟังก์ชัน filterProducts ตอนที่มีการเปลี่ยนแปลงใน TextField
                          filterProducts(query);
                        },
                        decoration: InputDecoration(
                          hintText: 'ค้นหา...',
                          hintStyle: TextStyle(
                            color: const Color.fromARGB(255, 242, 161, 177),
                          ),
                          contentPadding: EdgeInsets.all(10),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 242, 161, 177),
                    ),
                    onPressed: () {
                      filterProducts('');
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ProductGrid(
                store1:
                    filteredProducts.isNotEmpty ? filteredProducts : products,
              ),
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 255, 241, 244),
      ),
    );
  }

  void filterProducts(String query) {
    setState(() {
      filteredProducts = products.where((product) {
        final productNameLower = product.name.toLowerCase();
        final queryLower = query.toLowerCase();
        return productNameLower.contains(queryLower);
      }).toList();
    });
  }
}

class ProductGrid extends StatelessWidget {
  final List<Product> store1;

  ProductGrid({required this.store1});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // จำนวนคอลัมน์ในกริด
        childAspectRatio: 0.6, // อัตราส่วนของกว้างและสูงของช่องสีเหลี่ยม
      ),
      itemCount: store1.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            _navigateToProductDetail(context, store1[index]);
          },
          child: ProductCard(product: store1[index]),
        );
      },
    );
  }
}

void _navigateToProductDetail(BuildContext context, Product product) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => ProductDetailPage(product: product),
    ),
  );
}

class ProductDetailPage extends StatelessWidget {
  final Product product;

  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              product.imageUrl,
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              product.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              product.description,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1, // ให้รูปภาพเป็นสี่เหลี่ยมจตุรัส
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover, // ปรับขนาดรูปให้พอดีกับ AspectRatio
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                // Text(
                //   product.description,
                //   style: TextStyle(
                //     fontSize: 14,
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
