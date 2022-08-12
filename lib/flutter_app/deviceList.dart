import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'commonClass.dart';
import 'commonUtils.dart';

class DeviceList extends StatefulWidget {
  const DeviceList({Key? key, required this.deviceGroups}) : super(key: key);

  final List<DeviceGroup> deviceGroups;

  @override
  State<DeviceList> createState() => _DeviceListState();
}

class _DeviceListState extends State<DeviceList> {
  late List<Widget> list;

  @override
  void initState() {
    // 生成group列表
    list = widget.deviceGroups.map((element) => getGroup(element)).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView(children: list));
  }

  Widget getGroup(DeviceGroup device) {
    return Column(
      children: [
        device.groupTitle == null
            ? voidWidget()
            : Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 0, bottom: 0, top: 10),
                child: Container(
                  height: 55,
                  width: 1.sw,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    device.groupTitle!,
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ),
        ...getGroupItem(device.content)
      ],
    );
  }

  List<Widget> getGroupItem(List<GroupItem> groupItems) {
    // 横向长条按钮列表
    return groupItems.map((element) {
      // 横向长条按钮，有点击事件
      return OutlinedButton(
          onPressed: element.onPressed,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 0),
            child: SizedBox(
              height: 60,
              width: 1.sw,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 头部图标
                  Image.asset(
                    element.preSrc,
                    width: 0.05.sw,
                  ),
                  Container(
                    width: 0.7.sw,
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(element.mainTitle),
                        element.subTitle == null
                            ? voidWidget()
                            : Text(element.subTitle!)
                      ],
                    ),
                  ),
                  // 尾部图标
                  Image.asset(
                    element.behindSrc,
                    width: 0.05.sw,
                  )
                ],
              ),
            ),
          ));
    }).toList();
  }
}
