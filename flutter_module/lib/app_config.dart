import 'package:flutter/material.dart';
import 'package:hybrid_stack_manager/hybrid_stack_manager_plugin.dart';

import 'fdemo.dart';

class AppConfig {
  static final AppConfig _singleton = new AppConfig._internal();
  static final GlobalKey gHomeItemPageWidgetKey =
      new GlobalKey(debugLabel: "[KWLM]");

  static AppConfig sharedInstance() {
    Router.sharedInstance().globalKeyForRouter = gHomeItemPageWidgetKey;
    Router.sharedInstance().routerWidgetHandler =
        ({RouterOption routeOption, Key key}) {
      if (routeOption.url == "hipac://fdemo") {
        return new FDemoWidget(routeOption, key: key);
      }
      return null;
    };
    return _singleton;
  }

  AppConfig._internal() {}
}
