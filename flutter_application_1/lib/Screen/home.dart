import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/profile.dart';
import 'package:flutter_application_1/models/config.dart';
import 'package:flutter_application_1/models/users.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/Screen/slidemenu.dart';
import 'package:flutter_application_1/Screen/info.dart';



class Home extends StatefulWidget {
   static const routeName = '/';
   const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget mainBody = Container();

  @override
  void initState() {
    super.initState();
    Users user = Configure.login;
    if(user.id != null){
       mainBody = showUsers();
       getUsers();
    }
  }

  List<Users> _userList = [];
  Future<void> getUsers() async{
    var url = Uri.http(Configure.sever, "users");
    var resp = await http.get(url);
    setState(() {
      _userList = usersFromJson(resp.body) as List<Users>;
      mainBody = showUsers();
    });
    return;
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("MHealth"),
          backgroundColor: Color.fromARGB(255, 242, 161, 177),
        ),
        drawer: const SideMenu(),
        body:
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://scontent.furt1-1.fna.fbcdn.net/v/t1.15752-9/373396508_620613450217005_8545018320566797485_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=ae9488&_nc_eui2=AeFcyv4noPsOfPZUvuXdlw1GTORLAgd-CFlM5EsCB34IWYchBfHhEB37__9JiqGUhcJGMvwvZv_4DR_UPNo2emFR&_nc_ohc=2Rh11NX1c6kAX_nrMLr&_nc_ht=scontent.furt1-1.fna&oh=03_AdTl8gdhrWKZn10pLm9EclHLPkLLuAFD8DWdWfKrIl2Atg&oe=65241AFD',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: SizedBox(
                  width: 120.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(200.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                MyApp(),
                          ),
                        );
                      },
                      child: Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 242, 161, 177)),
                      ),
                    ),
                  ),
                  
                ),
              ),
            ),
          ],
        ),
      );
  }
}

Widget showUsers() {
  return ListView.builder(
    // itemCount: _userList.length,
    itemBuilder: (context, index) {
      // Users user = _userList[index];
      return Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.endToStart,
        child: Card(
        child: ListTile(
        // title: Text("${user.users}"),
        // subtitle: Text("${user.email}"),
        onTap: () {},
        // trailing: IconButton(
          // onPressed: Icon(Icons.edit),
        ),
      ),
      // ),
      );
      }
      );
      }