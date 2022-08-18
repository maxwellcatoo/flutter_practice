import 'dart:typed_data';

class Practice {
  Practice();

  void run() async {
    List<int> list = 'hello'.codeUnits;
    Uint8List bytes = Uint8List.fromList(list);
    print(list);
    print(bytes);
    String string = String.fromCharCodes(bytes);
    print(string);

    print("--------------------");

    Uint8List _setFlag(int flag) {
      ByteData b = ByteData(4);
      b.setInt32(0, flag);
      return b.buffer.asUint8List();
    }

    ByteData aaa = ByteData(80);
    aaa.setInt32(aaa.lengthInBytes - 4, 100);
    print(aaa.buffer.asUint8List());
    const numList = [
      99,
      109,
    ];
    const numList2 = [
      26,
      43,
    ];
    print(String.fromCharCodes(aaa.buffer.asUint8List()));
    print(String.fromCharCodes(numList2));
    print(numList.length);

    demo() async {
      int times = 0;
      while (true) {
        print("开始循环:    第${times++}次");
        // break;
        if (times == 10) {
          break;
        }
        await Future.delayed(const Duration(milliseconds: 100));
      }
    }

    await demo();
  }
}
