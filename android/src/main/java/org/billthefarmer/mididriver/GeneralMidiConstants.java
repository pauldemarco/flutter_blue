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
//  Joseph Hindin hindin [at] jhindin [dot] com
//
///////////////////////////////////////////////////////////////////////////////

package org.billthefarmer.mididriver;

/**
 * General midi instrument constants
 */
public class GeneralMidiConstants
{
    public static final byte ACOUSTIC_GRAND_PIANO           = 0;
    public static final byte BRIGHT_ACOUSTIC_PIANO          = 1;
    public static final byte ELECTRIC_GRAND_PIANO           = 2;
    public static final byte HONKY_TONK_PIANO               = 3;
    public static final byte ELECTRIC_PIANO_0               = 4;
    public static final byte ELECTRIC_PIANO_1               = 5;
    public static final byte HARPSICHORD                    = 6;
    public static final byte CLAVI                          = 7;
    public static final byte CELESTA                        = 8;
    public static final byte GLOCKENSPIEL                   = 9;
    public static final byte MUSIC_BOX                      = 10;
    public static final byte VIBRAPHONE                     = 11;
    public static final byte MARIMBA                        = 12;
    public static final byte XYLOPHONE                      = 13;
    public static final byte TUBULAR_BELLS                  = 14;
    public static final byte DULCIMER                       = 15;
    public static final byte DRAWBAR_ORGAN                  = 16;
    public static final byte PERCUSSIVE_ORGAN               = 17;
    public static final byte ROCK_ORGAN                     = 18;
    public static final byte CHURCH_ORGAN                   = 19;
    public static final byte REED_ORGAN                     = 20;
    public static final byte ACCORDION                      = 21;
    public static final byte HARMONICA                      = 22;
    public static final byte TANGO_ACCORDION                = 23;
    public static final byte ACOUSTIC_GUITAR_NYLON          = 24;
    public static final byte ACOUSTIC_GUITAR_STEEL          = 25;
    public static final byte ELECTRIC_GUITAR_JAZZ           = 26;
    public static final byte ELECTRIC_GUITAR_CLEAN          = 27;
    public static final byte ELECTRIC_GUITAR_MUTED          = 28;
    public static final byte OVERDRIVEN_GUITAR              = 29;
    public static final byte DISTORTION_GUITAR              = 30;
    public static final byte GUITAR_HARMONICS               = 31;
    public static final byte ACOUSTIC_BASS                  = 32;
    public static final byte ELECTRIC_BASS_FINGER           = 33;
    public static final byte ELECTRIC_BASS_PICK             = 34;
    public static final byte FRETLESS_BASS                  = 35;
    public static final byte SLAP_BASS_0                    = 36;
    public static final byte SLAP_BASS_1                    = 37;
    public static final byte SYNTH_BASS_0                   = 38;
    public static final byte SYNTH_BASS_1                   = 39;
    public static final byte VIOLIN                         = 40;
    public static final byte VIOLA                          = 41;
    public static final byte CELLO                          = 42;
    public static final byte CONTRABASS                     = 43;
    public static final byte TREMOLO_STRINGS                = 44;
    public static final byte PIZZICATO_STRINGS              = 45;
    public static final byte ORCHESTRAL_HARP                = 46;
    public static final byte TIMPANI                        = 47;
    public static final byte STRING_ENSEMBLE_0              = 48;
    public static final byte STRING_ENSEMBLE_1              = 49;
    public static final byte SYNTHSTRINGS_0                 = 50;
    public static final byte SYNTHSTRINGS_1                 = 51;
    public static final byte CHOIR_AAHS                     = 52;
    public static final byte VOICE_OOHS                     = 53;
    public static final byte SYNTH_VOICE                    = 54;
    public static final byte ORCHESTRA_HIT                  = 55;
    public static final byte TRUMPET                        = 56;
    public static final byte TROMBONE                       = 57;
    public static final byte TUBA                           = 58;
    public static final byte MUTED_TRUMPET                  = 59;
    public static final byte FRENCH_HORN                    = 60;
    public static final byte BRASS_SECTION                  = 61;
    public static final byte SYNTHBRASS_0                   = 62;
    public static final byte SYNTHBRASS_1                   = 63;
    public static final byte SOPRANO                        = 64;
    public static final byte ALTO_SAX                       = 65;
    public static final byte TENOR_SAX                      = 66;
    public static final byte BARITONE_SAX                   = 67;
    public static final byte OBOE                           = 68;
    public static final byte ENGLISH_HORN                   = 69;
    public static final byte BASSOON                        = 70;
    public static final byte CLARINET                       = 71;
    public static final byte PICCOLO                        = 72;
    public static final byte FLUTE                          = 73;
    public static final byte RECORDER                       = 74;
    public static final byte PAN_FLUTE                      = 75;
    public static final byte BLOWN_BOTTLE                   = 76;
    public static final byte SHAKUHACHI                     = 77;
    public static final byte WHISTLE                        = 78;
    public static final byte OCARINA                        = 79;
    public static final byte LEAD_0_SQUARE                  = 80;
    public static final byte LEAD_1_SAWTOOTH                = 81;
    public static final byte LEAD_2_CALLIOPE                = 82;
    public static final byte LEAD_3_CHIFF                   = 83;
    public static final byte LEAD_4_CHARANG                 = 84;
    public static final byte LEAD_5_VOICE                   = 85;
    public static final byte LEAD_6_FIFTHS                  = 86;
    public static final byte LEAD_7_BASS_LEAD               = 87;
    public static final byte PAD_0_NEW_AGE                  = 88;
    public static final byte PAD_1_WARM                     = 89;
    public static final byte PAD_2_POLYSYNTH                = 90;
    public static final byte PAD_3_CHOIR                    = 91;
    public static final byte PAD_4_BOWED                    = 92;
    public static final byte PAD_5_METALLIC                 = 93;
    public static final byte PAD_6_HALO                     = 94;
    public static final byte PAD_7_SWEEP                    = 95;
    public static final byte FX_0_RAIN                      = 96;
    public static final byte FX_1_SOUNDTRACK                = 97;
    public static final byte FX_2_CRYSTAL                   = 98;
    public static final byte FX_3_ATMOSPHERE                = 99;
    public static final byte FX_4_BRIGHTNESS                = 100;
    public static final byte FX_5_GOBLINS                   = 101;
    public static final byte FX_6_ECHOES                    = 102;
    public static final byte FX_7_SCI_FI                    = 103;
    public static final byte SIT_R                          = 104;
    public static final byte BANJO                          = 105;
    public static final byte SHAMISEN                       = 106;
    public static final byte KOTO                           = 107;
    public static final byte KALIMBA                        = 108;
    public static final byte BAG_PIPE                       = 109;
    public static final byte FIDDLE                         = 110;
    public static final byte SHANAI                         = 111;
    public static final byte TINKLE_BELL                    = 112;
    public static final byte AGOGO                          = 113;
    public static final byte STEEL_DRUMS                    = 114;
    public static final byte WOODBLOCK                      = 115;
    public static final byte TAIKO_DRUM                     = 116;
    public static final byte MELODIC_TOM                    = 117;
    public static final byte SYNTH_DRUM                     = 118;
    public static final byte REVERSE_CYMBAL                 = 119;
    public static final byte GUITAR_FRET_NOISE              = 120;
    public static final byte BREATH_NOISE                   = 121;
    public static final byte SEASHORE                       = 122;
    public static final byte BIRD_TWEET                     = 123;
    public static final byte TELEPHONE_RING                 = 124;
    public static final byte HELICOPTER                     = 125;
    public static final byte APPLAUSE                       = 126;
    public static final byte GUNSHOT                        = 127;
}
