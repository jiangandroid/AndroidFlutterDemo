import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  static const platform = const MethodChannel('yt.flutter.plugin');

  @override
  void initState() {
    platform.setMethodCallHandler(methodHandler);
    super.initState();
  }

  // 接收原生平台的方法调用处理
  Future methodHandler(MethodCall call) async {
    switch (call.method) {
      case 'showPrint':
        print('xxxxxxxxxxx');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: new Text('HomePage'),
      ),
      body: new RaisedButton(
        child: new Text("btn"),
        onPressed: () async {
//            final int result = await FlutterPluginTest.getBatteryLevel();
//            print(result);
          platform
              .invokeMethod('pluginTest', {'message': '111111111111111111111'});
          platform.invokeMethod(
              'Toast', {'flutter': 'flutterflutterflutterflutterflutter'});
          platform.invokeMethod('nextPage');
        },
      ),
    );
  }
}
