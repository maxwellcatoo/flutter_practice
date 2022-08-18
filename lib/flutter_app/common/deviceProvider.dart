import 'package:flutter/cupertino.dart' as system;

import '../Global.dart';
import 'device.dart';
import 'operateDatabase.dart';

class DeviceProvider extends system.ChangeNotifier {
  final List<SingleDevice> _devices = [];
  SingleDevice? _currentDevice;
  double _width = 0;
  double _height = 0;

  double getWidth() {
    return _width;
  }

  double getHeight() {
    return _height;
  }

  setSize(double width, double height) {
    _width = width;
    _height = height;
  }

  List<SingleDevice> getDevices() {
    return _devices;
  }

  SingleDevice? getCurrentSingle() {
    return _currentDevice;
  }

  // 构造函数
  DeviceProvider() {
    _loadDevices(); //加载所有设备
  }

  void _loadDevices() async {
    /// 测试用的，用于给数据库添加列表
    // 首先把设备表中的所有数据删除
    DbOperate.deleteAll();
    dynamic d1 = SingleDevice(
        ip: "192.168.0.104",
        xid: "xxxx",
        onlyPic: true,
        width: 800,
        height: 1280,
        deviceType: "frame",
        deviceNumber: "L8");
    dynamic d2 =
        SingleDevice(name: "132-false", ip: "192.168.0.134", xid: "bbbbbb");
    dynamic d3 = SingleDevice(
        name: "pic",
        ip: "192.168.0.132",
        xid: "cccc",
        onlyPic: true,
        compress: true);

    await DbOperate.insertOrUpdate(d1);
    await DbOperate.insertOrUpdate(d2);
    await DbOperate.insertOrUpdate(d3);
    List<Table> list = DbOperate.getTables(SingleDevice());
    for(Table device in list){
      _devices.add(device as SingleDevice);
    }
    if(_devices.isNotEmpty){
      // 将列表中的第一台设备设置成当前设备
      Global.device = _devices.first.copy();
    }
    notifyListeners();
  }
}
