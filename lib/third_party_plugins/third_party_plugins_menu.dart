import 'package:flutter/material.dart';
import 'package:flutter_practice/official_widget/_common/common_widget.dart';
import 'package:flutter_practice/official_widget/_common/label_widget.dart';
import 'package:flutter_practice/third_party_plugins/percent_indicator/percent_indicator_demo.dart';


class MenuThirdPartyPlugins extends StatefulWidget {
  const MenuThirdPartyPlugins({Key? key}) : super(key: key);

  @override
  State<MenuThirdPartyPlugins> createState() => _MenuThirdPartyPluginsState();
}

class _MenuThirdPartyPluginsState extends State<MenuThirdPartyPlugins> {
  List<LabelWidget> buttons = [
    LabelWidget(
        mainTitle: "PercentIndicatorDemo",
        subTitle: "进度条插件percent_indicator",
        widget: const PercentIndicatorDemo()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "第三方插件Demo菜单列表", true),
      body: ListView.separated(
          itemBuilder: (context, index) {
            var item = buttons[index];
            return ListTile(
                title: Text(item.mainTitle),
                subtitle: Text(item.subTitle),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return item.widget;
                  }));
                });
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: buttons.length),
    );
  }
}
