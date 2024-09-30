import 'package:flutter/material.dart';
import 'package:quiz_app/view/questions_screen/questions_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: questions_page(),
    );
  }
}
