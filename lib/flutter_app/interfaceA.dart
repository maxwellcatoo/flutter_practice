import 'package:flutter/cupertino.dart';

class InterfaceA extends StatefulWidget {
  const InterfaceA({Key? key}) : super(key: key);

  @override
  State<InterfaceA> createState() => _InterfaceAState();
}

class _InterfaceAState extends State<InterfaceA> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("页面A"),
    );
  }
}
