package com.pauldemarco.flutterblue.utils;

import io.flutter.plugin.common.EventChannel.StreamHandler;
import io.flutter.plugin.common.EventChannel.EventSink;

public class MyStreamHandler implements StreamHandler {
        private EventSink eventSink;

        @Override
        public void onListen(Object o, EventSink eventSink) {
            this.eventSink = eventSink;
        }

        @Override
        public void onCancel(Object o) {
            eventSink = null;
        }

        public void onNext(Object o) {
            if(eventSink != null) {
                eventSink.success(o);
            }
        }

        public void onError(String tag, Throwable t) {
            if(eventSink != null) {
                eventSink.error(tag, t.getMessage(), t);
            }
        }
    }