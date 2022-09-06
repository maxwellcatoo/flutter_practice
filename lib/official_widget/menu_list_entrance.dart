import 'package:flutter/material.dart';
import 'package:flutter_practice/official_widget/notifier/notifier_menu.dart';
import 'package:flutter_practice/official_widget/progress_indicator/progress_indicator_menu.dart';
import '_common/common_widget.dart';
import '_common/label_widget.dart';
import 'button/button_menu.dart';
import 'containerWidget/menu_container.dart';

class MenuListEntrance extends StatefulWidget {
  const MenuListEntrance({Key? key}) : super(key: key);

  @override
  State<MenuListEntrance> createState() => _MenuListEntranceState();
}

class _MenuListEntranceState extends State<MenuListEntrance> {
  List<LabelWidget> list = [
    LabelWidget(mainTitle: "button",subTitle: "按钮类组件", widget: const MenuButton()),
    LabelWidget(mainTitle: "notifier",subTitle: "各种notifier类的使用", widget: const MenuNotifier()),
    LabelWidget(mainTitle: "progressIndicator", subTitle: "进度组件", widget: const MenuProgressIndicator()),
    LabelWidget(mainTitle: "布局组件", subTitle: "布局组件", widget: const MenuContainer()),
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
          separatorBuilder: (context, _) => Divider(
                indent: 0,
                endIndent: 0,
                color: Colors.black.withOpacity(.7),
              ),
          itemCount: list.length),
    );
  }
}
