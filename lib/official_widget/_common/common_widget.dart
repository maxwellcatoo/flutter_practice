import 'package:flutter/material.dart';

/// 返回appBar
AppBar getAppBar(BuildContext context, String title, bool showBack){
  return AppBar(
    title: Text(title, style: const TextStyle(color: Colors.white),),
    centerTitle: true,
    leading: showBack ? backButton(context, Colors.white) : null,
    backgroundColor: Theme.of(context).primaryColor,
    elevation: 0,
  );
}
// 自定义左边返回按钮
Widget backButton(BuildContext context, Color? color) {
  return IconButton(
    onPressed: Navigator.of(context).maybePop,
    tooltip: MaterialLocalizations.of(context).backButtonTooltip,
    icon: Icon(Icons.arrow_back, color: color),
  );
}