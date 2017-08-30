package com.pauldemarco.flutterblue;

/**
 * Created by Paul on 6/15/2017.
 */

public class AdvertisementRecord {

    final int type;
    final byte[] data;

    public AdvertisementRecord(int type, byte[] data) {
        this.type = type;
        this.data = data;
    }
}
