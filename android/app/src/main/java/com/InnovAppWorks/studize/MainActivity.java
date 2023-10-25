package com.InnovAppWorks.studize;
import io.flutter.app.FlutterApplication;
import android.content.Context;
import androidx.multidex.MultiDex;

import io.flutter.embedding.android.FlutterActivity;
class MainApplication extends FlutterApplication {
    @Override
    protected void attachBaseContext(Context base) {
        super.attachBaseContext(base);
        MultiDex.install(this);
    }
}

public class MainActivity extends FlutterActivity {
}
