/**
 * Copyright (c) 2017 Eric Ford Consulting
 */

import CoreAudio
import AudioToolbox

//import AudioKit

final class SoftSynth : AudioCommon {
    override init()
    {
        super.init()
        initAudioSession()
        initAudio()
        loadSoundFont()
        loadPatch(patchNo: 0)
    }

    var octave                = 4

    func playNoteOn(channel: Int, note: UInt8, midiVelocity: Int, sequencer: Sequencer) {
        let noteCommand = UInt32(0x90 | channel)
        let base = note - 48
        let octaveAdjust = (UInt8(octave) * 12) + base
        let pitch = UInt32(octaveAdjust)
        checkError(osstatus: MusicDeviceMIDIEvent(synthUnit!, noteCommand, pitch, UInt32(midiVelocity), 0))
        sequencer.noteOn(note: UInt8(pitch))
    }
  
    func playNoteOff(channel: Int, note: UInt8, midiVelocity: Int, sequencer: Sequencer) {
        let noteCommand = UInt32(0x80 | channel)
        let base = note - 48
        let octaveAdjust = (UInt8(octave) * 12) + base
        let pitch = UInt32(octaveAdjust)
        checkError(osstatus: MusicDeviceMIDIEvent(synthUnit!, noteCommand, pitch, UInt32(midiVelocity), 0))
        sequencer.noteOff(note: UInt8(pitch))
    }
    
    func midiEvent(cmd: UInt32, d1: UInt32, d2_: UInt32) {
        var d2: UInt32 = 0
        if(d2_>0){
            d2=d2_
        }
        checkError(osstatus: MusicDeviceMIDIEvent(synthUnit!, cmd, d1, d2, 0))
    }
}

