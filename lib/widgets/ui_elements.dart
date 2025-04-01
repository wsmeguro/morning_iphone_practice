import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// タップ可能な選択式カード
Widget buildSelectableItem({
  required String label,
  required bool isSelected,
  required VoidCallback onTap,
  Color? baseColor,
  double width = 100,
}) {
  final Color bgColor =
      isSelected ? Colors.orange[200]! : baseColor ?? Colors.blue[100]!;

  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: width,
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
        border: isSelected ? Border.all(color: Colors.orange, width: 2) : null,
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

Future<void> showCustomDialog({
  required BuildContext context,
  required IconData icon,
  required String title,
  required String message,
  required String confirmText,
  required String cancelText,
  required VoidCallback onConfirm,
}) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Row(
          children: [
            Icon(icon, size: 30, color: Colors.blue),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // ダイアログを閉じる
            },
            child: Text(cancelText),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // ダイアログを閉じる
              onConfirm(); // OKボタンの処理を実行
            },
            child: Text(confirmText),
          ),
        ],
      );
    },
  );
}

// iOS風のボタン
class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  MyButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: CupertinoColors.activeBlue,
      child: Text(text),
      onPressed: onPressed,
    );
  }
}

// iOS風のテキストフィールド
class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;

  MyTextField({required this.controller, required this.placeholder});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: CupertinoTextField(
        controller: controller,
        placeholder: placeholder,
        padding: EdgeInsets.all(12),
      ),
    );
  }
}
