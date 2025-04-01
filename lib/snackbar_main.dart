import 'package:flutter/material.dart';
import 'widgets/ui_elements.dart'; // ui_elements.dart をインポート

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: DialogDemo());
  }
}

class DialogDemo extends StatelessWidget {
  void _showInfoDialog(BuildContext context) {
    showCustomDialog(
      context: context,
      icon: Icons.info, // アイコンを指定
      title: "情報",
      message: "これはカスタムダイアログのサンプルです。",
      confirmText: "OK",
      cancelText: "キャンセル",
      onConfirm: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("OKが押されました！")));
      },
    );
  }

  void _showWarningDialog(BuildContext context) {
    showCustomDialog(
      context: context,
      icon: Icons.warning, // アイコンを変更
      title: "警告",
      message: "この操作は元に戻せません。本当に実行しますか？",
      confirmText: "実行",
      cancelText: "戻る",
      onConfirm: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("操作を実行しました！")));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("カスタムダイアログ")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _showInfoDialog(context),
              child: Text("情報ダイアログを表示"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _showWarningDialog(context),
              child: Text("警告ダイアログを表示"),
            ),
          ],
        ),
      ),
    );
  }
}
