import 'dart:async';

import 'package:flutter/services.dart';

typedef Future<dynamic> MethodHandler(MethodCall call);

class FlutterPluginTest {
//  static const MethodChannel _channel =
//      const MethodChannel('flutter_plugin_test');
  static const EventChannel _status_channel =
      const EventChannel('flutter_music_plugin.event.status');
  static const EventChannel _position_channel =
      const EventChannel('flutter_music_plugin.event.position');

  static FlutterPluginTest hybridStackManagerPlugin =
      new FlutterPluginTest._internal();
  static MethodChannel _channel;
  MethodHandler _handler;

  void setMethodCallHandler(MethodHandler hdler) {
    _handler = hdler;
    _channel.setMethodCallHandler(_handler);
  }

  FlutterPluginTest._internal() {
    _channel = new MethodChannel('flutter_plugin_test');
  }

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
