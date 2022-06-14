import 'package:flutter/material.dart';

import 'dropdownButton.dart';
import 'popupMenuButton.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("标题"),
          backgroundColor: Colors.green,
        ),
        body: const DropDownList(),
      ),
      theme: ThemeData.light(), // 暗黑主体背景色
    );
  }
}

