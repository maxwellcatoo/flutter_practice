import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/official_widget/_common/common_widget.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({Key? key}) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  late double _processValue;

  @override
  void initState() {
    _processValue = 25;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "滑块组件", true),
      body: Column(
        children: [
          Container(
            color: Colors.grey[200]!,
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            child: Slider(
              value: _processValue,
              min: 0.0,
              max: 100.0,
              divisions: 4,
              onChanged: (val){
                setState(() {
                  _processValue = val;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
