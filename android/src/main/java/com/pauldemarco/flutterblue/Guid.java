package com.pauldemarco.flutterblue;

import java.util.UUID;

/**
 * Created by paul on 6/14/17.
 */

public class Guid {

    final UUID uuid;

    public Guid(UUID uuid) {
        this.uuid = uuid;
    }

    public Guid(String guid) {
        this.uuid = UUID.fromString(guid);
    }

    public static Guid fromMac(String mac) {
        if(mac == null || mac.length() != 17) {
            throw new IllegalArgumentException("Invalid mac address");
        }
        String[] parts = mac.split(":");
        if(parts.length != 6) {
            throw new IllegalArgumentException("Invalid mac address");
        }
        String macStripped = mac.replace(":", "");
        String guidString = macStripped.substring(0,8) + "-" + macStripped.substring(8,12) + "-0000-0000-000000000000";
        return new Guid(guidString);
    }

    public String toMac() {
        String guid = this.uuid.toString();
        guid = guid.replaceFirst("-", "");
        String mac = guid.substring(0,2) + ":" +
                    guid.substring(2,4) + ":" +
                    guid.substring(4,6) + ":" +
                    guid.substring(6,8) + ":" +
                    guid.substring(8,10) + ":" +
                    guid.substring(10,12);
        return mac.toUpperCase();
    }

    public String toString() {
        return uuid.toString();
    }

    @Override
    public boolean equals(Object obj) {
        if(this == obj) return true;
        if(!(obj instanceof Guid)) return false;
        Guid guid = (Guid)obj;
        return this.uuid.equals(guid.uuid);
    }
}
