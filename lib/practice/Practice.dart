import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_practice/practice/_practice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PracticePage extends StatefulWidget {
  const PracticePage({Key? key}) : super(key: key);

  @override
  State<PracticePage> createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {


  @override
  Widget build(BuildContext context) {

    print("---------------------------------------------------------");
    dynamic data = utf8.encode("hello World");
    print(utf8.encode("hello World"));
    print(String.fromCharCodes(data));
    ByteData buf = ByteData(4);
    buf.setInt32(0,data.length);
    print(buf.buffer.asUint8List());

    return Row(
      children: const [
        Text("练习页")
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    dynamic instance = Practice();
    instance.run();
  }
}
