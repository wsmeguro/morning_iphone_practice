import 'package:flutter/material.dart';

class InputSample extends StatefulWidget {
  @override
  _InputSampleState createState() => _InputSampleState();
}

class _InputSampleState extends State<InputSample> {
  final TextEditingController _controller = TextEditingController();
  String _displayText = "";

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _displayText = _controller.text;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("文字入力サンプル")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: "ここに入力してね"),
            ),
            SizedBox(height: 20),
            Text("入力された文字：$_displayText", style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
