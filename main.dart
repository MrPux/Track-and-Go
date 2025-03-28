import 'package:flutter/material.dart';
import 'package:track_n_go/pages/Student/StudentEntryPoint.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',  
      theme: ThemeData.dark(useMaterial3: true),
      home: StudentEntryPoint(),
    );
  }
}
