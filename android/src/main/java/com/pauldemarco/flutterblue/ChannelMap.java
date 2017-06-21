package com.pauldemarco.flutterblue;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * A helper class to make sure only "Channel Safe" objects are added to the map
 */

public class ChannelMap extends HashMap<String, Object> {

    @Deprecated
    @Override
    public String put(String key, Object value) {
        throw new IllegalArgumentException("Channel will not accept generic objects.");
    }

    public Object put(String key, Boolean value){
        return super.put(key, value);
    }

    public Object put(String key, Integer value){
        return super.put(key, value);
    }

    public Object put(String key, Long value){
        return super.put(key, value);
    }

    public Object put(String key, BigInteger value){
        return super.put(key, value);
    }

    public Object put(String key, Double value){
        return super.put(key, value);
    }

    public Object put(String key, String value){
        return super.put(key, value);
    }

    public Object put(String key, byte[] value){
        return super.put(key, value);
    }

    public Object put(String key, int[] value){
        return super.put(key, value);
    }

    public Object put(String key, long[] value){
        return super.put(key, value);
    }

    public Object put(String key, double[] value){
        return super.put(key, value);
    }

    public Object put(String key, ArrayList value){
        return super.put(key, value);
    }

    public Object put(String key, HashMap value){
        return super.put(key, value);
    }

}
