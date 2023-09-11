import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/home.dart';
import 'package:flutter_application_1/Screen/info.dart';
import 'package:flutter_application_1/Screen/login.dart';
import 'package:flutter_application_1/models/config.dart';
import 'package:flutter_application_1/models/users.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    String accountName = "N/A";
    String accountEmail = "N/A";
    String accountUrl = "https://scontent-sin6-2.xx.fbcdn.net/v/t39.30808-6/358586624_2483141531866809_48356667851495574_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=a2f6c7&_nc_eui2=AeGNGIFpt4r9FS4ynLXmp83flKMeYSbrsqaUox5hJuuypnpokDHfmAuQ0eQXoDU2mLLL4tSZ5ObIqp7IoTkISt5u&_nc_ohc=m6bZVLF6l1UAX_F3NmQ&_nc_ht=scontent-sin6-2.xx&oh=00_AfAbSskqf5Yg1phahCwb3eAgHvfn1ooioEdACRfbqyaoEA&oe=6502C308";
    Users user = Configure.login;
    //print(user.toJson().toString());
    if (user.id != null) {
      accountName = user.firstname!;
      accountEmail = user.email!;
    }

    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(accountName), 
            accountEmail: Text(accountEmail),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(accountUrl),
              backgroundColor: Colors.white,
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 242, 161, 177),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("User Info"),
            onTap: () {
              Navigator.pushNamed(context, Home.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text("Login"),
            onTap: () {
              Navigator.pushNamed(context, Login.routeName);
            },
          ),
        ],
      ),
    );
  }
}