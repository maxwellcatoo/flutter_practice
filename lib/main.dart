import 'package:flutt/Start.dart';
import 'package:flutt/practice/Practice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'common/deviceProvider.dart';
import 'dropDown/popupMenuButton.dart';
import 'flutter_app/ProcessPage.dart';
import 'networkSocket/MSSocketRouter2.dart';
import 'official_widget/button_menu.dart';

enum ScreenDirection {
  horizontal, // 横屏
  vertical // 竖屏
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

// 路由添加
  final routes = {
    "dropdown": (context) => const SelectWidget(),
    "networkSocket": (context) => const MSSocketRouter2(),
    "practice": (context) => const PracticePage(),
    "flutter_app": (context) => const ProcessPage(),
    "menu_button": (context) => const MenuButton(),
  };

  void setScreenDir(ScreenDirection dir) {
    WidgetsFlutterBinding
        .ensureInitialized(); // main中的系统方法runApp已经调用了这个方法，这里应该没必要再写这行代码了吧...NO!,这行代码是配合强制横竖屏使用的，不写确实不行
    switch (dir) {
      case ScreenDirection.horizontal:
        // 强制横屏
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight
        ]);
        break;
      case ScreenDirection.vertical:
        // 强制竖屏
        SystemChrome.setPreferredOrientations(
            [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // 设置屏幕方向
    setScreenDir(ScreenDirection.vertical);
    // 添加provider
    return ChangeNotifierProvider<DeviceProvider>(
        create: (context) => DeviceProvider(),
        child: MaterialApp(
            title: "title",
            home: const Start(),
            // 设置路由
            onGenerateRoute: (RouteSettings settings) {
              final String name = settings.name!;
              final Function? pageContentBuilder = routes[name];
              // if(settings.)
              final Route route = MaterialPageRoute(
                  builder: (context) => pageContentBuilder!(context));
              return route;
            }));
  }
}
