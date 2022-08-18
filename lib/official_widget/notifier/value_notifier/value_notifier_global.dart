import 'package:flutter/cupertino.dart';
import 'package:flutter_practice/official_widget/notifier/value_notifier/widget/value_notifier_home_page.dart';

class GlobalValueNotifier {
  static late List<Item> itemList = <Item>[];
  static late ValueNotifier<List<Item>> notifierItemList = ValueNotifier(<Item>[]);

  static Widget myWidget = const HomeValueNotifier();
  static void init(){
    itemList = <Item>[Item("item1","12"),Item("item2","22")];
    notifierItemList.value = [Item("notifierItem", "21"),Item("notifierItem2","20")];
  }
}


class Item {
  String name;
  String age;
  Item(this.name, this.age);

  @override
  String toString() {
    return "name: $name   age: $age";
  }
}