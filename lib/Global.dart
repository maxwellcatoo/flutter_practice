
// import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import 'common/device.dart';

class Global {
  static SingleDevice device = SingleDevice();


  // 在进入上传界面前等待已经加载完数据库里面所有的已上传资源
  // fixme  这个到底是啥？不明白
  static Future waitAssets = Future.value();

  // 记录已经上传的图片
  // static List<AssetEntity> uploadedAssets = [];
}

class DemoGlobal {
  static int processIndex = 0;
}