import 'package:flutter/material.dart';
import 'widgets/ui_elements.dart'; // ← インポートを忘れずに！

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ListViewDemo());
  }
}

class ListViewDemo extends StatefulWidget {
  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

Color _colorSetting(int index) {
  return index.isEven ? Colors.blue[100]! : Colors.blue[200]!;
}

class _ListViewDemoState extends State<ListViewDemo> {
  final List<String> items = List.generate(20, (index) => "アイテム ${index + 1}");
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("外部ファイルから呼び出す")),
      body: SizedBox(
        height: 120,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            final isSelected = index == selectedIndex;

            return buildSelectableItem(
              label: items[index],
              isSelected: isSelected,
              baseColor: _colorSetting(index),
              onTap: () {
                setState(() {
                  selectedIndex = isSelected ? null : index;
                });
              },
            );
          },
        ),
      ),
    );
  }
}
