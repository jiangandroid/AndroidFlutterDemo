package com.yt.androidtestflutter;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;

import com.example.flutter_plugin_test.FlutterPluginTestPlugin;
import com.taobao.hybridstackmanager.XURLRouter;

import java.util.HashMap;

public class XDemoActivity extends AppCompatActivity {
    static int sNativeActivityIdx = 0;

    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.placeholder);
        setupOperationBtns();
        sNativeActivityIdx++;
        setTitle(String.format("Native Demo Page(%d)", sNativeActivityIdx));
    }

    void setupOperationBtns() {
        LinearLayout layout = findViewById(R.id.native_root);
        Button btn = new Button(this);
        btn.setLayoutParams(new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));
        btn.setText("Click to jump Flutter");
        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                HashMap<String, Object> m = new HashMap<String, Object>();
                m.put("flutter", true);
                XURLRouter.sharedInstance().openUrlWithQueryAndParams("hipac://fdemo", m, null);
            }
        });
        layout.addView(btn);

        btn = new Button(this);
        btn.setLayoutParams(new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));
        btn.setText("Click to jump native");
        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                XURLRouter.sharedInstance().openUrlWithQueryAndParams("hipac://ndemo", null, null);

            }
        });
        layout.addView(btn);

        btn = new Button(this);
        btn.setLayoutParams(new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));
        btn.setText("printTest");
        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                FlutterPluginTestPlugin.channel.invokeMethod("printTest", null);
//                XURLRouter.sharedInstance().openUrlWithQueryAndParams("hrd://ndemo", null, null);

            }
        });
        layout.addView(btn);
    }
}
