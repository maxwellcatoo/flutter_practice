import 'package:flutter/material.dart';

class MenuButton extends StatefulWidget {
  const MenuButton({Key? key}) : super(key: key);

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  List<Widget> buttons = [];
  bool? _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("official_button_list"),
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
        ),
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
