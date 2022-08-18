import 'package:flutter/material.dart';

import '../value_notifier_global.dart';

class HomeValueNotifier extends StatefulWidget {
  const HomeValueNotifier({Key? key}) : super(key: key);

  @override
  State<HomeValueNotifier> createState() => _HomeValueNotifierState();
}

class _HomeValueNotifierState extends State<HomeValueNotifier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("value_notifier"),
          centerTitle: true,
          backgroundColor: Colors.amber),
      body: ValueListenableBuilder(
          valueListenable: GlobalValueNotifier.notifierItemList,
          builder: (context, List<Item> value, __) {
            return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: GlobalValueNotifier.itemList.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 50,
                    color: Colors.grey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(value.elementAt(index).name),
                        Text(value.elementAt(index).age)
                      ],
                    ),
                  );
                });
          }),
      floatingActionButton: TextButton(
        // 点击按钮更改valueNotifier包裹的值，触发更新
        onPressed: () {
          GlobalValueNotifier.notifierItemList.value = <Item>[
            Item("修改后的值", "19"),
            Item("修改后的值2", "18")
          ];
          GlobalValueNotifier.itemList = <Item>[
            Item("itemList修改后的值", "19"),
            Item("itemList修改后的值2", "18")
          ];
          print("=============${GlobalValueNotifier.notifierItemList.value}");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
