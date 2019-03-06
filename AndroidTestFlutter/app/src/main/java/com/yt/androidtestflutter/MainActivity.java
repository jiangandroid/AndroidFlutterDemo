package com.yt.androidtestflutter;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;

import com.taobao.hybridstackmanager.XURLRouter;

import java.util.HashMap;

public class MainActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.placeholder);
        setTitle("Native Root Page");
        setupOperationBtns();
    }

    void setupOperationBtns() {
        LinearLayout layout = findViewById(R.id.native_root);
        final Button btn = new Button(this);
        btn.setLayoutParams(new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));
        btn.setText("Click to jump Flutter");
        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                HashMap<String, Object> m = new HashMap<>();
                m.put("flutter", true);
                XURLRouter.sharedInstance().openUrlWithQueryAndParams("hrd://fdemo", m, null);
            }
        });
        layout.addView(btn);
    }
}
