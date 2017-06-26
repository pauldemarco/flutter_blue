package com.pauldemarco.flutterblue;

import java.util.List;
import java.util.Map;

import rx.Single;

/**
 * Created by paul on 6/14/17.
 */

public abstract class Device {

    public enum State {
        DISCONNECTED,
        CONNECTING,
        CONNECTED,
        LIMITED
    }

    public abstract Guid getGuid();

    public abstract Map<String, Object> toMap();

    public abstract boolean isConnected();

    public abstract boolean connect(boolean autoConnect);

    public abstract void disconnect();

    public abstract void stateChanged(State state);

    public abstract Single<List<Service>> getServices();

    public abstract Single<Service> getService(Guid id);

    public abstract Single<Boolean> updateRssi();

    public abstract Single<Integer> requestMtu(int requestValue);

}
