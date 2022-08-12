import 'package:flutter/cupertino.dart';

class InterfaceC extends StatefulWidget {
  const InterfaceC({Key? key}) : super(key: key);

  @override
  State<InterfaceC> createState() => _InterfaceCState();
}

class _InterfaceCState extends State<InterfaceC> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("页面C"),
    );
  }
}
