import 'package:flutter/material.dart';

AppBar getAppBar(BuildContext context, String title, bool showBack){
  return AppBar(
    title: Text(title),
    centerTitle: true,
  );
}