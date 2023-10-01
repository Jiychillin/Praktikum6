import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AccessCameraPage(),
    );
  }
}

class AccessCameraPage extends StatefulWidget {
  @override
  _AccesCameraPageState createState() => _AccesCameraPageState();
}

class _AccesCameraPageState extends State<AccessCameraPage> {
  File? _image;
  Future<void> openCamera() async {
    final pickedImage =
        await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      _image = File(pickedImage!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Access Camera"),
      ),
      body: Container(
        child: Center(
          child: _image == mull ? Text('No Image') : Image.file(_image!),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add_a_photo,
            color: Colors.white,
          ),
          backgroundColor: Color.green,
          onPressed: () {
            openCamera();
          }),
    );
  }
}
