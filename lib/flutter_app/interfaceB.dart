import 'package:flutter/cupertino.dart';

class InterfaceB extends StatefulWidget {
  const InterfaceB({Key? key}) : super(key: key);

  @override
  State<InterfaceB> createState() => _InterfaceBState();
}

class _InterfaceBState extends State<InterfaceB> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("页面B"),
    );
  }
}
