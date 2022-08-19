import 'package:flutter/material.dart';
import 'package:flutter_practice/official_widget/notifier/notifier_menu.dart';
import '_common/common_widget.dart';
import '_common/label_widget.dart';
import 'button/button_menu.dart';

class MenuListEntrance extends StatefulWidget {
  const MenuListEntrance({Key? key}) : super(key: key);

  @override
  State<MenuListEntrance> createState() => _MenuListEntranceState();
}

class _MenuListEntranceState extends State<MenuListEntrance> {
  List<LabelWidget> list = [
    LabelWidget(mainTitle: "button",subTitle: "按钮类组件", widget: const MenuButton()),
    LabelWidget(mainTitle: "notifier",subTitle: "各种notifier类的使用", widget: const MenuNotifier()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "各官方组件菜单列表", true),
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
              },
            );
          },
          separatorBuilder: (context, _) => const Divider(
                indent: 30,
                endIndent: 30,
              ),
          itemCount: list.length),
    );
  }
}
