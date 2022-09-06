import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/official_widget/_common/common_widget.dart';
import 'package:flutter_practice/official_widget/_common/label_widget.dart';

import 'constrained_box/constrained_box_widget.dart';

class MenuContainer extends StatefulWidget {
  const MenuContainer({Key? key}) : super(key: key);

  @override
  State<MenuContainer> createState() => _MenuContainerState();
}

class _MenuContainerState extends State<MenuContainer> {

  List<LabelWidget> list = [
    LabelWidget(
        mainTitle: "ConstrainedBox: 约束子组件大小",
        subTitle: "这个组件，貌似完全可以用Container替代",
        widget: const ConstrainedBoxWidget()),
    LabelWidget(
        mainTitle: "SizedBox: 本质上是ConstrainedBox的定制",
        subTitle: "ConstrainedBox可以用(min/max)(width/height)设置宽高，而SizedBox只有height和width属性",
        widget: const ConstrainedBoxWidget()),
    LabelWidget(
        mainTitle: "UnconstrainedBox",
        subTitle: "让子组件不再受父组件大小约束，可以自由绘制",
        widget: const ConstrainedBoxWidget()),
    LabelWidget(
        mainTitle: "FittedBox",
        subTitle: "动态适配父组件大小。首先按照不约束进行子组件布局，获取子组件自身大小后根据指定的适配方式决定缩放还是裁剪子组件",
        widget: const ConstrainedBoxWidget()),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "布局类组件列表", true),
      body: ListView.separated(
          itemBuilder: (context, index) {
            var item = list[index];
            return ListTile(
                title: Text(item.mainTitle),
                subtitle: Text(item.subTitle),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return item.widget;
                  }));
                });
          },
          separatorBuilder: (context, index) {
            return Divider(
              indent: 0,
              endIndent: 0,
              color: Colors.black.withOpacity(.7),
            );
          },
          itemCount: list.length),
    );
  }
}
