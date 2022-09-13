import 'package:flutter/material.dart';
import 'package:flutter_practice/official_widget/_common/common_widget.dart';
import 'package:flutter_practice/official_widget/_common/label_widget.dart';
import 'package:flutter_practice/official_widget/containerWidget/unconstrainedBox/unconstrainedBox.dart';

import 'Container/Container.dart';
import 'FittedBox/FittedBox.dart';
import 'constrained_box/constrained_box_widget.dart';
import 'line_container_widget/line_container_widget.dart';

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
        mainTitle: "unconstrainedBox",
        subTitle: "让子组件不再受父组件大小约束，可以自由绘制",
        widget: const UnconstrainedBoxWidget()),
    LabelWidget(
        mainTitle: "FittedBox",
        subTitle: "动态适配父组件大小。首先按照不约束进行子组件布局，获取子组件自身大小后根据指定的适配方式决定缩放还是裁剪子组件",
        widget: const FittedBoxWidget()),
    LabelWidget(
        mainTitle: "Container",
        subTitle: "DecoratedBox、ConstrainedBox、Transform、Padding、Align等组件组合的⼀个多功能容器。同时实现多种容器的功能，⽅便减少代码层级。",
        widget: const ContainerWidget()),
    LabelWidget(
        mainTitle: "Row、Column、Wrap、Stack、Flow、Align、Center",
        subTitle: "横向纵向布局，流式布局，层叠布局、自定义布局Flow、单组件相对于父组件定位Align",
        widget: const LineContainerWidget()),
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
