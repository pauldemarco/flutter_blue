package com.pauldemarco.flutterblue.utils;

import android.util.Log;

import io.flutter.plugin.common.EventChannel.StreamHandler;
import io.flutter.plugin.common.EventChannel.EventSink;

public class MyStreamHandler implements StreamHandler {
    private static final String TAG = "MyStreamHandler";

    private EventSink eventSink;

    @Override
    public void onListen(Object o, EventSink eventSink) {
        Log.d(TAG, "onListen: ");
        this.eventSink = eventSink;
    }

    @Override
    public void onCancel(Object o) {
        Log.d(TAG, "onCancel: ");
        eventSink = null;
    }

    public void onNext(Object o) {
        if (eventSink != null) {
            eventSink.success(o);
            Log.d(TAG, "onNext: " + o.toString());
        }
    }

    public void onError(String tag, Throwable t) {
        if (eventSink != null) {
            eventSink.error(tag, t.getMessage(), null);
        }
    }
}