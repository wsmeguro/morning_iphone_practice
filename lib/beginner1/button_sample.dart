import 'package:flutter/material.dart';

class ButtonSample extends StatefulWidget {
  @override
  _ButtonSampleState createState() => _ButtonSampleState();
}

class _ButtonSampleState extends State<ButtonSample> {
  String message = "こんにちは！";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ボタン練習")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message, style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  message = "ボタンが押されました！";
                });
              },
              child: Text("押してみて"),
            ),
          ],
        ),
      ),
    );
  }
}
