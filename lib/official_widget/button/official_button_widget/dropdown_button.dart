import 'package:flutter/material.dart';

class DropdownButtonWidget extends StatefulWidget {
  const DropdownButtonWidget({Key? key}) : super(key: key);

  @override
  State<DropdownButtonWidget> createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {

  List animals = ["狮子", "老虎", "大象"];

  String defaultValue = "狮子";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("标题"),
        ),
        body: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 10,
                child: ListView.separated(
                  itemCount: animals.length,
                  separatorBuilder: (context, _) =>  Divider(thickness: 10,),
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(Icons.flag),
                      title: Text(animals[index]),
                      subtitle: DropdownButton<String>(
                        value: defaultValue,
                        items: const [
                          DropdownMenuItem(value: "狮子", child: Text("狮子child")),
                          DropdownMenuItem(value: "老虎", child: Text("老虎child")),
                          DropdownMenuItem(value: "大象", child: Text("大象child")),
                        ],
                        onChanged: (Object? value) {
                          defaultValue = value as String;
                          setState(() {});
                        },
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                flex: 0,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "RawMaterialButton",
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              Expanded(
                  flex: 5,
                  child: Container(
                    color: Colors.grey,
                    child: const ListTile(
                      selectedColor: Colors.red,
                      title: Text(
                        "底部",
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ))
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
