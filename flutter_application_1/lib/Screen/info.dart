import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/users.dart';
import 'package:flutter_application_1/Screen/home.dart';
import 'package:flutter_application_1/Screen/login.dart';
import 'package:http/http.dart' as http;

class UserInfo extends StatelessWidget {
  static const routeName = "/Info";
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    Users user = ModalRoute.of(context)!.settings.arguments as Users;

    return Scaffold(
      appBar: AppBar(
        title: const Text("User Info"),
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          child: Card(
            child: ListView(
            children: [
              ListTile(title: Text("Full Name"),subtitle: Text("${user.users}"),),
              ListTile(title: Text("Email"),subtitle: Text("${user.email}"),),
            ],
          ),
        ),
    ),
    );
  }
}