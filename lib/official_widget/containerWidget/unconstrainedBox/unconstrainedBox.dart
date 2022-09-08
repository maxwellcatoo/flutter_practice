import 'package:flutter/material.dart';
import 'package:flutter_practice/official_widget/_common/common_widget.dart';

class UnconstrainedBoxWidget extends StatefulWidget {
  const UnconstrainedBoxWidget({Key? key}) : super(key: key);

  @override
  State<UnconstrainedBoxWidget> createState() => _UnconstrainedBoxWidgetState();
}

class _UnconstrainedBoxWidgetState extends State<UnconstrainedBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "UnconstrainedBox", true),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          const Text(
            "添加UnconstrainedBox控件",
            style: TextStyle(color: Colors.blue),
          ),
          const Text(
              "使用ConstrainedBox添加限制条件，child属性使用UnconstrainedBox移除父级添加的限制条件。父元素背景色为灰色"),
          Container(
            constraints: const BoxConstraints(minWidth: 90.0, minHeight: 100.0),
            color: Colors.grey,
            child: UnconstrainedBox(
              // 去除父元素限制
              child: Container(
                color: Colors.green,
                constraints:
                    const BoxConstraints(minWidth: 60.0, minHeight: 20),
                child: Text("不"),
              ),
            ),
          ),
          const Text(
            "假如不加UnconstrainedBox",
            style: TextStyle(color: Colors.blue),
          ),
          const Text("父元素背景色为灰色"),
          Container(
            color: Colors.grey,
            constraints: const BoxConstraints(minWidth: 90.0, minHeight: 100.0),
            child: Container(
              color: Colors.orange,
              constraints:
                  const BoxConstraints(minWidth: 60.0, minHeight: 20.0),
              child: Text("不"),
            ),
          ),
          const Text(
              "总结：UnconstrainedBox确实可以移除父元素添加的限制条件，但是，发现一个特性: 加了UnconstrainedBox以后，其后代元素的Text元素内字体将会失去自动换行的功能"),

          Container(
            color: Colors.green,
            width: 100,
            height: 100,
            child: UnconstrainedBox(
              child: Container(
                color: Colors.blue,
                width: 150,
                height: 100,
              ),
            ),
          ),
          Divider(height: 100,),
          Container(
            color: Colors.green,
            width: 100,
            height: 100,
            child: Container(
              color: Colors.blue,
              width: 100,
              height: 100,
            ),
          ),
          const Text("对width/height的约束也可以移除，但是，因为对flutter各布局元素和flutter渲染时的详细渲染不太清楚，所以这里的情况暂时没有搞清楚。")
        ],
      ),
    );
  }
}
