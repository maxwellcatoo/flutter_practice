import 'package:flutter/cupertino.dart';

class DeviceGroup {
  String? groupTitle;
  List<GroupItem> content;

  DeviceGroup(this.groupTitle, this.content);
}

class GroupItem {
  String preSrc;
  String behindSrc;
  String mainTitle;
  String? subTitle;
  void Function()? onPressed;

  GroupItem(this.preSrc, this.behindSrc, this.mainTitle,
      {this.subTitle, this.onPressed});
}
