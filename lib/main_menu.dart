import 'package:flutter/material.dart';
import 'package:flutter_practice/third_party_plugins/third_party_plugins_menu.dart';

import 'official_widget/_common/common_widget.dart';
import 'official_widget/_common/label_widget.dart';
import 'official_widget/menu_list_entrance.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  List<LabelWidget> list = [
    LabelWidget(mainTitle: "official_widget",subTitle: "官方插件", widget: const MenuListEntrance()),
    LabelWidget(mainTitle: "third_party_plugins",subTitle: "第三方插件", widget: const MenuThirdPartyPlugins()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "各类组件入口列表", false),
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
