import 'package:flutter/services.dart';

import 'flutter_plugin_test.dart';

class NativePlugin {

  static void setupMethodChannel() {
    FlutterPluginTest.hybridStackManagerPlugin
        .setMethodCallHandler((MethodCall methodCall) async {
      String method = methodCall.method;
      if (method == 'printTest') {
        print('printTestprintTestprintTestprintTest');
      }
    });
  }
}