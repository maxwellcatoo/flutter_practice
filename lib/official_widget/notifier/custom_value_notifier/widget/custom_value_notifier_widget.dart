import 'package:flutter/material.dart';

import '../custom_value_notifier.dart';

class CustomValueNotifierWidget extends StatelessWidget {
  CustomValueNotifierWidget({Key? key}) : super(key: key);

  final List<String> fruits = [
    "Mango",
    "Cashew",
    "Grape",
    "Guava",
    "Coconut",
    "Orange"
  ];

  @override
  Widget build(BuildContext context) {
    final favoriteNotifier = FavoriteState.of(context).favoriteNotifier;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favorite Fruits",
        ),
        centerTitle: true,
        // backgroundColor: Colors.amber,
        actions: const [
          Icon(Icons.favorite),
          FavoriteCount()
        ],
      ),
      body: ListView.separated(
        itemCount: fruits.length,
        separatorBuilder: (context, __) => const Divider(
          indent: 30,
          endIndent: 30,
        ),
        itemBuilder: (context, index) {
          final fruit = fruits[index];
          return ValueListenableBuilder(
              valueListenable: favoriteNotifier,
              builder: (context, List<String> value, _) {
                return ListTile(
                  leading: Icon(
                    Icons.local_florist,
                    color: value.contains(fruit)
                        ? Colors.orange
                        : Colors.grey[600],
                  ),
                  title: Text(
                    fruit,
                  ),
                  onTap: () {
                    favoriteNotifier.toggleFavorite(fruit);
                  },
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.clear),
          onPressed: () {
            favoriteNotifier.clearFavorites();
          }),
    );
  }
}

class FavoriteCount extends StatelessWidget {
  const FavoriteCount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoriteNotifier = FavoriteState.of(context).favoriteNotifier;
    return ValueListenableBuilder(
      valueListenable: favoriteNotifier,
      builder: (context, List<String> value, __){
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Text(value.length.toString()),
          ),
        );
      },
    );
  }

  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class FavoriteState extends InheritedWidget {
  final FavoriteNotifier favoriteNotifier;

  const FavoriteState(
      {required this.favoriteNotifier, required Widget child, Key? key})
      : super(key: key, child: child);

  // 调用子组件
  static FavoriteState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FavoriteState>()!; // fixme 这里一直报错，我不知道为啥，之前一直没啥问题的呀
  }

  // todo 很好奇，InheritedWidget特性中所谓的自上而下的共享数据特性，是否可以达到在父组件数据变化后，子组件自动更新的效果。
  //  todo 如果可以，那么，在这个例子中，使用自定义的ValueNotify的意义在哪里？还是说，因为updateShouldNotify的更新条件过于粗略，所以这里使用ValueNotify是非常必要的？？？
  @override
  bool updateShouldNotify(FavoriteState oldWidget) {
    return oldWidget.favoriteNotifier.value != favoriteNotifier.value;
  }
}

class MyAppCustomValueNotifierWidget extends StatelessWidget {
  MyAppCustomValueNotifierWidget({Key? key}) : super(key: key);

  final List<String> favoriteList = [];

  @override
  Widget build(BuildContext context) {
    return FavoriteState(
        favoriteNotifier: FavoriteNotifier(favoriteList),
        child: MaterialApp(
          theme: ThemeData(primarySwatch: Colors.blue),
          debugShowCheckedModeBanner: false,
          home: CustomValueNotifierWidget(),
        ));
  }
}
