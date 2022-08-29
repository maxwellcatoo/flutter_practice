import 'package:flutter/material.dart';
import 'package:flutter_practice/official_widget/_common/common_widget.dart';

class MenuItem {
  String label; // 显示的文本
  dynamic value; // 选中的值
  bool checked; // 是否选中

  MenuItem({this.label = '', this.value, this.checked = false});
}

/// @author longzipeng
/// @创建时间：2022/3/30
/// 弹出菜单按钮组件
class SelectWidget extends StatefulWidget {
  final List<MenuItem> items; // 显示的内容
  final dynamic value; // 当前选中的值
  final String? title; // 选择框前的标题
  final String tooltip; // 提示语
  final ValueChanged<dynamic>? valueChanged; // 选中数据的回调事件
  const SelectWidget(
      {Key? key,
        this.items = const [],
        this.value,
        this.valueChanged,
        this.title,
        this.tooltip = "点击选择"})
      : super(key: key);

  @override
  State<SelectWidget> createState() => _SelectWidgetState();
}

class _SelectWidgetState extends State<SelectWidget> {
  String label = '请选择';
  bool isExpand = false; // 是否展开下拉按钮
  dynamic currentValue; // 此时的值

  @override
  void initState() {
    currentValue = widget.value;
    super.initState();
  }

  /// 根据当前的value处理当前文本显示
  void initTitle() {
    if (currentValue != null) {
      // 有值查值
      for (MenuItem item in widget.items) {
        if (item.value == currentValue) {
          label = item.label;
          break;
        }
      }
    } else {
      // 没值默认取第一个
      if (widget.items.isNotEmpty) {
        label = widget.items[0].label;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    initTitle();
    return Wrap(
      children: [
        if (widget.title != null)
          Text(widget.title!, style: const TextStyle(fontSize: 18)),
        PopupMenuButton<String>(
          // initialValue: currentValue,
          tooltip: widget.tooltip,
          offset: const Offset(25, 30),
          enableFeedback: true,
          child: Listener(
            // 使用listener事件能够继续传递
            onPointerDown: (event) {
              setState(() {
                isExpand = !isExpand;
              });
            },
            child: Wrap(
              children: [
                Text(
                  label,
                  style: const TextStyle(fontSize: 18),
                ),
                isExpand
                    ? const Icon(Icons.arrow_drop_up)
                    : const Icon(Icons.arrow_drop_down)
              ],
            ),
          ),
          onSelected: (value) {
            widget.valueChanged?.call(value);
            setState(() {
              currentValue = value;
              isExpand = !isExpand;
            });
          },
          onCanceled: () {
            // 取消展开
            setState(() {
              isExpand = false;
            });
          },
          itemBuilder: (context) {
            return widget.items
                .map(
                  (item) => item.value == currentValue
                  ? PopupMenuItem<String>(
                value: item.value,
                child: Text(
                  item.label,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor),
                ),
              )
                  : PopupMenuItem<String>(
                value: item.value,
                child: Text(item.label),
              ),
            )
                .toList();
          },
        )
      ],
    );
  }
}


/// @author longzipeng
/// @创建时间：2022/3/30
/// 下拉选择demo
class SelectDemoPage extends StatefulWidget {
  const SelectDemoPage({Key? key}) : super(key: key);

  @override
  State<SelectDemoPage> createState() => _SelectDemoPageState();
}

class _SelectDemoPageState extends State<SelectDemoPage> {
  String value = "1";

  /// 下拉选择值改变
  selectChange(value) {
    print("值改变了：$value");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "弹出框菜单栏", true),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SelectWidget(
            items: [
              MenuItem(label: "张飞", value: '1'),
              MenuItem(label: "关羽", value: '2'),
              MenuItem(label: "刘备", value: '3'),
              MenuItem(label: "圆头儿子", value: '4'),
              MenuItem(label: "大头爸爸", value: '5'),
              MenuItem(label: "小头妈妈", value: '6'),
            ],
            value: value,
            valueChanged: selectChange,
          ),
        ],
      ),
    );
  }
}