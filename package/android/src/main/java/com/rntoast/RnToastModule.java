package com.rntoast;

import android.app.Application;

import androidx.annotation.NonNull;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.module.annotations.ReactModule;
import com.hjq.toast.ToastParams;
import com.hjq.toast.Toaster;
import com.hjq.toast.style.WhiteToastStyle;


@ReactModule(name = RnToastModule.NAME)
public class RnToastModule extends ReactContextBaseJavaModule {
  public static final String NAME = "RnToast";

  public ReactApplicationContext context;

  public RnToastModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.context = reactContext;

  }

  //写一个初始化的方法,传入Application
  public static void init(Application application) {
    Toaster.init(application);
  }

  @Override
  @NonNull
  public String getName() {
    return NAME;
  }


  //显示Toast 信息
  @ReactMethod
  public void show(String message) {
    Toaster.show(message);
  }

  // 延迟显示 Toast
  @ReactMethod
  public void showDelay(String message, int delay) {
    Toaster.delayedShow(message, delay);
  }

  // 显示短 Toast
  @ReactMethod
  public void showShort(String message) {
    Toaster.showShort(message);
  }

  // 显示长 Toast
  @ReactMethod
  public void showLong(String message) {
    Toaster.showLong(message);
  }

  // 取消 Toast
  @ReactMethod
  public void cancel() {
    Toaster.cancel();
  }

  //白色背景黑色字体的Toast
  @ReactMethod
  public void showWhite(String message) {
    ToastParams params = new ToastParams();
    params.text = message;
    params.style = new WhiteToastStyle();
    Toaster.show(params);
  }

}
