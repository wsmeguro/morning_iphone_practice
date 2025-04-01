import 'package:flutter/cupertino.dart';
import 'widgets/ui_elements.dart'; // UIパーツをまとめたファイルをインポート

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(title: 'iOS UI', home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('ホーム画面')),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyTextField(controller: _textController, placeholder: '名前を入力'),
          MyButton(
            text: '送信',
            onPressed: () {
              showCupertinoDialog(
                context: context,
                builder:
                    (context) => CupertinoAlertDialog(
                      title: Text('入力内容'),
                      content: Text('あなたの名前: ${_textController.text}'),
                      actions: [
                        CupertinoDialogAction(
                          child: Text('OK'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
              );
            },
          ),
        ],
      ),
    );
  }
}
