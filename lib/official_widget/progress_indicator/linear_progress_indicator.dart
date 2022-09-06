import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_practice/official_widget/_common/common_widget.dart';

class LinearProgressIndicatorWidget extends StatefulWidget {
  const LinearProgressIndicatorWidget({Key? key}) : super(key: key);

  @override
  State<LinearProgressIndicatorWidget> createState() =>
      _LinearProgressIndicatorWidgetState();
}

class _LinearProgressIndicatorWidgetState
    extends State<LinearProgressIndicatorWidget> {
  late double value;
  late Timer setInternal;

  @override
  void initState() {
    value = 0;
    setInternal = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        value += 0.2;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    setInternal.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "条形进度条", true),
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          const SizedBox(height: 30,),
          Container(
            padding: const EdgeInsets.fromLTRB(30, 10, 30 ,10),
            color: Colors.grey[200],
            child: LinearProgressIndicator(
              minHeight: 10,
              backgroundColor: Colors.grey[500],
              color: Colors.green,
              valueColor: const AlwaysStoppedAnimation(Colors.blue),
              value: value,
            ),
          ),
          const Divider(height: 30,),
          Container(
            padding: const EdgeInsets.fromLTRB(30, 10, 30 ,10),
            color: Colors.grey[200],
            child: LinearProgressIndicator(
              minHeight: 10,
              backgroundColor: Colors.grey[500],
              valueColor: const AlwaysStoppedAnimation(Colors.blue),
              value: value,
            ),
          ),
        ],
      ),
    );
  }
}
