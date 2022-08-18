

import 'DbHelper.dart';

abstract class Table {
  int? id;

  String getTableName();

  Map<String, Object> toMap();

  String createTableSql();

  Table fromMap(Map<String, dynamic> map);
}

class SingleDevice extends Table {
  String name = "";
  String xid = "";
  bool selected = false;
  String ip = "";
  int port = 8081;
  bool onlyUpload = false;
  String deviceFactory = ""; //设备生产商
  String deviceType = ""; //设备型号-大分类
  String deviceNumber = ""; //设备型号-小分类
  int width = 0; //设备分辨率宽
  int height = 0; //设备分辨率高
  late String _baseIp;
  late String baseApi;
  late String baseImg;
  bool onlyPic = false; // 仅选择图片
  bool compress = false; //压缩图片

  // 构造函数
  SingleDevice(
      {this.name = "",
      this.xid = "",
      this.ip = "",
      this.port = 8081,
      this.onlyUpload = false,
      this.deviceFactory = "",
      this.deviceType = "",
      this.deviceNumber = "",
      this.width = 1920,
      this.height = 1080,
      this.onlyPic = false,
      this.compress = false}) {
    _initDevice();
  }

  // 使用map中携带的数据初始化 SimpleDevice 实例
  SingleDevice.fromMap(Map<String, dynamic> map){
    id = map["id"] as int;
    xid = map["xid"];
    name = map["name"];
    ip = map["ip"];
    port = map["port"] as int;
    onlyUpload = (map["onlyUpload"] as int) == 1;
    deviceFactory = map["deviceFactory"];
    deviceNumber = map["deviceNumber"];
    deviceType = map["deviceType"];
    width = map["width"];
    height = map["height"];
    onlyPic = (map["onlyPic"] as int) == 1;
    compress = (map["compress"] as int) == 1;
    _initDevice();
  }

  _initDevice() {
    if(name == ""){
      name = "$deviceType-$deviceNumber";
    }
    _baseIp = "http://$ip/";
    baseApi = "${_baseIp}api/";
    baseImg = "${_baseIp}cloud/";
  }

  SingleDevice copy() {
    return SingleDevice(
        name: name,
        xid: xid,
        ip: ip,
        port: port,
        onlyUpload: onlyUpload,
        deviceFactory: deviceFactory,
        deviceNumber: deviceNumber,
        deviceType: deviceType,
        width: width,
        height: height,
        onlyPic: onlyPic,
        compress: compress);
  }

  @override
  String getTableName() {
    return DbHelper.deviceList;
  }

  @override
  Map<String, Object> toMap() {
    var map = <String, Object>{
      "name": name,
      "xid": xid,
      "ip": ip,
      "port": port,
      "onlyUpload": onlyUpload ? 1 : 0,
      "deviceFactory": deviceFactory,
      "deviceType": deviceType,
      "deviceNumber": deviceNumber,
      "width": width,
      "height": height,
      "compress": compress ? 1 : 0,
      "onlyPic": onlyPic ? 1 : 0
    };
    if(id != null){
      map['id'] = id as Object;
    }
    return map;
  }

  @override
  String createTableSql() {
    return "";
  }



  @override
  Table fromMap(Map<String, dynamic> map) {
    return SingleDevice.fromMap(map);
  }

  @override
  String toString(){
    return "id:$id,xid:$xid,ip:$ip,name:$name,onlyUpload:$onlyUpload,onlyPic:$onlyPic,compress:$compress,width:$width,height:$height";
  }
}
