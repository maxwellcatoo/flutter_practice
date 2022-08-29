import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PercentIndicatorDemo extends StatefulWidget {
  const PercentIndicatorDemo({Key? key}) : super(key: key);

  @override
  State<PercentIndicatorDemo> createState() => _PercentIndicatorDemoState();
}

class _PercentIndicatorDemoState extends State<PercentIndicatorDemo>
    with TickerProviderStateMixin {
  late TabController _controller;

  List<Widget> labelTabs = const [
    Tab(
      child: Text("圆形进度条"),
    ),
    Tab(
      child: Text("条形进度条"),
    )
  ];

  @override
  void initState() {
    _controller = TabController(length: labelTabs.length, vsync: this);
    _controller.addListener(() {
      print(_controller.index);
    });
    super.initState();
  }

  // 圆形进度条
  Widget circularPercent(){
    return Center(
      child: ListView(children: <Widget>[
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(child: CircularPercentIndicator(
              radius: 80.0,
              lineWidth: 10.0,
              percent: 0.8,
              header: const Text("Icon header"),
              center: const Icon(
                Icons.person_pin,
                size: 50.0,
                color: Colors.blue,
              ),
              backgroundColor: Colors.grey,
              progressColor: Colors.blue,
            ),),
            Expanded(child: CircularPercentIndicator(
              radius: 80.0,
              animation: true,
              animationDuration: 1200,
              lineWidth: 15.0,
              percent: 0.4,
              center: const Text(
                "40 hours",
                style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              circularStrokeCap: CircularStrokeCap.butt,
              backgroundColor: Colors.yellow,
              progressColor: Colors.red,
            ),)
          ],
        ),
        Row(
          children: [
            Expanded(child: CircularPercentIndicator(
              radius: 80.0,
              lineWidth: 13.0,
              animation: true,
              percent: 0.7,
              center: const Text(
                "70.0%",
                style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              footer: const Text(
                "Sales this week",
                style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Colors.purple,
            )),
            Expanded(child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: CircularPercentIndicator(
                radius: 80.0,
                lineWidth: 5.0,
                percent: 1.0,
                center: const Text("100%"),
                progressColor: Colors.green,
              ),
            ))
          ],
        ),
        Container(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(child: CircularPercentIndicator(
                radius: 45.0,
                lineWidth: 4.0,
                percent: 0.10,
                center: const Text("10%"),
                progressColor: Colors.red,
              )),
              Expanded(child: CircularPercentIndicator(
                radius: 45.0,
                lineWidth: 4.0,
                percent: 0.30,
                center: const Text("30%"),
                progressColor: Colors.orange,
              )),
              Expanded(child: CircularPercentIndicator(
                radius: 45.0,
                lineWidth: 4.0,
                percent: 0.60,
                center: const Text("60%"),
                progressColor: Colors.yellow,
              )),
              Expanded(child: CircularPercentIndicator(
                radius: 45.0,
                lineWidth: 4.0,
                percent: 0.90,
                center: const Text("90%"),
                progressColor: Colors.green,
              ))
            ],
          ),
        )
      ]),
    );
  }
  // 条形进度条
  Widget linearPercent(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: LinearPercentIndicator(
              width: 140.0,
              lineHeight: 14.0,
              percent: 0.5,
              center: const Text(
                "50.0%",
                style: TextStyle(fontSize: 12.0),
              ),
              trailing: const Icon(Icons.mood),
              linearStrokeCap: LinearStrokeCap.roundAll,
              backgroundColor: Colors.grey,
              progressColor: Colors.blue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: LinearPercentIndicator(
              width: 170.0,
              animation: true,
              animationDuration: 1000,
              lineHeight: 20.0,
              leading: const Text("left content"),
              trailing: const Text("right content"),
              percent: 0.2,
              center: const Text("20.0%"),
              linearStrokeCap: LinearStrokeCap.butt,
              progressColor: Colors.red,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: LinearPercentIndicator(
              width: MediaQuery.of(context).size.width - 50,
              animation: true,
              lineHeight: 20.0,
              animationDuration: 2000,
              percent: 0.9,
              center: const Text("90.0%"),
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: Colors.greenAccent,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: LinearPercentIndicator(
              width: MediaQuery.of(context).size.width - 50,
              animation: true,
              lineHeight: 20.0,
              animationDuration: 2500,
              percent: 0.8,
              center: const Text("80.0%"),
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: Colors.green,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                LinearPercentIndicator(
                  width: 100.0,
                  lineHeight: 8.0,
                  percent: 0.2,
                  progressColor: Colors.red,
                ),
                LinearPercentIndicator(
                  width: 100.0,
                  lineHeight: 8.0,
                  percent: 0.5,
                  progressColor: Colors.orange,
                ),
                LinearPercentIndicator(
                  width: 100.0,
                  lineHeight: 8.0,
                  percent: 0.9,
                  progressColor: Colors.blue,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Percent Indicators"),
        ),
        body: DefaultTabController ( // 感觉这个DefaultTabController完全没有作用啊，写不写都可以，其length属性不和items长度一致也OK
          length: labelTabs.length,
          child: Scaffold(
            appBar: AppBar(
              title: TabBar(
                controller: _controller,
                tabs: labelTabs,
                labelPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.blue,
                // indicatorPadding: EdgeInsets.only(top: 10),
              ),
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: TabBarView(controller: _controller, children: [
              // 圆形进度条
              circularPercent(),
              // 条形进度条
              linearPercent(),
            ]),
          ),
        ));
  }
}
