import 'dart:convert';
import 'dart:async';
//import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
//import 'InputDeco_design.dart';
import 'package:http/http.dart' as http;

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  TextEditingController _username = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*CircleAvatar(
                  radius: 70,
                  child: Image.asset('assets/singlepaymainlogo.jpg',
                      width: 50, height: 5),
                ),*/
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: _username,
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                        icon: new Icon(Icons.person), labelText: "Username"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please enter your user name";
                      }
                      return null;
                    },
                    onSaved: (String username) {},
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: _password,
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                        icon: new Icon(Icons.lock), labelText: "Password"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please enter password";
                      }

                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: _email,
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                        icon: new Icon(Icons.email), labelText: "Email"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please enter  email";
                      }
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return "Please enter valid email";
                      }
                      return null;
                    },
                    onSaved: (String email) {},
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: _name,
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                        icon: new Icon(Icons.person), labelText: "Full Name"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please enter name";
                      }
                      return null;
                    },
                    onSaved: (String name) {},
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: _phone,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        icon: new Icon(Icons.phone), labelText: "Phone Number"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please enter  phone";
                      }
                      if (value.length < 10) {
                        return "Please enter valid phone";
                      }
                      return null;
                    },
                    onSaved: (String phone) {},
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: _confirmpassword,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                        icon: new Icon(Icons.lock),
                        labelText: "Confirm Password"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please re-enter password";
                      }
                      if (_password.text != _confirmpassword.text) {
                        return "Password Do not match";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.redAccent,
                    onPressed: () {
                      if (_formkey.currentState.validate()) {
                        registrationUser();
                        print("Successful");
                      } else {
                        print("Unsuccessfull");
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Colors.blue, width: 2)),
                    textColor: Colors.white,
                    child: Text("Submit"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future registrationUser() async {
    // url to registration php script
    var apiUrl =
        "https://payherokenya.com/singlepay/app/individual_registration.php";
    //json maping user entered details
    Map mapeddate = {
      'username': _username.text,
      'password': _password.text,
      'email': _email.text,
      'full_name': _name.text,
      'phone': _phone.text
    };
    //send  data using http post to our php code
    http.Response reponse = await http.post(Uri.parse(apiUrl), body: mapeddate);
    //getting response from php code, here
    var data = jsonEncode(reponse.body);
    print("DATA: $data");
  }
}
