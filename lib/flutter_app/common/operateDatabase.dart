import 'package:sqflite/sqflite.dart';

import 'DbHelper.dart';
import 'device.dart';
import 'uploaded_assets.dart';

/// 数据操作类
/// 参考链接：https://www.jb51.net/article/244214.htm
class DbOperate {
  static Database? _db;
  static late Batch _batch;
  static final List<Table> _tables = [
    SingleDevice(),
    UploadAssets()
  ]; // app所需的所有表都要放在这里
  static Future<Database> _checkDb() async {
    if(_db == null){
      _db = await DbHelper.instance.getDb();
      _batch = _db!.batch();
      for(Table table in DbHelper.instance.tables){
        // 循环执行语句创建表
        _batch.execute(table.createTableSql());
      }
      await _batch.commit();
    }
    return _db!;
  }

  // 接受SingleDevice增加内容
  static Future insertOrUpdate(Table table) async {
    await _checkDb();
    return await _db!.insert(table.getTableName(), table.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static getTables(Table table) async {
    await _checkDb();
    List<Map<String, dynamic>> maps = await _db!.query(table.getTableName());
    List<Table> res = [];
    for(var map in maps){
      res.add(table.fromMap(map));
    }
    return res;
  }

  /// 增
  static insert(String text) {
    // 去重
    queryAll().then((value) {
      bool isAdd = true;
      for (var data in value) {
        if (data.name == text) {
          isAdd = false;
          break;
        }
      }
      if (isAdd) {
        DbHelper.instance.getDb()?.then((value) => value.insert(
              DbHelper.deviceList,
              DbSearchHotBean(name: text).toJson(),
            ));
      }
    });
  }

  /// 删 全部
  static deleteAll() {
    DbHelper.instance.getDb()?.then((value) => value.delete(
          DbHelper.deviceList,
        ));
  }

  /// 更新数据 通过id更新表内具体行的数据
  static update(DbSearchHotBean dbSearchHotBean) {
    DbHelper.instance.getDb()?.then((value) =>
        value.update(DbHelper.deviceList, dbSearchHotBean.toJson(), //具体更新的数据
            where: "id = ?", //通过id查找需要更新的数据
            whereArgs: [dbSearchHotBean.id]));
  }

  /// 通过name查具体的实体类
  static Future<DbSearchHotBean?> getBean(String name) async {
    var db = await DbHelper.instance.getDb();
    var maps = await db?.query(DbHelper.deviceList,
        columns: ['id', 'name'], // 获取实体类的哪些字段 默认全部
        where: 'name = ?', //通过实体类中的name字段
        whereArgs: [name]); //具体name的值 限定数据
    if (maps != null && maps.isNotEmpty) {
      return DbSearchHotBean.fromJson(maps.first);
    }
    return null;
  }

  /// 查 全部all
  static Future<List<DbSearchHotBean>> queryAll() async {
    List<DbSearchHotBean> list = [];
    await DbHelper.instance
        .getDb()
        ?.then((db) => db.query(DbHelper.deviceList).then((value) {
              for (var data in value) {
                list.add(DbSearchHotBean.fromJson(data));
              }
            }));
    return list;
  }
}

/// 配合数据库查询的类
class DbSearchHotBean {
  int? id;
  String? name; // 搜索词

  DbSearchHotBean({this.id, required this.name});

  DbSearchHotBean.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, String?> toJson() {
    var map = <String, String?>{};
    map['id'] = id?.toString();
    map['name'] = name ?? "";

    return map;
  }
}
