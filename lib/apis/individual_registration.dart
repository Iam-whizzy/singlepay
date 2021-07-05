import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Widget build(BuildContext context) {
  return Container(child: RegisterUser());
}

class RegisterUser extends StatefulWidget {
  RegisterUserState createState() => RegisterUserState();
}

class RegisterUserState extends State {
  // Boolean variable for CircularProgressIndicator.
  bool visible = false;

  // Getting value from TextField widget.
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final full_nameController = TextEditingController();
  final phoneController = TextEditingController();

  Future userRegistration() async {
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true;
    });

    // Getting value from Controller
    String username = usernameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String full_name = full_nameController.text;
    String phone = phoneController.text;

    // SERVER API URL
    var url =
        'https://payherokenya.com/singlepay/app/individual_registration.php';

    // Store all data with Param Name.
    var data = {
      'username': username,
      'email': email,
      'password': password,
      'full_name': full_name,
      'phone': phone
    };

    // Starting Web API Call.
    var response = await http.post(Uri.parse(url), body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if (response.statusCode == 200) {
      setState(() {
        visible = false;
      });
    }

    // Showing Alert Dialog with Response JSON Message.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Center(
      child: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('User Registration Form',
                  style: TextStyle(fontSize: 21))),
          Divider(),
          Container(
              width: 280,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: usernameController,
                autocorrect: true,
                decoration:
                    InputDecoration(hintText: 'Enter Your username Here'),
              )),
          Container(
              width: 280,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: full_nameController,
                autocorrect: true,
                decoration:
                    InputDecoration(hintText: 'Enter Your FullName Here'),
              )),
          Container(
              width: 280,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: phoneController,
                autocorrect: true,
                decoration: InputDecoration(hintText: 'Enter Your phone Here'),
              )),
          Container(
              width: 280,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: emailController,
                autocorrect: true,
                decoration: InputDecoration(hintText: 'Enter Your Email Here'),
              )),
          Container(
              width: 280,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: passwordController,
                autocorrect: true,
                obscureText: true,
                decoration:
                    InputDecoration(hintText: 'Enter Your Password Here'),
              )),
          RaisedButton(
            onPressed: userRegistration,
            color: Colors.green,
            textColor: Colors.white,
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Text('Click Here To Register User Online'),
          ),
          Visibility(
              visible: visible,
              child: Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: CircularProgressIndicator())),
        ],
      ),
    )));
  }
}
