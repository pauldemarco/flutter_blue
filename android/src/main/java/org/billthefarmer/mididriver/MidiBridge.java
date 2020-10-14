package org.billthefarmer.mididriver;

import android.content.Context;
import android.util.Log;


//sherlockmidi
/*
import java.io.IOException;
import java.util.Arrays;

import cn.sherlock.com.sun.media.sound.SF2Instrument;
import cn.sherlock.com.sun.media.sound.SF2Soundbank;
import cn.sherlock.com.sun.media.sound.SoftSynthesizer;
import jp.kshoji.javax.sound.midi.MidiUnavailableException;
import jp.kshoji.javax.sound.midi.Receiver;
import jp.kshoji.javax.sound.midi.ShortMessage;
*/



public class MidiBridge
{
    private static String TAG = MidiBridge.class.getName().toString();

    public static int SONIVOX = 0;
    public static int KYO = 1;
    public static int FLUIDSYNTH = 2;

    private Context context;
    private Object engine;

    //SonyVox
    private MidiDriver sonivox;
    //Kyo SherlockMidi
   // private SoftSynthesizer kyoSynth;



    public MidiBridge(Context context){
        this.context = context;
    }

    public void init(Object listener){
        if (getEngineIdx() == MidiBridge.SONIVOX) {
            setSonivoxEngine((MidiDriver.OnMidiStartListener)listener);
        } else if (getEngineIdx() == MidiBridge.KYO){
            setKyoEngine();
        }
    }

    public int getEngineIdx(){
        return 0;
        /*
        SharedPreferences preferences = context.getSharedPreferences(
                SettingsFragment.PREFERENCES_FILE,
                Context.MODE_PRIVATE);
        String v = preferences.getString("select_engine","0");
        return Integer.parseInt(v);
        */

    }

    public Object getEngine() {
        return engine;
    }

    public void setSonivoxEngine(MidiDriver.OnMidiStartListener midiStartListener){
        sonivox = new MidiDriver();
        sonivox.setOnMidiStartListener(midiStartListener);
        engine = sonivox;

    }

    public void setKyoEngine(){
        /*
        try {
            SF2Soundbank sf = new SF2Soundbank(context.getAssets().open("GeneralUser GS v1.47.sf2")); //soundFont con soli due strumenti: Piano e WoodBlock
            SF2Instrument[] instruments = sf.getInstruments();
            String[] s_instruments = new String[instruments.length];
            for (int i=0; i<instruments.length; i++ ) {
                s_instruments[i] = instruments[i].getName();
            }
            ((SheetMusicActivity)context).setSpinnerInstrumentsArray(s_instruments);

            kyoSynth = new SoftSynthesizer();
            kyoSynth.open();
            kyoSynth.loadAllInstruments(sf);
            kyoSynth.getChannels()[0].programChange(0); //imposta Piano
            engine = kyoSynth;
        } catch (IOException e) {
            e.printStackTrace();
        } catch (MidiUnavailableException e) {
            e.printStackTrace();
        }
        */

    }



    public void write(byte msg[]){
        //Log.w("MidiBridge", "writing message to Synth engine... "+ CommonResources.bytesToHex(msg));
        if (engine == sonivox){
            sonivox.write(msg);
        }
        /*
        else if( engine == kyoSynth){
            try {
                ShortMessage smsg = new ShortMessage();

                int d2 = 0;
                if (msg.length > 2){
                    d2 = msg[2];
                }
                smsg.setMessage(msg[0], msg[1], d2);

                kyoSynth.getReceiver().send(smsg,-1);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
         */

        else {
            Log.e("MidiBridge", "write: Engine not YET implemented");
        }
        //Log.w("MidiBridge", "wrote message to Synth engine... " + CommonResources.bytesToHex(msg));

    }

    public int[] config(){
        if (engine == sonivox){
            return sonivox.config();
        }
        /*else if( engine == kyoSynth){
            Log.w("MidiBridge", "config: nothing to do");
        }
        */
        else {
            Log.e("MidiBridge", "config: Engine not YET implemented");
        }


        return null;
    }

    public void stop(){
        if (engine == sonivox){
            sonivox.stop();
        }
        /*
        else if( engine == kyoSynth){
            Log.w("MidiBridge", "stop: nothing to do");
        }
        */

        else {
            Log.e("MidiBridge", "stop: Engine not YET implemented");
        }
    }

    public void start(){
        if (engine == sonivox){
            sonivox.start();
        }
        /*
        else if( engine == kyoSynth){
            Log.w("MidiBridge", "start: nothing to do");
        }
        */

        else {
            Log.e("MidiBridge", "stop: Engine not YET implemented");
        }
    }




}
