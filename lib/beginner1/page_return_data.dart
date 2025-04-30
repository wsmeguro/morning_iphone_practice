import 'package:flutter/material.dart';

class PageReturnDataInput extends StatefulWidget {
  @override
  _PageReturnDataInputState createState() => _PageReturnDataInputState();
}

class _PageReturnDataInputState extends State<PageReturnDataInput> {
  String _result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("1ページ目")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ElevatedButton(
              child: Text("2ページ目へ"),
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageReturnDataSecond(),
                  ),
                );
                if (result != null) {
                  setState(() {
                    _result = result;
                  });
                }
              },
            ),
            SizedBox(height: 20),
            Text("戻ってきたデータ：$_result"),
          ],
        ),
      ),
    );
  }
}

class PageReturnDataSecond extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("2ページ目")),
      body: Center(
        child: ElevatedButton(
          child: Text("データを返して戻る"),
          onPressed: () {
            Navigator.pop(context, "Flutterが返した値です！");
          },
        ),
      ),
    );
  }
}
