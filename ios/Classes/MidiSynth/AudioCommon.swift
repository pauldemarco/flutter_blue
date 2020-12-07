/**
 * Copyright (c) 2017 Eric Ford Consulting
 */

import Foundation
import AudioToolbox
import AVFoundation //SANTOX reverb and delay

class AudioCommon
{
  var audioGraph:     AUGraph?
  var synthNode       = AUNode()
  var outputNode      = AUNode()
  var synthUnit:    AudioUnit?
  var reverbUnit:   AudioUnit?
  var delayUnit:    AudioUnit?
  var patch = UInt32(0)
  
  var reverbNode = AUNode()
  var delayNode = AUNode()
    
    func initAudioSession(){
        
        let audioSession = AVAudioSession.sharedInstance()
        
        do {
            try
                audioSession.setCategory(.playback, options: .mixWithOthers)
        } catch {
            print("couldn't set category \(error)")
            return
        }
        
        print ("BEFORE set: ioBufferDuration= \(audioSession.ioBufferDuration) samplerate=\(audioSession.sampleRate)")

        
        var preferredIOBufferDuration = 0.0058/2      // 5.8 milliseconds = 256 samples when sampleRate = 44100.0
        if(audioSession.sampleRate == 48000)
        {
            preferredIOBufferDuration = 0.0053/2
        }
        
        do {
            try
                audioSession.setPreferredIOBufferDuration(preferredIOBufferDuration)
        } catch {
            print("couldn't set PreferredIOBufferDuration \(error)")
            return
        }
        
        
        do {
            try audioSession.setActive(true)
            print ("session activated.")
        } catch {
            print("couldn't set audiosession  active \(error)")
            return
        }

        print ("preferredIOBufferDuration=\(audioSession.preferredIOBufferDuration) ioBufferDuration= \(audioSession.ioBufferDuration) samplerate=\(audioSession.sampleRate)")
    }
    
  func initAudio() {
    checkError(osstatus: NewAUGraph(&audioGraph))
    createReverbNode(audioGraph: audioGraph!, outputNode: &reverbNode) //SANTOX
    createDelayNode(audioGraph: audioGraph!, outputNode: &delayNode) //SANTOX
    createOutputNode(audioGraph: audioGraph!, outputNode: &outputNode)
    createSynthNode()
    checkError(osstatus: AUGraphOpen(audioGraph!))
    // get the synth unit
    checkError(osstatus: AUGraphNodeInfo(audioGraph!, synthNode, nil, &synthUnit))
    checkError(osstatus: AUGraphNodeInfo(audioGraph!, reverbNode, nil, &reverbUnit)) //SANTOX
    checkError(osstatus: AUGraphNodeInfo(audioGraph!, delayNode, nil, &delayUnit)) //SANTOX

    let synthOutputElement: AudioUnitElement = 0
    let ioUnitInputElement: AudioUnitElement = 0
/*    checkError(osstatus:
      AUGraphConnectNodeInput(audioGraph!, synthNode, synthOutputElement,
                              outputNode, ioUnitInputElement))
*/
    checkError(osstatus:
      AUGraphConnectNodeInput(audioGraph!, synthNode, synthOutputElement,
                              reverbNode, ioUnitInputElement))
    checkError(osstatus:
      AUGraphConnectNodeInput(audioGraph!, reverbNode, synthOutputElement,
                              delayNode, ioUnitInputElement))
    checkError(osstatus:
      AUGraphConnectNodeInput(audioGraph!, delayNode, synthOutputElement,
                              outputNode, ioUnitInputElement))

    
    checkError(osstatus: AUGraphInitialize(audioGraph!))
    checkError(osstatus: AUGraphStart(audioGraph!))
    loadSoundFont()
    loadPatch(patchNo: 0)
    setReverb(dryWet:0.0)
    setDelay(dryWet:0.0)
  }
  
