import 'package:flutter/material.dart';
import 'package:flutter_practice/official_widget/_common/common_widget.dart';
import 'package:flutter_practice/official_widget/_common/label_widget.dart';

import 'official_button_widget/dropDown/popupMenuButton.dart';
import 'official_button_widget/dropdown_button.dart';
import 'official_button_widget/usual_buttons.dart';

class MenuButton extends StatefulWidget {
  const MenuButton({Key? key}) : super(key: key);

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  List<LabelWidget> buttons = [
    LabelWidget(
        mainTitle: "UsualButtons",
        subTitle: "单个按钮",
        widget: const UsualButtonsWidget()),
    LabelWidget(
        mainTitle: "DropdownButton",
        subTitle: "下拉菜单按钮",
        widget: const DropdownButtonWidget()),
    LabelWidget(
        mainTitle: "PopupMenuButton",
        subTitle: "弹出框菜单栏",
        widget: const SelectDemoPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "按钮菜单列表页", true),
      body: ListView.separated(
          itemBuilder: (context, index) {
            var item = buttons[index];
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
          itemCount: buttons.length),
    );
  }
}
