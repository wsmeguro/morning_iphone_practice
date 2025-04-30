import 'package:flutter/material.dart';

class PageWithDataInput extends StatefulWidget {
  @override
  _PageWithDataInputState createState() => _PageWithDataInputState();
}

class _PageWithDataInputState extends State<PageWithDataInput> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("名前を入力")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "名前"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String name = _nameController.text;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageWithDataDisplay(name: name),
                  ),
                );
              },
              child: Text("次のページへ"),
            ),
          ],
        ),
      ),
    );
  }
}

class PageWithDataDisplay extends StatelessWidget {
  final String name;

  PageWithDataDisplay({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ようこそ")),
      body: Center(
        child: Text("こんにちは、$name さん！", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
