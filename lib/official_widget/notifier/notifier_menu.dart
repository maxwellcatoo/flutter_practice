import 'package:flutter/material.dart';
import 'package:flutter_practice/official_widget/_common/common_widget.dart';
import 'package:flutter_practice/official_widget/_common/label_widget.dart';
import 'package:flutter_practice/official_widget/notifier/custom_value_notifier/widget/custom_value_notifier_widget.dart';
import 'package:flutter_practice/official_widget/notifier/value_notifier/widget/value_notifier_home_page.dart';

class MenuNotifier extends StatefulWidget {
  const MenuNotifier({Key? key}) : super(key: key);

  @override
  State<MenuNotifier> createState() => _MenuNotifierState();
}

class _MenuNotifierState extends State<MenuNotifier> {
  List<LabelWidget> list = [
    LabelWidget(mainTitle: "valueNotifier",subTitle: "valueNotifier", widget: const HomeValueNotifier()),
    LabelWidget(mainTitle: "myValueNotifier", subTitle: "自定义ValueNotifier", widget: CustomValueNotifierWidget())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "notifier菜单列表页", true),
      body: ListView.separated(
          itemBuilder: (context, index) {
            var item = list[index];
            return ListTile(
              title: Text(item.mainTitle),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return item.widget;
                }));
              },
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: list.length),
    );
  }
}
