import 'device.dart';

class UploadAssets extends Table {
  // 资源对应id
  String picId = "";

  // 设备id
  String xid = "";

  // 资源对应crc
  int crc = 0;

  UploadAssets({this.picId = "", this.xid = "", this.crc = 0});

  UploadAssets.fromMap(Map<String, dynamic> map) {
    picId = map["picId"];
    xid = map["xid"];
    crc = map["crc"];
  }

  @override
  UploadAssets fromMap(Map<String, dynamic> map) {
    return UploadAssets.fromMap(map);
  }

  @override
  String getTableName() {
    return "uploaded_assets";
  }

  @override
  Map<String, Object> toMap() {
    Map map = <String, Object>{
      "picId": picId,
      "xid": xid,
      "crc": crc,
    };
    if (id != null) {
      map["id"] = id as Object;
    }
    return map as Map<String, Object>;
  }

  @override
  String createTableSql() {
    return '''CREATE TABLE IF NOT EXISTS ${getTableName()} (id INTEGER NOT NULL PRIMARY 
    KEY AUTOINCREMENT UNIQUE, picId TEXT NOT NULL, xid TEXT NOT NULL, crc INT NOT NULL)''';
  }

}
