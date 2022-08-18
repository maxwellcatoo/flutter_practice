import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_practice/practice/Practice.dart';
import 'package:provider/provider.dart';
import 'Start.dart';
import 'flutter_app/ProcessPage.dart';
import 'flutter_app/common/deviceProvider.dart';
import 'networkSocket/MSSocketRouter2.dart';
import 'official_widget/button/button_menu.dart';
import 'official_widget/button/official_button_widget/dropDown/popupMenuButton.dart';
import 'official_widget/notifier/notifier_menu.dart';

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
    // 按钮控件菜单
    "menu_button": (context) => const MenuButton(),
    // notifier系列菜单
    "notifier": (context) => const MenuNotifier(),
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
          primaryColor: Colors.lightBlue  // 设置appBar的背景色，假如对应位置没有单独设置的appBar的话
        ),
        debugShowCheckedModeBanner: false, // 是否显示右上角的debug标志，默认为true
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
