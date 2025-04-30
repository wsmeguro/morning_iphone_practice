import 'package:flutter/material.dart';

class PageNavigationSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("トップ画面")),
      body: Center(
        child: ElevatedButton(
          child: Text("次のページへ"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondPage()),
            );
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("セカンドページ")),
      body: Center(child: Text("これは2ページ目です！", style: TextStyle(fontSize: 24))),
    );
  }
}
