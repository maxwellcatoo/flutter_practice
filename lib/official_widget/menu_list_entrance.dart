import 'package:flutter/material.dart';
import '_common/common_widget.dart';

class MenuListEntrance extends StatefulWidget {
  const MenuListEntrance({Key? key}) : super(key: key);

  @override
  State<MenuListEntrance> createState() => _MenuListEntranceState();
}

class _MenuListEntranceState extends State<MenuListEntrance> {
  List<Widget> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "各官方组件菜单列表", true),
      body: ListView.separated(
          itemBuilder: (context, index) {
            var item = list[index];
            return item;
          },
          separatorBuilder: (context, _) => const Divider(
                indent: 30,
                endIndent: 30,
              ),
          itemCount: list.length),
    );
  }
}
