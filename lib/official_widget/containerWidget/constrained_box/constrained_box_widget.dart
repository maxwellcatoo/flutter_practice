import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/official_widget/_common/common_widget.dart';

class ConstrainedBoxWidget extends StatefulWidget {
  const ConstrainedBoxWidget({Key? key}) : super(key: key);

  @override
  State<ConstrainedBoxWidget> createState() => _ConstrainedBoxWidgetState();
}

class _ConstrainedBoxWidgetState extends State<ConstrainedBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "ConstrainedBox", true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text("Container控件"),
          Container(
            color: Colors.blue,
            // height: 150,
            // width: 150,
            constraints: const BoxConstraints(
                minHeight: 100,
                minWidth: 100,
                maxHeight: 150,
                maxWidth: 150
            ),
            child: Container(
              color: Colors.red,
              width: 50,
              child: const Text("不要温和地走进那个良夜", maxLines: 1,),
            ),
          ),
          const Text("ConstrainedBox控件"),
          ConstrainedBox(
            constraints: const BoxConstraints(
                minHeight: 100,
                minWidth: 100,
                maxHeight: 150,
                maxWidth: 150
            ),
            child: Container(
              color: Colors.green,
              width: 50,
              child: const Text("不要温和地走进那个良夜", maxLines: 1,),
            ),
          ),
          const Text("SizedBox控件"),
          SizedBox(
            width: 150,
            height: 150,
            child: Container(
              color: Colors.green,
              width: 50,
              child: const Text("不要温和地走进那个良夜", maxLines: 1,),
            ),
          )
        ],
      )

    );
  }
}
