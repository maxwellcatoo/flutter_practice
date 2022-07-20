
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class MSSocketRouter extends StatefulWidget {
  const MSSocketRouter({Key? key}) : super(key: key);

  @override
  State<MSSocketRouter> createState() => _MSSocketRouterState();
}

class _MSSocketRouterState extends State<MSSocketRouter> {
  Socket? _listSocket;
  Socket? _fileSocket;

  Future<String>? result;

  Future<String> clientLink() async {
    try {
      // 建立连接
      _listSocket = await Socket.connect("baidu.com", 80);
      // 编辑发送内容
      _listSocket?.writeln("GET / HTTP/1.1");
      _listSocket?.writeln("Host:baidu.com");
      _listSocket?.writeln("Connection:close");
      _listSocket?.writeln();
      // 发送
      await _listSocket?.flush();
      // 获取数据
      String result = await utf8.decoder.bind(_listSocket!).join();
      return result;
    } catch (e) {
      return "连接列表服务器失败    ${e.toString()}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TextButton(
            onPressed: () async {
              result = clientLink();
              setState(() {});
            },
            child: const Text("按钮"),
          ),
          FutureBuilder(
              future: result,
              builder: (context, snapshot) {
                return Text.rich(
                  TextSpan(text: snapshot.data.toString()),
                  textAlign: TextAlign.center,
                );
              })
        ],
      ),
    );
  }
}