package org.billthefarmer.mididriver


import android.R
import android.app.Activity
import android.content.Context
import android.content.res.Resources
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import java.util.*


/** FlutterMidiSynthPlugin */
public class FlutterMidiSynthPlugin: FlutterPlugin, MethodCallHandler, MidiDriver.OnMidiStartListener , ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var context: Context
  private lateinit var activity: Activity
  private lateinit var channel : MethodChannel
  private lateinit var midiBridge: MidiBridge
  private var TAG: String = "FlutterMidiSynthPlugin"

  private val recorders = HashMap<String, Int>() //mac,ch

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    attachToEngine(flutterPluginBinding)
  }

  public fun attachToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    println("SNTX *** attachToEngine")
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, com.pauldemarco.flutter_blue.FlutterBluePlugin.NAMESPACE + "/methods")
    //channel = MethodChannel(flutterPluginBinding.binaryMessenger, "FlutterMidiSynthPlugin")
    channel.setMethodCallHandler(this)
    context = flutterPluginBinding.applicationContext
  }

  // This static function is optional and equivalent to onAttachedToEngine. It supports the old
  // pre-Flutter-1.12 Android projects. You are encouraged to continue supporting
  // plugin registration via this function while apps migrate to use the new Android APIs
  // post-flutter-1.12 via https://flutter.dev/go/android-project-migration.
  //
  // It is encouraged to share logic between onAttachedToEngine and registerWith to keep
  // them functionally equivalent. Only one of onAttachedToEngine or registerWith will be called
  // depending on the user's project. onAttachedToEngine or registerWith must both be defined
  // in the same class.
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "FlutterMidiSynthPlugin")
      channel.setMethodCallHandler(FlutterMidiSynthPlugin())
    }
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    manageMethodCall(call, result)
  }

  public fun manageMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    when (call.method){
      "initSynth" -> {
        // Create midi driver
        midiBridge = MidiBridge(context)
        // Set on midi start listener
        midiBridge.init(this)

        //onResume:
        midiBridge.start()  //onPause: midiBridge.stop()
        result.success(null);

      }
      "setInstrument" -> {
        val i = call.argument<Int>("instrument")
        val ch = call.argument<Int>("channel")
        val bank = call.argument<Int>("bank")
        val mac = call.argument<String>("mac")
        println("setInstrument ch " + ch + " i " + i + " bank" + bank + " mac" + mac)
        selectInstrument(ch!!, i!!, bank!!,mac!!)
        result.success(null);
      }
      "noteOn" -> {
        val ch = call.argument<Int>("channel")
        val note = call.argument<Int>("note")
        val velocity = call.argument<Int>("velocity")
        sendNoteOn(ch!!, note!!, velocity!!)
        result.success(null);
      }
      "noteOff" -> {
        val ch = call.argument<Int>("channel")
        val note = call.argument<Int>("note")
        val velocity = call.argument<Int>("velocity")
        sendNoteOff(ch!!, note!!, velocity!!)
        result.success(null);
      }
      "midiEvent" -> {
        val cmd = call.argument<Int>("command")
        val d1 = call.argument<Int>("d1")
        val d2 = call.argument<Int>("d2")
        if (d2!! > 0) {
          sendMidi(cmd!!, d1!!, d2!!)
        } else {
          sendMidi(cmd!!, d1!!)
        }
        result.success(null);
      }
      "setReverb" -> {
        val amount = call.arguments as Double
        for (ch in 0 until 16) {
          sendMidi(0xB0 + ch, 91 /*(CC91: reverb)*/, (amount * 1.27).toInt())
        }
        //println("FlutterMidiSynthplugin: setReverb not yet implemented under Android.");
        result.success(null);
      }
      "setDelay" -> {
        println("FlutterMidiSynthplugin: setDelay not yet implemented under Android.");
        result.success(null);
      }

      else -> {
        println("unknown method " + call.method);
        result.notImplemented();
      }
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    detachFromEngine(binding)
  }

  public fun detachFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onMidiStart() { // Program change - harpsichord
    selectInstrument(0, 0, 0, null)

    // Get the config
    val config = midiBridge.config()

    val format: String = "Sonivox synthesizer config:\\n\n" +
            "        maxVoices = %d\\nnumChannels = %d\\n\n" +
            "        sampleRate = %d\\nmixBufferSize = %d"
    val info: String = java.lang.String.format(Locale.getDefault(), format, config[0],
            config[1], config[2], config[3])

    println("$TAG:  $info")
  }


  public fun selectInstrument(ch: Int, i: Int, bank: Int, mac:String?) {
    //Select Sound Bank MSB
    if (mac != null) {
      recorders[mac] = ch
      print ("recorders: $recorders")
    }
    val bankMSB = bank shr 7
    val bankLSB = bank and 0x7f
    println(" -> selectInstrument ch $ch i $i bank $bank (bankMSB $bankMSB bankLSB $bankLSB mac $mac\n")
    sendMidi(0xB0, 0x0,  bankMSB)
    sendMidi(0xB0, 0x20, bankLSB)
    sendMidiProgramChange(ch, i)
  }

  public fun sendNoteOnWithMAC(ch: Int, n: Int, v: Int, mac: String) {
    println ("sendNoteOnWithMAC $ch $n $v $mac recorders= $recorders")
    var idx = 0
    try {
      if(mac != null) {
        idx = recorders[mac]!!
      }
    } catch (e: KotlinNullPointerException){}
    sendNoteOn(ch+idx, n, v)
  }

  public fun sendNoteOffWithMAC(ch: Int, n: Int, v: Int, mac: String) {
    println ("sendNoteOffWithMAC $ch $n $v $mac recorders= $recorders")

    var idx = 0
    try {
      if(mac != null) {
        idx = recorders[mac]!!
      }
    } catch (e: KotlinNullPointerException){}
    sendNoteOff(ch+idx, n, v)
  }

  public fun sendNoteOn(ch: Int, n: Int, v: Int) {
    println (" -> noteON ch $ch n $n v $v")
    val msg = ByteArray(3)
    msg[0] = (0x90 or ch).toByte()
    msg[1] = n.toByte()
    msg[2] = v.toByte()
    if ( midiBridge.engine != null) midiBridge.write(msg)
  }

  public fun sendNoteOff(ch: Int, n: Int, v: Int) {
    val msg = ByteArray(3)
    msg[0] = (0x80 or ch).toByte()
    msg[1] = n.toByte()
    msg[2] = v.toByte()
    if (midiBridge.engine != null) midiBridge.write(msg)
  }

  public fun sendMidiProgramChange(ch: Int, i: Int) {
    val msg = ByteArray(2)
    msg[0] = (0xc0 or ch).toByte()
    msg[1] = i.toByte()
    if ( midiBridge.engine != null) midiBridge.write(msg)
  }

  // Send a midi message, 1 bytes (Control/Program Change)
  protected fun sendMidi(i: Int) {
    val msg = ByteArray(2)
    msg[0] = 0xc0.toByte()
    msg[1] = i.toByte()
    if ( midiBridge.engine != null) midiBridge.write(msg)
  }

  // Send a midi message, 2 bytes
  protected fun sendMidi(m: Int, i: Int) {
    val msg = ByteArray(2)
    msg[0] = m.toByte()
    msg[1] = i.toByte()
    if ( midiBridge.engine != null) midiBridge.write(msg)
  }

  // Send a midi message, 3 bytes
  public fun sendMidi(m: Int, n: Int, v: Int) {
    val msg = ByteArray(3)
    msg[0] = m.toByte()
    msg[1] = n.toByte()
    msg[2] = v.toByte()
    if ( midiBridge.engine != null) midiBridge.write(msg)
  }

  public fun sendMidiWithMAC(m: Int, n: Int, v: Int, mac: String?) {
    println("sendMidiWithMAC $m $n $v $mac recorders= $recorders")

    var idx = 0
    try {
      if(mac != null) {
        idx = recorders[mac]!!
      }
    } catch (e: KotlinNullPointerException){}
    sendMidi(m + idx, n, v)
  }

  override fun onDetachedFromActivity() {
    TODO("Not yet implemented")
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    TODO("Not yet implemented")
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity;
  }

  override fun onDetachedFromActivityForConfigChanges() {
    TODO("Not yet implemented")
  }

}
