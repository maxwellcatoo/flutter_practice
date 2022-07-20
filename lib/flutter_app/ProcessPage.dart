import 'dart:async';

import 'package:flutt/Global.dart';
import 'package:flutt/flutter_app/steps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProcessPage extends StatefulWidget {
  const ProcessPage({Key? key}) : super(key: key);

  @override
  State<ProcessPage> createState() => _ProcessPageState();
}

class _ProcessPageState extends State<ProcessPage> {
  void changeIndex() {
    Timer(const Duration(seconds: 3), () {
      setState(() {
        DemoGlobal.processIndex = (DemoGlobal.processIndex + 1) % 3;
      });
    });
  }

  // 步骤条组件
  Widget getSteps() {
    return StepsWidget(
      currentIndex: DemoGlobal.processIndex,
      items: const ["选择设备", "选择图片", "上传"],
      unCheckImgPath: "assets/images/unCheck.png",
      checkImgPath: "assets/images/check.png",
    );
  }


  @override
  Widget build(BuildContext context) {
    changeIndex();

    // todo 这里到时候传Global.index，来控制该组件的进程
    return Center(
      child: getSteps(),
    );
  }
}
