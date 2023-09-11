import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/info.dart';

import 'Screen/home.dart';
import 'Screen/login.dart';
import 'Screen/datapage.dart';
import 'Screen/store1.dart';
import 'Screen/login.dart';
import 'Screen/info.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User CRUD',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/login': (context) => const Login(),
        '/Datapage' :(context) => const MyApp(),
        '/Info' :(context) => const UserInfo(),
       
        
      
      },
    );
  }
}