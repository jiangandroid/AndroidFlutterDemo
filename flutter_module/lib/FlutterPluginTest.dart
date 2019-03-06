import 'dart:async';

import 'package:flutter/services.dart';

class FlutterPluginTest {
  static const _channel = const MethodChannel('android.flutter/plugin');

  static init() async {
    _channel.setMethodCallHandler(handler);
  }

  //获取电量值
  static Future<int> getBatteryLevel() async {
    return await _channel.invokeMethod('getBatteryLevel');
  }

  static Future<bool> toast(String msg) async {
    Map<String, String> map = {"flutter": msg};
    return await _channel.invokeMethod('Toast', map);
  }

  static Future<bool> toSplash() async {
    _channel.setMethodCallHandler(handler);
    return await _channel.invokeMethod('toSplash');
  }

  //接受Android对flutter的调用
  static StreamController<Map> _locationUpdateStreamController =
      new StreamController.broadcast();

  static Stream<Map> get locationUpdate =>
      _locationUpdateStreamController.stream;

  static Future<dynamic> handler(MethodCall call) {
    String method = call.method;

    switch (method) {
      case 'printMsg':
        print(call.arguments);
        _locationUpdateStreamController.add(call.arguments);
        break;
      case "onLocation":
        _locationUpdateStreamController.add(call.arguments);
        break;
    }
    return new Future.value("");
  }
}
