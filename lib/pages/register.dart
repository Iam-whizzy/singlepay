import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:singlepay/domain/user.dart';
import 'package:singlepay/providers/auth.dart';
import 'package:singlepay/providers/user_provider.dart';
import 'package:singlepay/util/validators.dart';
import 'package:singlepay/util/widgets.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = new GlobalKey<FormState>();

  String _username, _password, _confirmPassword, _email, _full_name, _phone;

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);

    final usernameField = TextFormField(
      autofocus: false,
      validator: validateEmail,
      onSaved: (value) => _username = value,
      decoration: buildInputDecoration("Enter username", Icons.email),
    );
    
    final passwordField = TextFormField(
      autofocus: false,
      obscureText: true,
      validator: (value) => value.isEmpty ? "Please enter password" : null,
      onSaved: (value) => _password = value,
      decoration: buildInputDecoration("Confirm password", Icons.lock),
    );

    final confirmPassword = TextFormField(
      autofocus: false,
      validator: (value) => value.isEmpty ? "Your password is required" : null,
      onSaved: (value) => _confirmPassword = value,
      obscureText: true,
      decoration: buildInputDecoration("Confirm password", Icons.lock),
    );
    final emailField = TextFormField(
      autofocus: false,
      validator: validateEmail,
      onSaved: (value) => _email = value,
      decoration: buildInputDecoration("Enter Email", Icons.email),
    );

final full_nameField = TextFormField(
      autofocus: false,
      validator: (value) => value.isEmpty ? "You Full Name is required" : null,
      onSaved: (value) => _full_name = value,
      decoration: buildInputDecoration("Enter your Full Name", Icons.email),
    );
final phoneField = TextFormField(
      autofocus: false,
      validator: (value) => value.isEmpty ? "You Phone Number is required": null,
      onSaved: (value) => _phone = value,
      decoration: buildInputDecoration("Enter your Phone Number", Icons.email),
    );

    var loading = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        Text(" Registering ... Please wait")
      ],
    );

    final forgotLabel = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        FlatButton(
          padding: EdgeInsets.all(0.0),
          child: Text("Forgot password?",
              style: TextStyle(fontWeight: FontWeight.w300)),
          onPressed: () {
          },
        ),
        FlatButton(
          padding: EdgeInsets.only(left: 0.0),
          child: Text("Sign in", style: TextStyle(fontWeight: FontWeight.w300)),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
        ),
      ],
    );

    var doRegister = () {
      final form = formKey.currentState;
      if (form.validate()) {
        form.save();
        auth.register(_username, _password, _confirmPassword, _email, _full_name, _phone).then((response) {
          if (response['status']) {
            User user = response['data'];
            Provider.of<UserProvider>(context, listen: false).setUser(user);
            Navigator.pushReplacementNamed(context, '/dashboard');
          } else {
            Flushbar(
              title: "Registration Failed",
              message: response.toString(),
              duration: Duration(seconds: 10),
            ).show(context);
          }
        });
      } else {
        Flushbar(
          title: "Invalid form",
          message: "Please Complete the form properly",
          duration: Duration(seconds: 10),
        ).show(context);
      }

    };

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(40.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 215.0),
                  label("Username"),
                  SizedBox(height: 5.0),
                  usernameField,
                  SizedBox(height: 15.0),
                  label("Password"),
                  SizedBox(height: 10.0),
                  passwordField,
                  SizedBox(height: 15.0),
                  label("Confirm Password"),
                  SizedBox(height: 10.0),
                  confirmPassword,
                  SizedBox(height: 10.0),
                  label("Email"),
                  SizedBox(height: 10.0),
                  emailField,
                   SizedBox(height: 10.0),
                  label("full_name"),
                  SizedBox(height: 5.0),
                  full_nameField,
                   SizedBox(height: 10.0),
                  label("phone"),
                  SizedBox(height: 5.0),
                  phoneField,
                  SizedBox(height: 20.0),
                  auth.registeredInStatus == Status.Registering
                      ? loading
                      : longButtons("Register", doRegister),
                  SizedBox(height: 5.0),
                  forgotLabel
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}