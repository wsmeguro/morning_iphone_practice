import 'package:flutter/material.dart';
import 'beginner1/input_sample.dart'; // ← 追加

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputSample(), // ← 差し替え
    );
  }
}
