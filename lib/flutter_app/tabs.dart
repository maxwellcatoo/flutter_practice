import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'interfaceA.dart';
import 'interfaceB.dart';
import 'interfaceC.dart';

class Tabs extends StatefulWidget {
  const Tabs(
      {Key? key,
      required this.tabList,
      required this.labelList,
      required this.iconList,
      this.defaultIndex = 1})
      : super(key: key);
  final List<Widget> tabList;
  final List<String> labelList;
  final List<Icon> iconList;
  final int defaultIndex;

  @override
  _Tabs createState() => _Tabs();
}

class _Tabs extends State<Tabs> {
  late final PageController controller;

  // static final GlobalKey<ListPageState> _globalKey = GlobalKey();
  int? _currentIndex;

  int get currentIndex {
    return _currentIndex ??= widget.defaultIndex;
  }

  set currentIndex(index) {
    if (index != _currentIndex) {
      _currentIndex = index;
    }
  }

  /// 初始化屏幕适配框架flutter_ScreenUtil
  void initScreenUtil() {
    // 初始化并设置适配尺寸及字体大小是否根据系统的“字体大小”辅助选项来进行缩放
    WidgetsFlutterBinding.ensureInitialized();
    //设置适配尺寸 (填入设计稿中设备的屏幕尺寸) 此处假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)
    ScreenUtil.init(context, designSize: const Size(750, 1334));
  }

  @override
  void initState() {
    controller = PageController(initialPage: widget.defaultIndex);
    controller.addListener(pageControllerListener);
    super.initState();
  }

  // 页面跳转
  void toThePage(int index) {
    // 在上传界面点击上传，进入上传照片流程
    if (index == _currentIndex && index == 1) {
      // todo 上传照片流程
      return;
    }
    if (index == _currentIndex) {
      return;
    }
    // 自定义动画
    controller.animateToPage(
      index,
      duration: kThemeAnimationDuration,
      curve: Curves.easeInOut,
    );
  }

  // pageController对应监听回调，刷新页面状态
  void pageControllerListener() {
    final int? currentPage = controller.page?.round();
    if (currentPage != null && currentPage != _currentIndex) {
      /*if(Global.needFlush && _pageList[_currentIndex].runtimeType == ListPage){
        _globalKey.currentState?.loadListByTcp();
      }*/
      setState(() {
        _currentIndex = currentPage;
      });
    }
  }

  List<BottomNavigationBarItem> getItems() {
    return widget.labelList.asMap().entries.map((entry) {
      int index = entry.key;
      String label = entry.value;
      Icon icon = widget.iconList[index];
      return BottomNavigationBarItem(icon: icon, label: label);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    initScreenUtil();
    return Scaffold(
      // appBar: getAppBar(I18n.of(context).app,context),
      body: PageView(
        controller: controller,
        children: widget.tabList,
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: toThePage,
          items: getItems()),
    );
  }
}

class BarItemData {
  Icon icon;
  String label;

  BarItemData(this.icon, this.label);
}
