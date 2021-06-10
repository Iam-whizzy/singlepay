import 'package:flutter/material.dart';

class FirstApp extends StatelessWidget {
  //substitute first app with SendScreen
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Send Money')),
      body: Center(
        child: Text(
          'This is the Send Money Section',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }

/*import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'qrscan.dart' as scanner;

class FirstApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<FirstApp> {
  Uint8List bytes = Uint8List(0);

  late TextEditingController _outputController;

  @override
  initState() {
    super.initState();

    this._outputController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
         appBar: AppBar(title: Text('Send Money')),
        backgroundColor: Colors.grey[300],
        body: Builder(
          builder: (BuildContext context) {
            return ListView(
              children: <Widget>[
                Container(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20),
                      TextField(
                        controller: this._outputController,
                        maxLines: 2,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.wrap_text),
                          helperText:
                              'The barcode or qrcode you scan will be displayed in this area.',
                          hintText:
                              'The barcode or qrcode you scan will be displayed in this area.',
                          hintStyle: TextStyle(fontSize: 15),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 7, vertical: 15),
                        ),
                      ),
                      SizedBox(height: 20),
                      this._buttonGroup(),
                      SizedBox(height: 70),
                    ],
                  ),
                ),
              ],
            );
          },
        ),

        //Take a photo
        floatingActionButton: FloatingActionButton(
          onPressed: () => _scanBytes(),
          tooltip: 'Take a Photo',
          child: const Icon(Icons.camera_alt),
        ),
      ),
    );
  }

  Widget _buttonGroup() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 120,
            child: InkWell(
              onTap: _scan,
              child: Card(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Image.asset('assets/scanner.png'),
                    ),
                    Divider(height: 20),
                    Expanded(flex: 1, child: Text("Scan")),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 120,
            child: InkWell(
              onTap: _scanPhoto,
              child: Card(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Image.asset('assets/albums.png'),
                    ),
                    Divider(height: 20),
                    Expanded(flex: 1, child: Text("Scan Photo")),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future _scan() async {
    String barcode = await scanner.scan();
    if (barcode == null) {
      print('nothing return.');
    } else {
      this._outputController.text = barcode;
    }
  }

  Future _scanPhoto() async {
    String barcode = await scanner.scanPhoto();
    this._outputController.text = barcode;
  }

  Future _scanPath(String path) async {
    String barcode = await scanner.scanPath(path);
    this._outputController.text = barcode;
  }

  Future _scanBytes() async {
    File file = await ImagePicker.pickImage(source: ImageSource.camera);
    Uint8List bytes = file.readAsBytesSync();
    String barcode = await scanner.scanBytes(bytes);
    this._outputController.text = barcode;
  }
}*/
}
