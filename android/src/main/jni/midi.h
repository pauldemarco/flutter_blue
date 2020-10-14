////////////////////////////////////////////////////////////////////////////////
//
//  MidiDriver - An Android Midi Driver.
//
//  Copyright (C) 2013	Bill Farmer
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
//  Bill Farmer	 william j farmer [at] yahoo [dot] co [dot] uk.
//
///////////////////////////////////////////////////////////////////////////////

#ifndef MIDI_H
#define MIDI_H

#include <jni.h>
#include "eas.h"

/* for C++ linkage */
#ifdef __cplusplus
extern "C"
{
#endif

// init mididriver
jboolean midi_init();

// midi write
jboolean midi_write(EAS_U8 *bytes, jint length);

// set EAS master volume
jboolean midi_setVolume(jint volume);

// shutdown EAS midi
jboolean midi_shutdown();

#ifdef __cplusplus
} /* end extern "C" */
#endif

#endif /* MIDI_H */
