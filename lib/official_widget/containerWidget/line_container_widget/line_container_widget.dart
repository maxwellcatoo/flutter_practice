import 'package:flutter/material.dart';
import 'package:flutter_practice/official_widget/_common/common_widget.dart';

class LineContainerWidget extends StatefulWidget {
  const LineContainerWidget({Key? key}) : super(key: key);

  @override
  State<LineContainerWidget> createState() => _LineContainerWidgetState();
}

class _LineContainerWidgetState extends State<LineContainerWidget>
    with TickerProviderStateMixin {
  late TabController _controller;
  List<Text> tabList = [
    const Text("Column/Row"),
    const Text("Wrap"),
    const Text("Stack"),
    const Text("Flow"),
    const Text("Align/center"),
  ];

  Widget getColumnRowWidget() {
    return Column(
      children: [
        Text("竖向排列"),
        Container(
          color: Colors.orange,
          child: Text("Column1"),
        ),
        Container(
          color: Colors.green,
          child: Text("Column2"),
        ),
        Container(
          color: Colors.blue,
          child: Text("Column3"),
        ),
        Text("横向排列"),
        Container(
          color: Colors.orange,
          child: Text("Row1"),
        ),
        Container(
          color: Colors.green,
          child: Text("Row2"),
        ),
        Container(
          color: Colors.blue,
          child: Text("Row3"),
        ),
      ],
    );
  }

  Widget getWrapWidget() {
    return Column(
      children: [
        Text("横向"),
        Wrap(
          direction: Axis.horizontal,
          spacing: 8.0,
          // 主轴（水平）方向间距
          runSpacing: 4.0,
          // 纵轴（垂直）方向间距
          alignment: WrapAlignment.center,
          // 沿主轴方向居中
          children: const [
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  "怪",
                  style: TextStyle(fontSize: 13),
                ),
              ),
              label: Text("1哥斯拉（横）"),
            ),
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("奥", style: TextStyle(fontSize: 13)),
              ),
              label: Text("2迪迦奥特曼（横）"),
            ),
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("究", style: TextStyle(fontSize: 13)),
              ),
              label: Text("3战斗暴龙兽（横）"),
            ),
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("润", style: TextStyle(fontSize: 13)),
              ),
              label: Text("4富强民主文明和谐（横）"),
            ),
          ],
        ),
        Text("纵向"),
        Wrap(
          direction: Axis.vertical,
          spacing: 8.0,
          // 主轴（水平）方向间距
          runSpacing: 4.0,
          // 纵轴（垂直）方向间距
          alignment: WrapAlignment.center,
          // 沿主轴方向居中
          runAlignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: const [
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  "怪",
                  style: TextStyle(fontSize: 13),
                ),
              ),
              label: Text("1哥斯拉（纵）"),
            ),
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("奥", style: TextStyle(fontSize: 13)),
              ),
              label: Text("2迪迦奥特曼（纵）"),
            ),
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("究", style: TextStyle(fontSize: 13)),
              ),
              label: Text("3战斗暴龙兽（纵）"),
            ),
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("润", style: TextStyle(fontSize: 13)),
              ),
              label: Text("4富强民主文明和谐"),
            ),
          ],
        ),
      ],
    );
  }

  Widget getStackWidget() {
    return Stack(
      alignment: Alignment.center,
      //默认对齐方式    Alignment.center其实就是Alignment(0.0, 0.0)
      children: const <Widget>[
        Text("我是居中的"),
        Positioned(
          // 使用Positioned在Stack中定位
          left: 20.0,
          child: Text("我在左边"),
        ),
        Positioned(
          top: 20.0,
          child: Text("我在上边"),
        )
      ],
    );
  }

  Widget getFlowWidget() {
    return Text("getFlowWidget");
  }

  Widget getAlignWidget() {
    return Column(
      children: [
        const Text("定位单个组件在⽗组件中的相对位置"),
        Container(
          color: Colors.green,
          width: 300,
          height: 300,
          child: Align(
            alignment: Alignment.center,
            child: Container(
              color: Colors.blue,
              width: 50,
              height: 50,
            ),
          ),
        ),
        Align(
          alignment: Alignment(1, -1),
          child: Container(
            color: Colors.blue,
            height: 100,
            width: 200,
            child: const Text(
              "Alignment(1,-1)属性，虽然Alignment的y参数为-1，应该出现在父元素顶部位置，但是因为父元素是Column，上边有元素，占着位置上不去，如果父元素是Stack，可以上去",
              style: TextStyle(fontSize: 10),
            ),
          ),
        ),
        Align(
          alignment: Alignment(-1, -1),
          child: Container(
            width: 50,
            height: 50,
            color: Colors.orange,
            child: Text(
              "黄色的也是,上不去",
              style: TextStyle(fontSize: 10),
            ),
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    _controller = TabController(length: tabList.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "线性布局", true),
      body: DefaultTabController(
        length: tabList.length,
        child: Scaffold(
          appBar: AppBar(
            title: TabBar(
              controller: _controller,
              tabs: tabList,
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
          body: TabBarView(controller: _controller, children: [
            getColumnRowWidget(),
            getWrapWidget(),
            getStackWidget(),
            getFlowWidget(),
            getAlignWidget()
          ]),
        ),
      ),
    );
  }
}
