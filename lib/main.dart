import 'package:flutter/material.dart';
import 'package:mod16_assignment_api/pages/home_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Module 16 Assignment API',
      home: HomePage(),
    );
  }
}
