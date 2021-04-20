package com.example.get_gsf;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** GetGsfPlugin */
public class GetGsfPlugin implements FlutterPlugin, MethodCallHandler {
  private MethodChannel channel;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "get_gsf");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getGsf")) {
      Uri URI = Uri.parse("content://com.google.android.gsf.gservices");
      String ID_KEY = "android_id";
      String params[] = {ID_KEY};
      Cursor c = activity.getContentResolver().query(URI, null, null, params, null);
      if (!c.moveToFirst() || c.getColumnCount() < 2) {
          result.error("1", "Error getting Gsf", "");
      }
      try
      {
          result.success(Long.toHexString(Long.parseLong(c.getString(1))));
      }
      catch (NumberFormatException e)
      {
          result.error("1", "Error getting Gsf", "");
      }
    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
