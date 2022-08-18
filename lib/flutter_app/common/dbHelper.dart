// 数据库帮助类
import 'package:flutter_practice/flutter_app/common/uploaded_assets.dart';
import 'package:sqflite/sqflite.dart';

import 'device.dart';

class DbHelper {
  // 数据库名称
  final String databaseName = "zpj_copy";

  // 数据库表名
  static const deviceList = "deviceList";

  // 私有构造
  DbHelper._();

  static DbHelper? _instance;

  static DbHelper getInstance() {
    _instance ??= DbHelper._();
    return _instance ?? DbHelper._();
  }

  static DbHelper get instance => getInstance();

  factory DbHelper() => instance;

  /// 数据库操作
  // 定义数据库
  Future<Database>? _db;

  List<Table> tables = [SingleDevice(), UploadAssets()];

  Future<Database>? getDb() {
    _db ??= _initDb();
    return _db;
  }

  // 数据库初始化
  Future<Database> _initDb() async {
    final db =
        await openDatabase(databaseName, version: 1, onCreate: (db, version) {
      // 如果不存在，则创建表
      db.execute(
          "create table $deviceList (id integer primary key autoincrement, name text not null)");
    },
            // 如果存在，执行升级操作
            onUpgrade: (db, oldV, newV) {});
    return db;
  }

  // 关闭数据库
  close() async {
    // await _db?.t
  }
}
