import 'package:flutt/common/dbHelper.dart';
import 'package:flutt/common/operateDatabase.dart';
import 'package:flutter/material.dart';
// import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import 'Global.dart';
import 'common/uploaded_assets.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  /// 初始化加载本地上传记录
  /*void _loadData(BuildContext context) async {
    await DbHelper().getDb(); // 确认数据库开启
    int startTime = DateTime.now().millisecondsSinceEpoch;
    Global.waitAssets.then((_) async {
      List assetsList =
          await DbOperate.getTables(UploadAssets()); // 上传图片的表中的所有数据
      int len = assetsList.length;
      if (assetsList.isNotEmpty) {
        List<Future<AssetEntity?>>? list = List.filled(len, Future.value());
        assetsList.forEach((asset) async {
          int index = len - assetsList.indexOf(asset) - 1;
          list[index] = list[index].then((_) async {
            return await AssetEntity.fromId(asset.picId); // 根据资源id,返回资源文件
          });
        });

        // 更新完list列表中的值后，对list进行操作
        for (var item in list) {
          AssetEntity? asset = await item;
          if (asset != null) {
            Global.uploadedAssets.add(asset);
          }
        }

        debugPrint(
            "${assetsList.length}=======${Global.uploadedAssets.length}=====================解析花的时间: ${DateTime.now().millisecondsSinceEpoch - startTime}");
      }
    });
  }*/

  void startApp() {
    // _loadData(context);
    // Global.i18n = I18n.of(context);
    Navigator.popAndPushNamed(context, "menu_button");
  }

  @override
  void dispose() {
    // todo 开启第一次分享检查
    // todo 开启全局监听
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: TextButton(
            onPressed: startApp,
            child: const Text(
              "启动",
              style: TextStyle(fontSize: 30),
            )));
  }
}
