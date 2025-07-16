import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Bit Moscot Assignment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('GetX Example Home Page'),
        ),
        body: Center(
          child: Text('Welcome to GetX Example!'),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
