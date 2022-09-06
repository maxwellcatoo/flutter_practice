import 'package:flutter/material.dart';
import 'package:flutter_practice/official_widget/_common/common_widget.dart';
import 'package:flutter_practice/official_widget/_common/label_widget.dart';
import 'package:flutter_practice/official_widget/progress_indicator/slider.dart';

import 'circular_progress_indicator.dart';
import 'linear_progress_indicator.dart';


class MenuProgressIndicator extends StatefulWidget {
  const MenuProgressIndicator({Key? key}) : super(key: key);

  @override
  State<MenuProgressIndicator> createState() => _MenuProgressIndicatorState();
}

class _MenuProgressIndicatorState extends State<MenuProgressIndicator> {
  List<LabelWidget> list = [
    LabelWidget(
        mainTitle: "LinearProgressIndicator",
        subTitle: "条形进度条组件",
        widget: const LinearProgressIndicatorWidget()),
    LabelWidget(
        mainTitle: "CircularProgressIndicator",
        subTitle: "圆形进度条组件",
        widget: const CircularProgressIndicatorWidget()),
    LabelWidget(
        mainTitle: "Slider",
        subTitle: "滑块组件",
        widget: const SliderWidget()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "按钮菜单列表页", true),
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
            return const Divider();
          },
          itemCount: list.length),
    );
  }
}
