import Flutter
import UIKit
import AVFoundation
import AudioToolbox

@objcMembers public class SwiftFlutterMidiSynthPlugin: NSObject, FlutterPlugin {
    
  var synth: SoftSynth?
  var sequencers: [Int:Sequencer] = [:] 
  var recorders = [String : Int]()
    
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "FlutterMidiSynthPlugin", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterMidiSynthPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      switch call.method {
      case "initSynth":
          let i = call.arguments as! Int
          self.initSynth(instrument: i);
      case "setInstrument":
          let args = call.arguments as? Dictionary<String, Any>
          let instrument = args?["instrument"] as! Int
          let channel = args?["channel"] as! Int
          let bank = args?["bank"] as! Int
          let mac = args?["mac"] as! String
          self.setInstrument(instrument: instrument, channel: channel, bank: bank, mac: mac)
      case "noteOn":
          let args = call.arguments as? Dictionary<String, Any>
          let channel = args?["channel"] as? Int
          let note = args?["note"]  as? Int
          let velocity = args?["velocity"]  as? Int
          self.noteOn(channel: channel ?? 0, note: note ?? 60, velocity: velocity ?? 255)
      case "noteOff":
          let args = call.arguments as? Dictionary<String, Any>
          let channel = args?["channel"] as? Int
          let note = args?["note"]  as? Int
          let velocity = args?["velocity"]  as? Int
          self.noteOff(channel: channel ?? 0, note: note ?? 60, velocity: velocity ?? 255)
      case "midiEvent":
          let args = call.arguments as? Dictionary<String, Any>
          let command = args?["command"] as! UInt32
          let d1 = args?["d1"] as! UInt32
          let d2 = args?["d2"] as! UInt32
          self.midiEvent(command: command, d1: d1, d2: d2)
        
      case "setReverb":
        let amount = call.arguments as! NSNumber
        self.setReverb(dryWet: Float(amount.doubleValue))

      case "setDelay":
        let amount = call.arguments as! NSNumber
        self.setDelay(dryWet: Float(amount.doubleValue))

        
      default:
          print ("unknown method \(call.method)" )
      }

  }

   @available(iOS 10.0, *)
   private func setSpeakersAsDefaultAudioOutput() {
       do {
       try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playAndRecord, mode: .default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)
       } catch {
           print ("Error in setSpeakersAsDefaultAudioOutput");
       }
     }

   //TODO: add soundfont argument
    public func initSynth(instrument: Int){
/*
        let audioSession = AVAudioSession.sharedInstance()

        do {
            try audioSession.setActive(false)
            print ("session DEactivated.")

        } catch {
            print("couldn't set audioSession NOT active \(error)")
            return
        }
        
        var preferredIOBufferDuration = 0.0058/4      // 5.8 milliseconds = 256 samples when sampleRate = 44100.0
        if(audioSession.sampleRate == 48000)
        {
            preferredIOBufferDuration = 0.0053
        }
        
        do {
            try
                audioSession.setPreferredIOBufferDuration(preferredIOBufferDuration)
        } catch {
            print("couldn't set PreferredIOBufferDuration \(error)")
            return
        }
        
        print ("preferredIOBufferDuration=\(audioSession.preferredIOBufferDuration) ioBufferDuration= \(audioSession.ioBufferDuration) samplerate=\(audioSession.sampleRate)")
        do {
            try audioSession.setActive(true)
            print ("session activated.")
        } catch {
            print("couldn't set audiosession  active \(error)")
            return
        }

        print ("preferredIOBufferDuration=\(audioSession.preferredIOBufferDuration) ioBufferDuration= \(audioSession.ioBufferDuration) samplerate=\(audioSession.sampleRate)")
*/
       synth = SoftSynth()
       setInstrument(instrument: instrument)


       if #available(iOS 10.0, *) {
           setSpeakersAsDefaultAudioOutput()
       } else {
           // Fallback on earlier versions
           print ("setSpeakersAsDefaultAudioOutput is available only from iOS 10");
       }
       
       /*load voices (in background)*/
       DispatchQueue.global(qos: .background).async {
           self.synth!.loadSoundFont()
           self.synth!.loadPatch(patchNo: instrument)
           DispatchQueue.main.async {
               print ("background loading of voices completed." )
           }
       }

   }

    private func getSequencer(channel: Int) -> Sequencer{
        if (sequencers[channel] == nil){
             sequencers[channel] = Sequencer(channel: channel)
        }
        return sequencers[channel]!
    }
    
   private func setInstrument(instrument: Int, channel: Int = 0, bank: Int = 0, mac: String? = nil){
    print ("setInstrument \(instrument) \(channel) \(bank) \(mac)")

       if(mac != nil){
        recorders[mac!] = channel
       }
       synth!.loadPatch(patchNo: instrument, channel: channel, bank: bank)
       getSequencer(channel: channel).patch = UInt32(instrument)
   }

   public func noteOnWithMac(channel: Int, note: Int, velocity: Int, mac: String ){
    //print ("noteOnWithMac \(channel) \(note) \(velocity) \(mac)")
    let idx = recorders[mac] ?? 0
    noteOn(channel: channel+idx, note: note, velocity: velocity)
   }


   public func noteOffWithMac(channel: Int, note: Int, velocity: Int, mac: String){
    let idx = recorders[mac] ?? 0
    noteOff(channel: channel+idx, note: note, velocity: velocity)
   }

   public func midiEventWithMac(command: UInt32, d1: UInt32, d2: UInt32, mac: String){
    let idx = recorders[mac] ?? 0
    midiEvent(command: command+UInt32(idx), d1: d1, d2: d2)
   }

   public func noteOn(channel: Int, note: Int, velocity: Int){
    if (channel < 0 || note < 0 || velocity < 0){ return }
    let sequencer = getSequencer(channel: channel)
    synth!.playNoteOn(channel: channel, note: UInt8(note), midiVelocity: velocity, sequencer: sequencer)
    sequencer.noteOn(note: UInt8(note))
    let now = (Int64)(NSDate().timeIntervalSince1970*1000)
    //print("\(now) SwiftFlutterMidiSyntPlugin.swift noteOn \(channel)  \(note) \(velocity) ")
   }

   public func noteOff(channel: Int, note: Int, velocity: Int){
    if (channel < 0 || note < 0 || velocity < 0){ return }
    let sequencer = getSequencer(channel: channel)
    synth!.playNoteOff(channel: channel, note: UInt8(note), midiVelocity: velocity, sequencer: sequencer)
    sequencer.noteOff(note: UInt8(note))
    let now = (Int64)(NSDate().timeIntervalSince1970*1000)
    //print("\(now) SwiftFlutterMidiSyntPlugin.swift noteOff \(channel)  \(note) \(velocity) ")
   }

   public func midiEvent(command: UInt32, d1: UInt32, d2: UInt32){
       synth!.midiEvent(cmd: command, d1: d1, d2_: d2);
   }

    public func setReverb(dryWet: Float){
        synth!.setReverb(dryWet: dryWet)
    }
    
    public func setDelay(dryWet: Float){
        synth!.setDelay(dryWet: dryWet)
    }

}
