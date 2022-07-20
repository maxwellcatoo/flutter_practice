// 示例2
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class MSSocketRouter2 extends StatefulWidget {
  const MSSocketRouter2({Key? key}) : super(key: key);

  @override
  State<MSSocketRouter2> createState() => _MSSocketRouter2State();
}

class _MSSocketRouter2State extends State<MSSocketRouter2> {
  late MSSocketManager _manager;

  @override
  void initState() {
    super.initState();
    _manager = MSSocketManager(host: "baidu.com", port: 80);
    _manager.connectSocket();
    Timer(const Duration(seconds: 6), () {
      print(_manager.mSocket);
      _manager.writeMsg();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}

class MSSocketManager {
  MSSocketManager({required this.host, required this.port});

  String host;
  int port;
  Socket? mSocket;

  void connectSocket() async {
    try {
      Socket.connect(host, port, timeout: Duration(seconds: 5)).then((socket) {
        mSocket = socket;
        print('---------连接成功------------$mSocket');
        _onSuccess();

        //onData：收到socket消息处理的回调
        //onError：scoket发生错误时回调
        //onDone：流关闭或者消息事件发送完成后回调
        socket.listen(_onReceivedMsg,
            onError: _onError, onDone: _onDone, cancelOnError: false);
      });
    } catch (e) {
      print("连接socket出现异常,e=${e.toString()}");
    }
  }

  void writeMsg() async {
    if (mSocket != null) {
      mSocket!.writeln("GET / HTTP/1.1");
      mSocket!.writeln("Host:baidu.com");
      mSocket!.writeln("Connection:close");
      mSocket!.writeln();
      // 发送
      await mSocket!.flush();
    }
  }

  _onSuccess() {
    print("Socket onSuccess callback");
  }

  _onReceivedMsg(event) {
    // 将Uint8List 转 String fromCharCodes 或者 utf8.decode
    // String s = String.fromCharCodes(event);
    String a = utf8.decode(event);
    print("Socket _onReceivedMsg $a");
    print("Socket _onReceivedMsg callback $event ${event.runtimeType}");
  }

  _onError(e) {
    print("Socket _onError callback $e");
  }

  _onDone() {
    print("Socket _onDone callback");
  }
}