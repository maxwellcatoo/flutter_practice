// 在构造函数里，添加需要监听的值
import 'package:flutter/cupertino.dart';

// 继承ValueNotifier类,并扩展其功能
class FavoriteNotifier extends ValueNotifier<List<String>> {
  FavoriteNotifier(List<String> value) : super(value);

  // 添加、移除元素
  void toggleFavorite(String item) {
    if (!value.contains(item)) {
      value.add(item);
    } else {
      value.remove(item);
    }
    notifyListeners(); // 调用notifyListener方法，是为了让侦听器获得通知
  }

  // 清空收藏
  void clearFavorites() {
    value.clear();
    notifyListeners();
  }

  // 获取收藏的元素个数
  int counts(){
    return value.length;
  }
}
