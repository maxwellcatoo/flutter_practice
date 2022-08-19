import 'package:flutter/material.dart';
import 'package:flutter_practice/official_widget/_common/common_widget.dart';
import 'package:flutter_practice/official_widget/_common/label_widget.dart';

import 'official_button_widget/dropDown/popupMenuButton.dart';
import 'official_button_widget/dropdown_button.dart';

class MenuButton extends StatefulWidget {
  const MenuButton({Key? key}) : super(key: key);

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  List<LabelWidget> buttons = [
    LabelWidget(mainTitle: "DropdownButton",subTitle: "下拉菜单按钮1", widget: const DropdownButtonWidget()),
    LabelWidget(mainTitle: "DropdownButton2",subTitle: "下拉菜单按钮2", widget: const DropdownButtonWidget()),
    LabelWidget(mainTitle: "PopupMenuButton", subTitle: "弹出框菜单栏", widget: const SelectDemoPage()),
  ];
  bool? _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(context, "按钮菜单列表页", true),
        body: Checkbox(
          value: _isSelected,
          activeColor: Colors.red, //选中时的颜色
          onChanged: (value) {
            setState(() {
              _isSelected = value;
            });
          },
        )
        // ListView.separated(
        //     itemBuilder: (context, index) {
        //       return buttons[index];
        //     },
        //     separatorBuilder: (context, index) {
        //       return const Divider();
        //     },
        //     itemCount: buttons.length),
        );
  }
}
