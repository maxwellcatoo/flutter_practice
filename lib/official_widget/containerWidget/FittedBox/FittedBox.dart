import 'package:flutter/material.dart';
import 'package:flutter_practice/official_widget/_common/common_widget.dart';

class FittedBoxWidget extends StatefulWidget {
  const FittedBoxWidget({Key? key}) : super(key: key);

  @override
  State<FittedBoxWidget> createState() => _FittedBoxWidgetState();
}

class _FittedBoxWidgetState extends State<FittedBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "FittedBox", true),
      body: Column(
        children: [
          const Text("使用FittedBox和不使用的区别，另外，这两个Container块的margin-left都是50，造成左右间距不一样应该是FittedBox缩放或裁剪子组件的实现方式导致的，有机会可以细看一下"),
          Container(
            margin: const EdgeInsets.fromLTRB(50, 100, 50, 100),
            color: Colors.green,
            width: 50,
            height: 50,
            child: const FittedBox(
              fit: BoxFit.none,
              child: FlutterLogo(size: 100,),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 50),
            color: Colors.green,
            width: 50,
            height: 50,
            child: const FlutterLogo(size: 100,),
          )
        ],
      )
    );
  }
}
