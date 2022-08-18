import 'package:flutter/material.dart';

class MenuNotifier extends StatefulWidget {
  const MenuNotifier({Key? key}) : super(key: key);

  @override
  State<MenuNotifier> createState() => _MenuNotifierState();
}

class _MenuNotifierState extends State<MenuNotifier> {
  List<Widget> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("official_notifier_menuList"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return list[index];
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: list.length),
    );
  }
}
