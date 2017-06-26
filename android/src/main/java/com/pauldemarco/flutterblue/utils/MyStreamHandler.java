package com.pauldemarco.flutterblue.utils;

import io.flutter.plugin.common.EventChannel.StreamHandler;
import io.flutter.plugin.common.EventChannel.EventSink;

public class MyStreamHandler implements StreamHandler {
        public EventSink eventSink;

        @Override
        public void onListen(Object o, EventSink eventSink) {
            this.eventSink = eventSink;
        }

        @Override
        public void onCancel(Object o) {
            eventSink = null;
        }
    };