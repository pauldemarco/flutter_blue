package com.pauldemarco.flutterblue;

import org.junit.Test;

import java.util.HashSet;
import java.util.Set;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

/**
 * Created by paul on 6/26/17.
 */
public class GuidTest{
    @Test
    public void equals() throws Exception {
        Guid guid = new Guid("00002a43-0000-1000-8000-00805f9b34fb");
        Guid guid2 = new Guid("00002a43-0000-1000-8000-00805f9b34fb");
        assertEquals(guid, guid2);
    }

    @Test
    public void set() throws Exception {
        Set<Guid> guids = new HashSet<>();
        Guid guid = new Guid("00002a43-0000-1000-8000-00805f9b34fb");
        Guid guid2 = new Guid("00002a43-0000-1000-8000-00805f9b34fb");
        guids.add(guid);
        assertTrue(guids.contains(guid2));
    }
}