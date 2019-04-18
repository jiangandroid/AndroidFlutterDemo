package com.example.flutter_plugin_test;

import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/**
 * FlutterPluginTestPlugin
 */
public class FlutterPluginTestPlugin implements MethodCallHandler {
    public static MethodChannel channel;

    /**
     * Plugin registration.
     */
    public static void registerWith(Registrar registrar) {

        final FlutterPluginTestPlugin plugin = new FlutterPluginTestPlugin();

        channel = new MethodChannel(registrar.messenger(), "flutter_plugin_test");
        channel.setMethodCallHandler(new FlutterPluginTestPlugin());

        // 上报播放器的状态的EventChannel
        EventChannel status_channel = new EventChannel(registrar.messenger(), "flutter_music_plugin.event.status");
        status_channel.setStreamHandler(new EventChannel.StreamHandler() {
            @Override
            public void onListen(Object o, EventChannel.EventSink eventSink) {
                // 把eventSink存起来
//        plugin.setStateSink(eventSink);
            }

            @Override
            public void onCancel(Object o) {

            }
        });
        //上报播放进度的EventChannel
        EventChannel position_channel = new EventChannel(registrar.messenger(), "flutter_music_plugin.event.position");
        position_channel.setStreamHandler(new EventChannel.StreamHandler() {
            @Override
            public void onListen(Object o, EventChannel.EventSink eventSink) {
                // 把eventSink存起来
//        plugin.setPositionSink(eventSink);
            }

            @Override
            public void onCancel(Object o) {

            }
        });
    }

    @Override
    public void onMethodCall(MethodCall call, Result result) {
        if (call.method.equals("getPlatformVersion")) {
            result.success("Android " + android.os.Build.VERSION.RELEASE);
        } else {
            result.notImplemented();
        }
    }
}
