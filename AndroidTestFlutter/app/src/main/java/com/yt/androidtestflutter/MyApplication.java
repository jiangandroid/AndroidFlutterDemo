package com.yt.androidtestflutter;

import android.net.Uri;

import com.taobao.hybridstackmanager.XURLRouter;
import com.taobao.hybridstackmanager.XURLRouterHandler;

import java.util.HashMap;

import io.flutter.app.FlutterApplication;

/**
 * Created by xiyou on 2019/3/6
 */
public class MyApplication extends FlutterApplication implements XURLRouterHandler {
    @Override
    public void onCreate() {
        super.onCreate();
        XURLRouter.sharedInstance().setAppContext(getApplicationContext());
        XURLRouter.sharedInstance().setNativeRouterHandler(this);
    }

    @Override
    public Class openUrlWithQueryAndParams(String url, HashMap query, HashMap params) {
        Uri tmpUri = Uri.parse(url);
        if ("ndemo".equals(tmpUri.getHost())) {
            return XDemoActivity.class;
        }
        return null;
    }
}
