import 'package:flutter/material.dart';
import 'package:praktpm_quiz/halaman_utama.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant Disease',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HalamanUtama(),
      debugShowCheckedModeBanner: false,
    );
  }
}