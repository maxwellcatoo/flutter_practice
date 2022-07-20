import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// @Author: tzh
///
/// @CreateDate: 2021/8/30 11:46
///
/// @Description: 自定义步骤条
///

class StepsWidget extends StatefulWidget {
  const StepsWidget(
      {Key? key,
      required this.currentIndex,
      required this.items,
      required this.unCheckImgPath,
      required this.checkImgPath,
      /// 高度和宽度的单位全部为所占屏幕的百分比
      this.height = 0.08,
      this.width = 1,
      this.unCheckColor = Colors.grey,
      this.checkedColor = Colors.green,
      this.fontSize,
      this.scale = 1})
      : super(key: key);
  final int currentIndex;
  final List<String> items;
  final String unCheckImgPath;
  final String checkImgPath;
  final double height;
  final double width;
  final Color unCheckColor;
  final Color checkedColor;
  final double? fontSize;
  final double scale;

  @override
  _StepsWidgetState createState() => _StepsWidgetState();
}

class _StepsWidgetState extends State<StepsWidget> {
  /// 初始化屏幕适配框架flutter_ScreenUtil
  void initScreenUtil() {
    // 初始化并设置适配尺寸及字体大小是否根据系统的“字体大小”辅助选项来进行缩放
    WidgetsFlutterBinding.ensureInitialized();
    //设置适配尺寸 (填入设计稿中设备的屏幕尺寸) 此处假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)
    ScreenUtil.init(context, designSize: const Size(750, 1334));
  }

  final double staticScale = 0.9;

  // 子项目的宽高设置
  int get itemCounts => widget.items.length;

  double get itemWidth =>
      widget.width * widget.scale * staticScale / itemCounts;

  double get itemHeight => widget.height;

  @override
  Widget build(BuildContext context) {
    // 初始化屏幕
    initScreenUtil();
    return Container(
      color: Colors.white,
      height: widget.height.sh,
      alignment: Alignment.center,
      width: widget.width.sh,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: itemCounts,
          itemBuilder: (
            context,
            index,
          ) {
            //如果显示到最后一个并且Icon总数小于200时继续获取数据
            return _buildItem(index, itemWidth, itemHeight);
          }),
    );
  }

  Widget _buildItem(int index, double width, double height) {
    return Container(
      padding: EdgeInsets.only(top: (height / 6).sh),
      child: Column(
        children: [
          Row(
            children: [
              // 连接线
              Opacity(
                opacity: index == 0 ? 0 : 1,
                child: Container(
                  width: (width * 0.4).sw,
                  height: 1,
                  decoration: BoxDecoration(
                      color: index <= widget.currentIndex
                          ? widget.checkedColor
                          : widget.unCheckColor),
                ),
              ),
              // 图片
              Image.asset(
                index <= widget.currentIndex
                    ? widget.checkImgPath
                    : widget.unCheckImgPath,
                width: (width * 0.3).sw,
                height: (height / 3).sh,
              ),
              // 连接线
              Opacity(
                  opacity: widget.items.length - 1 == index ? 0 : 1,
                  child: Container(
                    width: (width * 0.4).sw,
                    height: 1,
                    decoration: BoxDecoration(
                      color: index < widget.currentIndex
                          ? widget.checkedColor
                          : widget.unCheckColor,
                    ),
                  ))
            ],
          ),
          // 文本
          Padding(
            padding: EdgeInsets.only(top: (height / 8).sh),
            child: Text(
              widget.items[index],
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: widget.fontSize ?? (height / 8).sh,
                  color: index <= widget.currentIndex
                      ? widget.checkedColor
                      : widget.unCheckColor),
            ),
          )
        ],
      ),
    );
  }
}