  // Mark: - Audio Init Utility Methods
  func createOutputNode(audioGraph: AUGraph, outputNode: UnsafeMutablePointer<AUNode>) {
    var cd = AudioComponentDescription(
      componentType: OSType(kAudioUnitType_Output),
      componentSubType: OSType(kAudioUnitSubType_RemoteIO),
      componentManufacturer: OSType(kAudioUnitManufacturer_Apple),
      componentFlags: 0,componentFlagsMask: 0)
    checkError(osstatus: AUGraphAddNode(audioGraph, &cd, outputNode))
  }
  
    
    func setReverb(dryWet: Float){
        print("setReverb \(dryWet)")

        //Configurable parameters:
        /*
        kReverb2Param_Gain;
        kReverb2Param_DryWetMix;
        kReverb2Param_MaxDelayTime;
        kReverb2Param_MinDelayTime;
        kReverb2Param_DecayTimeAt0Hz;
        kReverb2Param_DecayTimeAtNyquist;
        kReverb2Param_RandomizeReflections;
        */
        
        // set the decay time at 0 Hz to 1 seconds
        AudioUnitSetParameter(reverbUnit!, kAudioUnitScope_Global, 0, kReverb2Param_DecayTimeAt0Hz, Float(1.0), 0);
        // set the decay time at Nyquist to 2.5 seconds
        AudioUnitSetParameter(reverbUnit!, kAudioUnitScope_Global, 0, kReverb2Param_DecayTimeAtNyquist, Float(0.5), 0);
        
        //kReverb2Param_DryWetMix 0.0-100.0
         AudioUnitSetParameter(reverbUnit!, kAudioUnitScope_Global, 0, kReverb2Param_DryWetMix, dryWet, 0);
    }
    
    func setDelay(dryWet: Float){
        print("setDelay \(dryWet)")
        //Configurable parameters:
        /*
        kDelayParam_Feedback
        kDelayParam_DelayTime
        kDelayParam_WetDryMix
        kDelayParam_LopassCutoff
        */
        
        // set the feedback 0 - 100
        //AudioUnitSetParameter(delayUnit!, kAudioUnitScope_Global, 0, kDelayParam_Feedback, Float(50), 0);
        AudioUnitSetParameter(delayUnit!, kDelayParam_Feedback, kAudioUnitScope_Global, 0, Float(35),0);

        // set the delay time in seconds, default 1
//        AudioUnitSetParameter(delayUnit!, kAudioUnitScope_Global, 0, kDelayParam_DelayTime, 0.04, 0);
        AudioUnitSetParameter(delayUnit!, kDelayParam_DelayTime, kAudioUnitScope_Global, 0, 0.4,0);
        
        // set the WetDryMix amount
        //AudioUnitSetParameter(delayUnit!, kAudioUnitScope_Global, 0, kDelayParam_WetDryMix, dryWet, 0);
        AudioUnitSetParameter(delayUnit!, kDelayParam_WetDryMix, kAudioUnitScope_Global, 0, dryWet,0);

        
        // set the LopassCutoff amount in Hz
        //AudioUnitSetParameter(delayUnit!, kAudioUnitScope_Global, 0, kDelayParam_LopassCutoff, 15_000, 0);
        
    }
    
    func createReverbNode(audioGraph: AUGraph, outputNode: UnsafeMutablePointer<AUNode>) {
      var cd = AudioComponentDescription(
        componentType: OSType(kAudioUnitType_Effect),
        componentSubType: OSType(kAudioUnitSubType_Reverb2),
        componentManufacturer: OSType(kAudioUnitManufacturer_Apple),
        componentFlags: 0,componentFlagsMask: 0)
      checkError(osstatus: AUGraphAddNode(audioGraph, &cd, outputNode))
    }
    
    func createDelayNode(audioGraph: AUGraph, outputNode: UnsafeMutablePointer<AUNode>) {
      var cd = AudioComponentDescription(
        componentType: OSType(kAudioUnitType_Effect),
        componentSubType: OSType(kAudioUnitSubType_Delay),
        componentManufacturer: OSType(kAudioUnitManufacturer_Apple),
        componentFlags: 0,componentFlagsMask: 0)
      checkError(osstatus: AUGraphAddNode(audioGraph, &cd, outputNode))
    }
    
