/**
 * Copyright (c) 2017 Eric Ford Consulting
 */

import Foundation
import AudioToolbox
import CoreAudio

enum SequencerMode: Int {
  case off = 0, recording, playing
}

final class Sequencer : AudioCommon {
//  var storedPatch     = UInt32(0)
  var musicSequence: MusicSequence?
  var musicPlayer: MusicPlayer?
  var midiVelocity = UInt8(127)
  
  var sequencerMode = 0
  var sequenceStartTime: Date?
  var track: MusicTrack?
  
  var noteOnTimes = [Date] (repeating: Date(), count:128)
  var forChannel: Int;
  var sequencerMidiChannel: UInt8;
    
  //static let shared = Sequencer(channel:0)
  /*private override*/ init(channel: Int)
  {
    forChannel = channel;
    sequencerMidiChannel = UInt8(channel + 64);
    super.init()
    initAudio()
    setUpSequencer()
    loadSoundFont()
    loadPatch(patchNo: 0)
  }
  
  func setSequencerMode(mode: Int) {
    sequencerMode = mode
    switch(sequencerMode) {
    case SequencerMode.off.rawValue:
      checkError(osstatus: MusicPlayerStop(musicPlayer!))
    case SequencerMode.recording.rawValue:
      startRecording()
    case SequencerMode.playing.rawValue:
      musicPlayerPlay()
    default:
      break
    }
  }
  
  func noteOn(note: UInt8) {
    if sequencerMode == SequencerMode.recording.rawValue {
      noteOnTimes[Int(note)] = Date()
    }
  }
  
  func noteOff(note: UInt8) {
    if sequencerMode == SequencerMode.recording.rawValue {
      let duration: Double = Date().timeIntervalSince(noteOnTimes[Int(note)])
      let onset: Double = noteOnTimes[Int(note)].timeIntervalSince(sequenceStartTime!)
      var beat: MusicTimeStamp = 0
      checkError(osstatus: MusicSequenceGetBeatsForSeconds(musicSequence!, onset, &beat))
      var mess = MIDINoteMessage(channel: sequencerMidiChannel,
                                 note: note,
                                 velocity: midiVelocity,
                                 releaseVelocity: 0,
                                 duration: Float(duration) )
      checkError(osstatus: MusicTrackNewMIDINoteEvent(track!, beat, &mess))
    }
  }
  
  func musicPlayerPlay() {
    var status = noErr
    var playing:DarwinBoolean = false
    checkError(osstatus: MusicPlayerIsPlaying(musicPlayer!, &playing))
    if playing != false {
      status = MusicPlayerStop(musicPlayer!)
      if status != noErr {
        print("Error stopping \(status)")
        checkError(osstatus: status)
        return
      }
    }
    
    checkError(osstatus: MusicPlayerSetTime(musicPlayer!, 0))
    checkError(osstatus: MusicPlayerStart(musicPlayer!))
  }
  
  func startRecording() {
    sequenceStartTime = Date()
    setUpSequencer()
  }
  
    private func setUpSequencer() {
    // set the sequencer voice to storedPatch so we can play along with it using patch
    var status = NewMusicSequence(&musicSequence)
    if status != noErr {
      print("\(#line) bad status \(status) creating sequence")
    }
    
    status = MusicSequenceNewTrack(musicSequence!, &track)
    if status != noErr {
      print("error creating track \(status)")
    }
    
    // 0xB0 = bank select, first we do the most significant byte
    var chanmess = MIDIChannelMessage(status: 0xB0 | sequencerMidiChannel, data1: 0, data2: 0, reserved: 0)
    status = MusicTrackNewMIDIChannelEvent(track!, 0, &chanmess)
    if status != noErr {
      print("creating bank select event \(status)")
    }
    // then the least significant byte
    chanmess = MIDIChannelMessage(status: 0xB0 | sequencerMidiChannel, data1: 32, data2: 0, reserved: 0)
    status = MusicTrackNewMIDIChannelEvent(track!, 0, &chanmess)
    if status != noErr {
      print("creating bank select event \(status)")
    }
    
    // set the voice
    chanmess = MIDIChannelMessage(status: 0xC0 | sequencerMidiChannel, data1: UInt8(patch), data2: 0, reserved: 0)
    status = MusicTrackNewMIDIChannelEvent(track!, 0, &chanmess)
    if status != noErr {
      print("creating program change event \(status)")
    }
    
    checkError(osstatus: MusicSequenceSetAUGraph(musicSequence!, audioGraph))
    checkError(osstatus: NewMusicPlayer(&musicPlayer))
    checkError(osstatus: MusicPlayerSetSequence(musicPlayer!, musicSequence))
    checkError(osstatus: MusicPlayerPreroll(musicPlayer!))
  }
}



