import 'package:flutter/material.dart';
import 'package:flutter_practice/official_widget/_common/common_widget.dart';

class ContainerWidget extends StatefulWidget {
  const ContainerWidget({Key? key}) : super(key: key);

  @override
  State<ContainerWidget> createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Container", true),
      body: Column(
        children: [
          const SizedBox(height: 50,),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.zero,
            //容器内补白，属于decoration的装饰范围
            // color: Colors.grey[200]!,
            // 背景色
            decoration: const BoxDecoration(color: Colors.green),
            // 背景装饰
            // foregroundDecoration: const BoxDecoration(color: Colors.blue),
            //前景装饰
            width: 100,
            //容器的宽度
            height: 100,
            //容器的高度
            constraints: const BoxConstraints(),
            //容器大小的限制条件
            margin: const EdgeInsets.only(top: 0, bottom: 0),
            //容器外补白，不属于decoration的装饰范围
            transform: Matrix4.rotationZ(3.14),
            //变换
            child: const Text("Container子元素"),
          ),
          const SizedBox(height: 50,),
          const Text("Flutter的Decoration可以设置：背景色 背景图 边框 圆角 阴影 渐变色 的等属性"),
          const Text("BoxDecoration:实现边框、圆角、阴影、形状、渐变、背景图像"),
          const Text("ShapeDecoration:实现四边分别指定颜色和宽度、底部线、矩形边色、圆形边色、体育场（竖向椭圆）、 角形（八边角）边色"),
          const Text("FlutterLogoDecoration:Flutter图片"),
          const Text(" UnderlineTabindicator:下划线"),
        ],
      ),
    );
  }
}
