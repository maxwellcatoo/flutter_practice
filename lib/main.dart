import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_practice/practice/Practice.dart';
import 'package:provider/provider.dart';
import 'Start.dart';
import 'flutter_app/ProcessPage.dart';
import 'flutter_app/common/deviceProvider.dart';
import 'main_menu.dart';
import 'networkSocket/MSSocketRouter2.dart';
import 'official_widget/button/button_menu.dart';
import 'official_widget/button/official_button_widget/dropDown/popupMenuButton.dart';
import 'official_widget/menu_list_entrance.dart';
import 'official_widget/notifier/custom_value_notifier/widget/custom_value_notifier_widget.dart';
import 'official_widget/notifier/notifier_menu.dart';

enum ScreenDirection {
  horizontal, // 横屏
  vertical // 竖屏
}

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    // Brightness.light 状态栏字体颜色（白色）
    // statusBarIconBrightness: Brightness.dark, // 状态栏字体颜色（黑色）
    // statusBarColor: Colors.yellow, // 状态栏背景色
  ));
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
    // 各控件Demo入口
    "main_menu": (context) => const MainMenu(),
    // 官方控件Demo入口
    // "menu_list": (context) => const MenuListEntrance(),
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
        theme: ThemeData(
            primaryColor: Colors.lightBlue // 设置appBar的背景色，假如对应位置没有单独设置的appBar的话
            ),
        debugShowCheckedModeBanner: false,
        // 是否显示右上角的debug标志，默认为true
        home: const Start(),
        // 设置路由
        onGenerateRoute: (RouteSettings settings) {
          final String name = settings.name!;
          final Function? pageContentBuilder = routes[name];
          final Route route = MaterialPageRoute(
              builder: (context) => pageContentBuilder!(context));
          return route;
        },
        // todo 比对一下，上边的onGenerateRoute和下边的onGenerateRoute设置的区别
        // onGenerateRoute: (RouteSettings settings) {
        //   String name = settings.name!;
        //   Function? pageContentBuilder = routes[name];
        //   if (pageContentBuilder != null) {
        //     if (settings.arguments != null) {
        //       return MaterialPageRoute(
        //           builder: (context) => pageContentBuilder(context),
        //           settings: settings);
        //     } else {
        //       return MaterialPageRoute(
        //           builder: (context) => pageContentBuilder(context));
        //     }
        //   } else {
        //     return MaterialPageRoute(
        //         builder: (context) => const Center(child: Text("404页面")),
        //         settings: settings);
        //   }
        // },
      ),
    );
  }
}
