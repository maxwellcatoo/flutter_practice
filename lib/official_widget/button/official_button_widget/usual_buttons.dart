import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/official_widget/_common/common_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UsualButtonsWidget extends StatefulWidget {
  const UsualButtonsWidget({Key? key}) : super(key: key);

  @override
  State<UsualButtonsWidget> createState() => _UsualButtonsWidgetState();
}

enum systemType { android, ios, pc, mac }

class _UsualButtonsWidgetState extends State<UsualButtonsWidget>
    with TickerProviderStateMixin {
  late TabController _controller;
  bool switchVal = false;
  bool? checkboxVal = false;

  // 单选组件
  systemType? _radioVal = systemType.android;
  List<Widget> labelTab = [Text("基础按钮"), Text("特异化按钮"), Text("类按钮")];

  @override
  void initState() {
    _controller = TabController(length: labelTab.length, vsync: this);
    super.initState();
  }

  Widget basicButtonPageView() {
    List<Widget> list = [
      ListTile(
          leading: const Icon(Icons.smart_button),
          title: const Text("RaisedButton: 风格“凸起”的按钮"),
          subtitle: const Text("该按钮已不被官方推荐使用，可用ElevatedButton替代"),
          trailing: RaisedButton(
            child: const Text("RaisedButton"),
            onPressed: () {
              Fluttertoast.cancel();
              Fluttertoast.showToast(msg: "RaisedButton的onPressed, 点击一下触发");
            },
            onLongPress: () {
              Fluttertoast.cancel();
              Fluttertoast.showToast(msg: "RaisedButton的onLongPress, 长按触发");
            },
            elevation: 10, // 阴影
          )),
      ListTile(
          leading: const Icon(Icons.smart_button),
          title: const Text("ElevatedButton"),
          subtitle: const Text("RaisedButton的替代品"),
          trailing: ElevatedButton(
            child: const Text("ElevatedButton"),
            onPressed: () {
              Fluttertoast.cancel();
              Fluttertoast.showToast(msg: "ElevatedButton的onPressed, 点击一下触发");
            },
            onLongPress: () {
              Fluttertoast.cancel();
              Fluttertoast.showToast(msg: "ElevatedButton的onLongPress, 长按触发");
            },
          )),
      ListTile(
          leading: const Icon(Icons.smart_button),
          title: const Text("FlatButton: 扁平风格按钮"),
          subtitle: const Text("该按钮已不被官方推荐使用，可用TextButton替代"),
          trailing: FlatButton(
            child: const Text("FlatButton"),
            onPressed: () {
              Fluttertoast.cancel();
              Fluttertoast.showToast(msg: "FlatButton的onPressed, 点击一下触发");
            },
            onLongPress: () {
              Fluttertoast.cancel();
              Fluttertoast.showToast(msg: "FlatButton的onLongPress, 长按触发");
            },
          )),
      ListTile(
          leading: const Icon(Icons.smart_button),
          title: const Text("TextButton: 文本按钮，默认背景透明并不带阴影"),
          subtitle: const Text("FlatButton的替代品"),
          trailing: TextButton(
            child: const Text("TextButton"),
            onPressed: () {
              Fluttertoast.cancel();
              Fluttertoast.showToast(msg: "TextButton的onPressed, 点击一下触发");
            },
            onLongPress: () {
              Fluttertoast.cancel();
              Fluttertoast.showToast(msg: "TextButton的onLongPress, 长按触发");
            },
          )),
      ListTile(
          leading: const Icon(Icons.smart_button),
          title: const Text("OutlineButton: 带边框的按钮，不带阴影且背景透明"),
          subtitle: const Text("该按钮已不被官方推荐使用，可用OutlinedButton替代"),
          trailing: OutlineButton(
            child: const Text("OutlineButton"),
            onPressed: () {
              Fluttertoast.cancel();
              Fluttertoast.showToast(msg: "OutlineButton的onPressed, 点击一下触发");
            },
            onLongPress: () {
              Fluttertoast.cancel();
              Fluttertoast.showToast(msg: "OutlineButton的onLongPress, 长按触发");
            },
          )),
      ListTile(
          leading: const Icon(Icons.smart_button),
          title: const Text("OutlinedButton"),
          subtitle: const Text("OutlineButton的替代品"),
          trailing: OutlinedButton(
            child: const Text("OutlinedButton"),
            onPressed: () {
              Fluttertoast.cancel();
              Fluttertoast.showToast(msg: "OutlinedButton的onPressed, 点击一下触发");
            },
            onLongPress: () {
              Fluttertoast.cancel();
              Fluttertoast.showToast(msg: "OutlinedButton的onLongPress, 长按触发");
            },
          )),
      ListTile(
          leading: const Icon(Icons.smart_button),
          title: const Text("RawMaterialButton"),
          subtitle: const Text("RawMaterialButton"),
          trailing: RawMaterialButton(
            child: const Text("RawMaterialButton"),
            onPressed: () {
              Fluttertoast.cancel();
              Fluttertoast.showToast(
                  msg: "RawMaterialButton的onPressed, 点击一下触发");
            },
            onLongPress: () {
              Fluttertoast.cancel();
              Fluttertoast.showToast(
                  msg: "RawMaterialButton的onLongPress, 长按触发");
            },
          )),
    ];
    return ListView.separated(
        itemBuilder: (context, index) {
          var item = list[index];
          return item;
        },
        separatorBuilder: (context, __) => const Divider(
              thickness: 5,
            ),
        itemCount: list.length);
  }

  Widget specialButtonPageView() {
    List<Widget> list = [
      ListTile(
          leading: const Icon(Icons.smart_button),
          title: const Text("IconButton"),
          subtitle: const Text(
              "IconButton, 里面通常放Icon，不过icon字段接收的是Widget类型，放Text也Ok，size属性决定了IconButton是方形的，且默认size是24"),
          trailing: IconButton(
            icon: const Text("IconButton"),
            onPressed: () {
              Fluttertoast.cancel();
              Fluttertoast.showToast(msg: "IconButton的onPressed, 点击一下触发");
            },
          )),
      ListTile(
          leading: const Icon(Icons.smart_button),
          title: const Text("BackButton"),
          subtitle: const Text("BackButton, 只有一个color和onPressed属性"),
          trailing: BackButton(
            color: Colors.green,
            onPressed: () {
              Fluttertoast.cancel();
              Fluttertoast.showToast(msg: "BackButton的onPressed, 点击一下触发");
            },
          )),
      ListTile(
          leading: const Icon(Icons.smart_button),
          title: const Text("CloseButton"),
          subtitle: const Text("CloseButton, 也是只有一个color和onPressed属性"),
          trailing: CloseButton(
            color: Colors.green,
            onPressed: () {
              Fluttertoast.cancel();
              Fluttertoast.showToast(msg: "CloseButton的onPressed, 点击一下触发");
            },
          )),
      const ListTile(
        leading: Icon(Icons.smart_button),
        title: Text("CloseButton"),
        subtitle: Text(
            "ButtonBar 是一个放置和排列按钮的一个组件，与 Row、Column 有一点相似，该组件放到ListTile中会报错，所以如下所示: "),
      ),
      ButtonBar(
        alignment: MainAxisAlignment.spaceAround,
        overflowDirection: VerticalDirection.down, // button的排列顺序
        children: [
          TextButton(onPressed: () {}, child: const Text("TextButton")),
          IconButton(onPressed: () {}, icon: const Icon(Icons.add_circle)),
          BackButton(onPressed: () {}, color: Colors.orange)
        ],
      ),
      ListTile(
          leading: const Icon(Icons.smart_button),
          title: const Text("ToggleButtons"),
          subtitle:
              const Text("ToggleButtons，可以通过isSelected添加bool[]数组，区分显示按钮样式"),
          trailing: ToggleButtons(
            isSelected: const [true, false, true], // 表示是否添加点击效果，不影响各个按钮的点击回调
            children: [
              TextButton(
                child: const Text("第一个"),
                onPressed: () {
                  print("按了第一个");
                },
              ),
              TextButton(
                child: const Text("第二个"),
                onPressed: () {
                  print("按了第二个");
                },
              ),
              TextButton(
                child: const Text("第三个"),
                onPressed: () {
                  print("按了第三个");
                },
              ),
            ],
            onPressed: (int index) {
              print("index               $index");
            },
          )),
    ];
    return ListView.separated(
        itemBuilder: (context, index) {
          var item = list[index];
          return item;
        },
        separatorBuilder: (context, __) => const Divider(
              thickness: 5,
            ),
        itemCount: list.length);
  }

  Widget likeButNotButtonPageView() {
    List<Widget> list = [
      ListTile(
        leading: const Icon(Icons.smart_button),
        title: const Text("单选框"),
        subtitle: const Text("单选框，没啥可讲的"),
        trailing: Switch(
            value: switchVal,
            onChanged: (val) {
              setState(() {
                switchVal = val;
              });
            }),
      ),
      ListTile(
        leading: const Icon(Icons.smart_button),
        title: const Text("复选框"),
        subtitle: const Text("复选框，也没啥可讲的"),
        trailing: Checkbox(
            value: checkboxVal,
            onChanged: (val) {
              setState(() {
                checkboxVal = val;
              });
            }),
      ),
      const ListTile(
        leading: Icon(Icons.smart_button),
        title: Text("单选组件"),
        subtitle: Text(
            "如下所示：Radio是单选组件，直接使⽤需要多个Radio，并且配合对应的Text等描述，每个Radio点击还需要更新其它Radio或者整个页⾯。因此建议在项⽬内封装统⼀的单选控件，不要直接使⽤。"),
        trailing: null,
      ),
      Wrap(
        direction: Axis.horizontal,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Radio<systemType>(
                value: systemType.android,
                groupValue: _radioVal,
                onChanged: (val) {
                  setState(() {
                    _radioVal = val;
                  });
                },
              ),
              const Text("android")
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Radio<systemType>(
                value: systemType.ios,
                groupValue: _radioVal,
                onChanged: (val) {
                  setState(() {
                    _radioVal = val;
                  });
                },
              ),
              const Text("ios")
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Radio<systemType>(
                value: systemType.pc,
                groupValue: _radioVal,
                onChanged: (val) {
                  setState(() {
                    _radioVal = val;
                  });
                },
              ),
              const Text("pc")
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Radio<systemType>(
                value: systemType.mac,
                groupValue: _radioVal,
                onChanged: (val) {
                  setState(() {
                    _radioVal = val;
                  });
                },
              ),
              const Text("mac")
            ],
          ),
        ],
      )
    ];
    return ListView.separated(
        itemBuilder: (context, index) => list[index],
        separatorBuilder: (context, __) => const Divider(
              thickness: 5,
            ),
        itemCount: list.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(context, "flutter原生按钮组件", true),
        body: DefaultTabController(
          length: labelTab.length,
          child: Scaffold(
            appBar: AppBar(
              title: TabBar(
                controller: _controller,
                tabs: labelTab,
                labelPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.blue,
              ),
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: TabBarView(
              controller: _controller,
              children: [
                // 基础按钮
                basicButtonPageView(),
                // 特异化按钮
                specialButtonPageView(),
                // 类按钮组件
                likeButNotButtonPageView(),
              ],
            ),
          ),
        ));
  }
}

class _MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return new Rect.fromLTRB(0.0, 0.0, size.width - 300.0, size.height);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}
