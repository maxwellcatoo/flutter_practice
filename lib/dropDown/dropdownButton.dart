import 'package:flutter/material.dart';

class DropDownList extends StatefulWidget {
  const DropDownList({Key? key}) : super(key: key);

  @override
  State<DropDownList> createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  dynamic dropdownValue;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22.5),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.06,
        decoration: const BoxDecoration(
          color: Colors.blueAccent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            const Padding(
              padding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text(
                "text bar",
                style: TextStyle(
                  color: Colors.white,
                  height: 1.2,
                  fontSize: 20.0,
                ),
              ),
            ),

            //added
            /// 这里是下拉框部分
            Container(
                width: 150.0,
                // decoration: const BoxDecoration(
                //   boxShadow: [
                //     BoxShadow(
                //       offset: Offset(0, 1),
                //       color: Colors.orange,
                //       spreadRadius: 1,
                //       blurRadius: 20)
                //   ]
                // ),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  // borderRadius: const BorderRadius.all(Radius.circular(8)),
                  style: const TextStyle(
                    shadows: [
                      BoxShadow(
                        offset: Offset(0, 5),
                        color: Colors.orange,
                        spreadRadius: 1,
                        blurRadius: 2)
                    ]
                  ),
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  iconEnabledColor: Colors.white,
                  dropdownColor: Colors.blueAccent,
                  underline: const SizedBox(),
                  onChanged: (newValue) async {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>[
                    'English',
                    'Spanish',
                    'Dutch',
                    'Polish',
                    "French",
                    "German"
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child:
                      Text(value, style: const TextStyle(color: Colors.white)),
                    );
                  }).toList(),
                ))
            //end added
          ],
        ),
      ),
    );
  }
}


