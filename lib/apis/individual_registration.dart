import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


Widget build(BuildContext context) {
return MaterialApp(
  home: Scaffold(
      appBar: AppBar(title: Text('User Registration Form')),
      body: Center(
        child: RegisterUser()
        )
      )
    );
}


class RegisterUser extends StatefulWidget {

RegisterUserState createState() => RegisterUserState();

}

class RegisterUserState extends State {

  // Boolean variable for CircularProgressIndicator.
  bool visible = false ;

  // Getting value from TextField widget.
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

Future userRegistration() async{

  // Showing CircularProgressIndicator.
  setState(() {
  visible = true ; 
  });

  // Getting value from Controller
  String name = nameController.text;
  String email = emailController.text;
  String password = passwordController.text;

  // SERVER API URL
  var url = 'https://flutter-examples.000webhostapp.com/register_user.php';

  // Store all data with Param Name.
  var data = {'name': name, 'email': email, 'password' : password};

  // Starting Web API Call.
  var response = await http.post(Uri.parse(url), body: json.encode(data));

  // Getting Server response into variable.
  var message = jsonDecode(response.body);

  // If Web call Success than Hide the CircularProgressIndicator.
  if(response.statusCode == 200){
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
            controller: nameController,
            autocorrect: true,
            decoration: InputDecoration(hintText: 'Enter Your Name Here'),
          )
        ),

        Container(
        width: 280,
        padding: EdgeInsets.all(10.0),
        child: TextField(
            controller: emailController,
            autocorrect: true,
            decoration: InputDecoration(hintText: 'Enter Your Email Here'),
          )
        ),

        Container(
        width: 280,
        padding: EdgeInsets.all(10.0),
        child: TextField(
            controller: passwordController,
            autocorrect: true,
            obscureText: true,
            decoration: InputDecoration(hintText: 'Enter Your Password Here'),
          )
        ),

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
            child: CircularProgressIndicator()
            )
          ),

      ],
    ),
  )));
}
}