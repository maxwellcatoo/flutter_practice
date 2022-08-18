import 'dart:async';

import 'package:flutter_practice/flutter_app/Global.dart';
import 'package:flutter_practice/flutter_app/interfaceB.dart';
import 'package:flutter_practice/flutter_app/interfaceC.dart';
import 'package:flutter_practice/flutter_app/steps.dart';
import 'package:flutter/material.dart';

import 'commonClass.dart';
import 'deviceList.dart';
import 'tabs.dart';

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
  // todo 这里到时候传Global.index，来控制该组件的进程
  Widget getSteps() {
    return StepsWidget(
      currentIndex: DemoGlobal.processIndex,
      items: const ["选择设备", "选择图片", "上传"],
      unCheckImgPath: "assets/images/unCheck.png",
      checkImgPath: "assets/images/check.png",
    );
  }

  // 页面组件
  Widget getTabs() {
    return Tabs(
      tabList: [getDeviceList(), const InterfaceB(), const InterfaceC()],
      labelList: const ["照片家", "上传", "设置"],
      iconList: const [
        Icon(Icons.home),
        Icon(Icons.cloud_upload),
        Icon(Icons.settings)
      ],
      defaultIndex: 0,
    );
  }

  // 设备列表组件
  Widget getDeviceList() {
    List<DeviceGroup> deviceList = [
      // group1 设备名称
      DeviceGroup("设备名称", [
        GroupItem("assets/images/check.png", "assets/images/1.png", "mainTitle",
            subTitle: "subTitle", onPressed: () {
          print("点击了设备名称1");
        }),
        GroupItem(
            "assets/images/unCheck.png", "assets/images/2.png", "mainTitle2",
            subTitle: "subTitle2", onPressed: () {
          print("点击了设备名称2");
        })
      ]),
      // group2 设备名称2
      DeviceGroup("设备列表", [
        GroupItem("assets/images/check.png", "assets/images/3.png", "mainTitle",
            subTitle: "subTitle", onPressed: () {
          print("点击了设备列表1");
        }),
        GroupItem(
            "assets/images/unCheck.png", "assets/images/4.png", "mainTitle2",
            onPressed: () {
          print("点击了设备列表2");
        })
      ]),
      DeviceGroup("删除设备", [
        GroupItem("assets/images/check.png", "assets/images/3.png", "mainTitle",
            subTitle: "subTitle", onPressed: () {
          print("点击了删除设备1");
        }),
        GroupItem(
            "assets/images/unCheck.png", "assets/images/4.png", "mainTitle2")
      ]),
      DeviceGroup("修改设备", [
        GroupItem("assets/images/check.png", "assets/images/3.png", "mainTitle",
            subTitle: "subTitle"),
        GroupItem(
            "assets/images/unCheck.png", "assets/images/4.png", "mainTitle2")
      ]),
      DeviceGroup(null, [
        GroupItem("assets/images/check.png", "assets/images/3.png", "mainTitle",
            subTitle: "subTitle"),
        GroupItem(
            "assets/images/unCheck.png", "assets/images/4.png", "mainTitle2")
      ])
    ];
    return DeviceList(deviceGroups: deviceList);
  }

  @override
  Widget build(BuildContext context) {
    changeIndex();

    return Center(
      child: getTabs(),
    );
  }
}
