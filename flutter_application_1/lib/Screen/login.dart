import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/home.dart';
import 'package:flutter_application_1/models/config.dart';
import 'package:http/http.dart' as http;
import 'package:email_validator/email_validator.dart';
import 'package:flutter_application_1/Screen/datapage.dart';
import 'package:flutter_application_1/models/users.dart';
import 'package:flutter_application_1/Screen/info.dart';
import 'package:flutter_application_1/main.dart';


class Login extends StatefulWidget {
  static const routeName = "/login";
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}


class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  Users user = Users();

  Future<void> login(User user) async {
    var params = {"email": user.email, "password": user.password};

    var url = Uri.http(Configure.sever, "users", params);
    var resp = await http.get(url);
    print(resp.body);
    List<Users> login_result = usersFromJson(resp.body) as List<Users>;
    print(login_result.length);
    if (login_result.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("username or password invalid")));
    } else {
      Configure.login = login_result[0];
      Navigator.pushNamed(context, MyApp.routeName);
      
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            textHeader(),
            emailInputField(),
            passwordInputField(),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                submitButton(),
                SizedBox(
                  width: 10.0,
                ),
                backButton(),
                SizedBox(
                  width: 10.0,
                ),
                registerLink()
              ],
            )
          ],  
        )),
      ),
      backgroundColor: Color.fromARGB(255, 255, 224, 231),
    );
  }

  Widget textHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            "Login",
            style: TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold),
          ),
        ),
        // SizedBox(height: 40.0),
        Text(
          "Welcome back! to MHealth",
          style: TextStyle(fontSize: 20.0, color: Colors.grey),
        ),
      ],
    );
  }

  Widget emailInputField() {
    return TextFormField(
      initialValue: "b@mhealth.com",
      decoration: InputDecoration(labelText: "Email:", icon: Icon(Icons.email)),
      validator: (value) {
        if (value!.isEmpty) {
          return "This field is required";
        }
        if (!EmailValidator.validate(value)) {
          return "It is not email format";
        }
        return null;
      },
      onSaved: (newValue) => user.email = newValue,
    );
  }

  Widget passwordInputField() {
    return TextFormField(
      initialValue: "64115512",
      obscureText: true,
      decoration:
          InputDecoration(labelText: "Password:", icon: Icon(Icons.lock)),
      validator: (value) {
        if (value!.isEmpty) {
          return "This field is required";
        }
        return null;
      },
      onSaved: (newValue) => user.password = newValue,
    );
  }

 Widget submitButton() {
  return ElevatedButton(
    onPressed: () async {
      Navigator.pushNamed(context, MyApp.routeName);
      if (_formkey.currentState!.validate()) {
        _formkey.currentState!.save();
        print(user.toJson().toString());
        await login(user as User);
      }
    },
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 247, 114, 165)), 
    ),
    child: Text("Login"),
  );
}


 Widget backButton() {
  return ElevatedButton(
    onPressed: () {
            Navigator.of(context).pop();
      _formkey.currentState!.validate();
    },
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 247, 114, 165)), 
    ),
    child: Text("Back"),
  );
}


  Widget registerLink() {
    return InkWell(
      child: const Text("Sign Up"),
      onTap: () {},
    );
  }
}