    func createConverterNode(audioGraph: AUGraph, outputNode: UnsafeMutablePointer<AUNode>) {
      var cd = AudioComponentDescription(
        componentType: OSType(kAudioUnitType_FormatConverter),
        componentSubType: OSType(kAudioUnitSubType_AUConverter),
        componentManufacturer: OSType(kAudioUnitManufacturer_Apple),
        componentFlags: 0,componentFlagsMask: 0)
      checkError(osstatus: AUGraphAddNode(audioGraph, &cd, outputNode))
    }
    
  func createSynthNode() {
    var cd = AudioComponentDescription(
      componentType: OSType(kAudioUnitType_MusicDevice),
      componentSubType: OSType(kAudioUnitSubType_MIDISynth),
      componentManufacturer: OSType(kAudioUnitManufacturer_Apple),
      componentFlags: 0,componentFlagsMask: 0)
    checkError(osstatus: AUGraphAddNode(audioGraph!, &cd, &synthNode))
  }
  
  // In the simulator this takes a long time, so we
  //  call it in a background thread in the controller
  func loadSoundFont() {
    do {
        let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:false)
        var bankURL = documentDirectory.appendingPathComponent("soundfont_recorder.sf2")
        checkError(osstatus: AudioUnitSetProperty(synthUnit!, AudioUnitPropertyID(kMusicDeviceProperty_SoundBankURL), AudioUnitScope(kAudioUnitScope_Global), 0, &bankURL, UInt32(MemoryLayout<URL>.size)))
    } catch {
        print ("error loading soundFont")
    }
  }
  
  func loadPatch(patchNo: Int, channel: Int = 0, bank: Int = 0) {
    var enabled = UInt32(1)
    var disabled = UInt32(0)
    patch = UInt32(patchNo)
    
    checkError(osstatus: AudioUnitSetProperty(
      synthUnit!,
      AudioUnitPropertyID(kAUMIDISynthProperty_EnablePreload),
      AudioUnitScope(kAudioUnitScope_Global),
      0,
      &enabled,
      UInt32(MemoryLayout<UInt32>.size)))

    let ccCommand = UInt32(0xB0 | channel)
/*
    You can select any bank in the SF like this:
    Banks 0-127: bankMSB = kAUSampler_DefaultMelodicBankMSB, bankLSB = (SoundFont bank)
    Bank 128: bankMSB = kAUSampler_DefaultPercussionBankMSB, bankLSB = kAUSampler_DefaultBankLSB
*/
    //let bankMsb = bank >> 7;
    if(bank == 128){
        checkError(osstatus: MusicDeviceMIDIEvent(self.synthUnit!, ccCommand, 0, UInt32(kAUSampler_DefaultPercussionBankMSB), 0))
        checkError(osstatus: MusicDeviceMIDIEvent(self.synthUnit!, ccCommand, 0x20, UInt32(kAUSampler_DefaultBankLSB), 0))
    } else {
        checkError(osstatus: MusicDeviceMIDIEvent(self.synthUnit!, ccCommand, 0, UInt32(kAUSampler_DefaultMelodicBankMSB), 0))
        checkError(osstatus: MusicDeviceMIDIEvent(self.synthUnit!, ccCommand, 0x20, UInt32(bank), 0))
    }

    let programChangeCommand = UInt32(0xC0 | channel)
    checkError(osstatus: MusicDeviceMIDIEvent(self.synthUnit!, programChangeCommand, patch, 0, 0))
    
    checkError(osstatus: AudioUnitSetProperty(
      synthUnit!,
      AudioUnitPropertyID(kAUMIDISynthProperty_EnablePreload),
      AudioUnitScope(kAudioUnitScope_Global),
      0,
      &disabled,
      UInt32(MemoryLayout<UInt32>.size)))
    
    // the previous programChangeCommand just triggered a preload
    // this one actually changes to the new voice
    checkError(osstatus: MusicDeviceMIDIEvent(synthUnit!, programChangeCommand, patch, 0, 0))
    
  }
  
  func checkError(osstatus: OSStatus) {
    if osstatus != noErr {
      print(SoundError.GetErrorMessage(osstatus))
    }
  }
}
