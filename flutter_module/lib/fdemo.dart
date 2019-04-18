import 'package:flutter/material.dart';
import 'package:hybrid_stack_manager/hybrid_stack_manager_plugin.dart';
import 'package:flutter_plugin_test/flutter_plugin_test.dart';

class FDemoWidget extends StatefulWidget {
  RouterOption routeOption;

  FDemoWidget(RouterOption option, {Key key}) : super(key: key) {
    routeOption = option;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new FDemoWidgetState(routeOption);
  }
}

class FDemoWidgetState extends State<FDemoWidget> {
  RouterOption routeOption;
  String _version='不知道';

  FDemoWidgetState(RouterOption option) {
    routeOption = option;
  }

  @override
  Widget build(BuildContext context) {
    Map m = Utils.parseUniquePageName(routeOption.userInfo);
    return new Scaffold(
        appBar: new AppBar(
          leading: new GestureDetector(
              child: new Icon(
                Icons.arrow_back,
                color: Colors.red,
              ),
              onTap: () {
                HybridStackManagerPlugin.hybridStackManagerPlugin.popCurPage();
              }),
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: new Text(
            "Flutter Page(${m["id"]})",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: new Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(_version),
              new GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.blue,
                  width: 200.0,
                  height: 100.0,
                  child: Text(
                    "Click to open FlutterPage",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onTap: () => HybridStackManagerPlugin.hybridStackManagerPlugin
                    .openUrlFromNative(
                        url: "hipac://fdemo", query: {"flutter": true}), //点击
//                onDoubleTap: () => updateText("DoubleTap"), //双击
//                onLongPress: () => updateText("LongPress"), //长按
              ),
              new RaisedButton(
                child: new Text(
                  "Click to open FlutterPage",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  print('Click to open FlutterPage');
                  HybridStackManagerPlugin.hybridStackManagerPlugin
                      .openUrlFromNative(
                          url: "hipac://fdemo", query: {"flutter": true});
                },
              ),
              new RaisedButton(
                child: new Text(
                  "Click to open NativePage",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  HybridStackManagerPlugin.hybridStackManagerPlugin
                      .openUrlFromNative(url: "hipac://ndemo");
                },
              ),
              new RaisedButton(
                child: new Text(
                  "getPlatformVersion",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () async {
                  String platformVersion;
                  try {
                    platformVersion = await FlutterPluginTest.platformVersion;
                  } on Exception {
                    platformVersion = 'Failed to get platform version.';
                  }
                  setState(() {
                    _version = platformVersion;
                  });
                },
              )
            ],
          ),
        ),
        floatingActionButton:
            null // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
