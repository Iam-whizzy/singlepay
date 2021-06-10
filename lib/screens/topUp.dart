import 'package:flutter/material.dart';

class TopUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TopUp Money')),
      body: Center(
        child: Text(
          'This is the TopUp Money Section',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
