package com.pauldemarco.flutterblue;

/**
 * Created by Paul on 6/15/2017.
 */

public class CharacteristicPropertyType {

    public static final int BROADCAST = 1;
    public static final int READ = 2;
    public static final int WRITE_WITHOUT_RESPONSE = 4;
    public static final int WRITE = 8;
    public static final int NOTIFY = 16;
    public static final int INDICATE = 32;
    public static final int AUTHENTICATED_SIGNED_WRITES = 64;
    public static final int EXTENDED_PROPERTIES = 128;
    public static final int NOTIFY_ENCRYPTION_REQUIRED = 256;
    public static final int INDICATE_ENCRYPTION_REQUIRED = 512;
}
