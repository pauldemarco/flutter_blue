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

#include <jni.h>
#include <dlfcn.h>
#include <assert.h>
#include <pthread.h>

#include <android/log.h>

// for native audio
#include <SLES/OpenSLES.h>
#include <SLES/OpenSLES_Android.h>

// for EAS midi
#include "eas.h"
#include "eas_reverb.h"

#include "org_billthefarmer_mididriver_MidiDriver.h"
#include "midi.h"

#define LOG_TAG "MidiDriver"

#define LOG_D(tag, ...) __android_log_print(ANDROID_LOG_DEBUG, tag, __VA_ARGS__)
#define LOG_E(tag, ...) __android_log_print(ANDROID_LOG_ERROR, tag, __VA_ARGS__)
#define LOG_I(tag, ...) __android_log_print(ANDROID_LOG_INFO, tag, __VA_ARGS__)

// determines how many EAS buffers to fill a host buffer
#define NUM_BUFFERS 4

// mutex
static pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;

// engine interfaces
static SLObjectItf engineObject = NULL;
static SLEngineItf engineEngine;

// output mix interfaces
static SLObjectItf outputMixObject = NULL;

// buffer queue player interfaces
static SLObjectItf bqPlayerObject = NULL;
static SLPlayItf bqPlayerPlay;
static SLAndroidSimpleBufferQueueItf bqPlayerBufferQueue;

// EAS data
static EAS_DATA_HANDLE pEASData;
const S_EAS_LIB_CONFIG *pLibConfig;
static EAS_PCM *buffer;
static EAS_I32 bufferSize;
static EAS_HANDLE midiHandle;

// this callback handler is called every time a buffer finishes
// playing
void bqPlayerCallback(SLAndroidSimpleBufferQueueItf bq, void *context)
{
    EAS_RESULT result;
    EAS_I32 numGenerated;
    EAS_I32 count;

    assert(bq == bqPlayerBufferQueue);
    assert(NULL == context);

    // for streaming playback, replace this test by logic to fill the
    // next buffer

    count = 0;
    while (count < bufferSize)
    {
        // lock
        pthread_mutex_lock(&mutex);

        result = EAS_Render(pEASData, buffer + count,
                            pLibConfig->mixBufferSize, &numGenerated);
        // unlock
        pthread_mutex_unlock(&mutex);

        assert(result == EAS_SUCCESS);

        count += numGenerated * pLibConfig->numChannels;
    }

    // enqueue another buffer
    result = (*bqPlayerBufferQueue)->Enqueue(bq, buffer,
                                             bufferSize * sizeof(EAS_PCM));

    // the most likely other result is SL_RESULT_BUFFER_INSUFFICIENT,
    // which for this code example would indicate a programming error
    assert(SL_RESULT_SUCCESS == result);
}

// create the engine and output mix objects
SLresult createEngine()
{
    SLresult result;

    // create engine
    result = slCreateEngine(&engineObject, 0, NULL, 0, NULL, NULL);
    if (SL_RESULT_SUCCESS != result)
        return result;

    // LOG_D(LOG_TAG, "Engine created");

    // realize the engine
    result = (*engineObject)->Realize(engineObject, SL_BOOLEAN_FALSE);
    if (SL_RESULT_SUCCESS != result)
        return result;

    // LOG_D(LOG_TAG, "Engine realised");

    // get the engine interface, which is needed in order to create
    // other objects
    result = (*engineObject)->GetInterface(engineObject, SL_IID_ENGINE,
                                           &engineEngine);
    if (SL_RESULT_SUCCESS != result)
        return result;

    // LOG_D(LOG_TAG, "Engine Interface retrieved");

    // create output mix
    result = (*engineEngine)->CreateOutputMix(engineEngine, &outputMixObject,
                                              0, NULL, NULL);
    if (SL_RESULT_SUCCESS != result)
        return result;

    // LOG_D(LOG_TAG, "Output mix created");

    // realize the output mix
    result = (*outputMixObject)->Realize(outputMixObject, SL_BOOLEAN_FALSE);
    if (SL_RESULT_SUCCESS != result)
        return result;

    // LOG_D(LOG_TAG, "Output mix realised");

    return SL_RESULT_SUCCESS;
}

// create buffer queue audio player
SLresult createBufferQueueAudioPlayer()
{
    SLresult result;

    // configure audio source
    SLDataLocator_AndroidSimpleBufferQueue loc_bufq =
        {
         SL_DATALOCATOR_ANDROIDSIMPLEBUFFERQUEUE, 2
        };
    SLDataFormat_PCM format_pcm =
        {
         SL_DATAFORMAT_PCM, static_cast<SLuint32>(pLibConfig->numChannels),
         static_cast<SLuint32>(pLibConfig->sampleRate * 1000),
         SL_PCMSAMPLEFORMAT_FIXED_16, SL_PCMSAMPLEFORMAT_FIXED_16,
         SL_SPEAKER_FRONT_LEFT | SL_SPEAKER_FRONT_RIGHT,
         SL_BYTEORDER_LITTLEENDIAN
        };
    SLDataSource audioSrc = {&loc_bufq, &format_pcm};

    // configure audio sink
    SLDataLocator_OutputMix loc_outmix =
        {SL_DATALOCATOR_OUTPUTMIX, outputMixObject};
    SLDataSink audioSnk = {&loc_outmix, NULL};

    // create audio player
    const SLInterfaceID ids[1] = {SL_IID_BUFFERQUEUE};
    const SLboolean req[1] = {SL_BOOLEAN_TRUE};

    result = (*engineEngine)->CreateAudioPlayer(engineEngine,
                                                &bqPlayerObject,
                                                &audioSrc, &audioSnk,
                                                1, ids, req);
    if (SL_RESULT_SUCCESS != result)
        return result;

    // LOG_D(LOG_TAG, "Audio player created");

    // realize the player
    result = (*bqPlayerObject)->Realize(bqPlayerObject, SL_BOOLEAN_FALSE);
    if (SL_RESULT_SUCCESS != result)
        return result;

    // LOG_D(LOG_TAG, "Audio player realised");

    // get the play interface
    result = (*bqPlayerObject)->GetInterface(bqPlayerObject, SL_IID_PLAY,
                                             &bqPlayerPlay);
    if (SL_RESULT_SUCCESS != result)
        return result;

    // LOG_D(LOG_TAG, "Play interface retrieved");

    // get the buffer queue interface
    result = (*bqPlayerObject)->GetInterface(bqPlayerObject, SL_IID_BUFFERQUEUE,
                                             &bqPlayerBufferQueue);
    if (SL_RESULT_SUCCESS != result)
        return result;

    // LOG_D(LOG_TAG, "Buffer queue interface retrieved");

    // register callback on the buffer queue
    result = (*bqPlayerBufferQueue)->RegisterCallback(bqPlayerBufferQueue,
                                                      bqPlayerCallback, NULL);
    if (SL_RESULT_SUCCESS != result)
        return result;

    // LOG_D(LOG_TAG, "Callback registered");

    // set the player's state to playing
    result = (*bqPlayerPlay)->SetPlayState(bqPlayerPlay, SL_PLAYSTATE_PLAYING);
    if (SL_RESULT_SUCCESS != result)
        return result;

    // LOG_D(LOG_TAG, "Audio player set playing");

    return SL_RESULT_SUCCESS;
}

// shut down the native audio system
void shutdownAudio()
{
    // destroy buffer queue audio player object, and invalidate all
    // associated interfaces
    if (bqPlayerObject != NULL)
    {
        (*bqPlayerObject)->Destroy(bqPlayerObject);
        bqPlayerObject = NULL;
        bqPlayerPlay = NULL;
        bqPlayerBufferQueue = NULL;
    }

    // destroy output mix object, and invalidate all associated interfaces
    if (outputMixObject != NULL)
    {
        (*outputMixObject)->Destroy(outputMixObject);
        outputMixObject = NULL;
    }

    // destroy engine object, and invalidate all associated interfaces
    if (engineObject != NULL)
    {
        (*engineObject)->Destroy(engineObject);
        engineObject = NULL;
        engineEngine = NULL;
    }
}

// init EAS midi
EAS_RESULT initEAS()
{
    EAS_RESULT result;

    // get the library configuration
    pLibConfig = EAS_Config();
    if (pLibConfig == NULL || pLibConfig->libVersion != LIB_VERSION)
        return EAS_FAILURE;

    // calculate buffer size
    bufferSize = pLibConfig->mixBufferSize * pLibConfig->numChannels * NUM_BUFFERS;

    // init library
    if ((result = EAS_Init(&pEASData)) != EAS_SUCCESS)
        return result;

    // select reverb preset and enable
    EAS_SetParameter(pEASData, EAS_MODULE_REVERB, EAS_PARAM_REVERB_PRESET,
                     EAS_PARAM_REVERB_CHAMBER);
    EAS_SetParameter(pEASData, EAS_MODULE_REVERB, EAS_PARAM_REVERB_BYPASS,
                     EAS_FALSE);

    // open midi stream
    if ((result = EAS_OpenMIDIStream(pEASData, &midiHandle, NULL)) != EAS_SUCCESS)
        return result;

    return EAS_SUCCESS;
}

// shutdown EAS midi
void shutdownEAS()
{

    if (midiHandle != NULL)
    {
        EAS_CloseMIDIStream(pEASData, midiHandle);
        midiHandle = NULL;
    }

    if (pEASData != NULL)
    {
        EAS_Shutdown(pEASData);
        pEASData = NULL;
    }
}

// init mididriver
jboolean midi_init()
{
    EAS_RESULT result;

    if ((result = initEAS()) != EAS_SUCCESS)
    {
        shutdownEAS();

        LOG_E(LOG_TAG, "Init EAS failed: %ld", result);

        return JNI_FALSE;
    }

    // LOG_D(LOG_TAG, "Init EAS success, buffer: %ld", bufferSize);

    // allocate buffer in bytes
    buffer = new EAS_PCM[bufferSize];
    if (buffer == NULL) {
        shutdownEAS();

        LOG_E(LOG_TAG, "Allocate buffer failed");

        return JNI_FALSE;
    }

    // create the engine and output mix objects
    if ((result = createEngine()) != SL_RESULT_SUCCESS)
    {
        shutdownEAS();
        shutdownAudio();
        delete[] buffer;
        buffer = NULL;

        LOG_E(LOG_TAG, "Create engine failed: %ld", result);

        return JNI_FALSE;
    }

    // create buffer queue audio player
    if ((result = createBufferQueueAudioPlayer()) != SL_RESULT_SUCCESS)
    {
        shutdownEAS();
        shutdownAudio();
        delete[] buffer;
        buffer = NULL;

        LOG_E(LOG_TAG, "Create buffer queue audio player failed: %ld", result);

        return JNI_FALSE;
    }

    // call the callback to start playing
    bqPlayerCallback(bqPlayerBufferQueue, NULL);

    return JNI_TRUE;
}

jboolean
Java_org_billthefarmer_mididriver_MidiDriver_init(JNIEnv *env,
                                                  jobject obj)
{
    return midi_init();
}

// midi config
jintArray
Java_org_billthefarmer_mididriver_MidiDriver_config(JNIEnv *env,
                                                    jobject obj)
{
    jboolean isCopy;

    if (pLibConfig == NULL)
        return NULL;

    jintArray configArray = env->NewIntArray(4);

    jint *config = env->GetIntArrayElements(configArray, &isCopy);

    config[0] = pLibConfig->maxVoices;
    config[1] = pLibConfig->numChannels;
    config[2] = pLibConfig->sampleRate;
    config[3] = pLibConfig->mixBufferSize;

    env->ReleaseIntArrayElements(configArray, config, 0);

    return configArray;
}

// midi write
jboolean midi_write(EAS_U8 *bytes, jint length)
{
    EAS_RESULT result;

    if (pEASData == NULL || midiHandle == NULL)
        return JNI_FALSE;

    // lock
    pthread_mutex_lock(&mutex);

    result = EAS_WriteMIDIStream(pEASData, midiHandle, bytes, length);

    // unlock
    pthread_mutex_unlock(&mutex);

    if (result != EAS_SUCCESS)
        return JNI_FALSE;

    return JNI_TRUE;
}

jboolean
Java_org_billthefarmer_mididriver_MidiDriver_write(JNIEnv *env,
                                                   jobject obj,
                                                   jbyteArray byteArray)
{
    EAS_RESULT result;
    jboolean isCopy;
    jint length;
    EAS_U8 *bytes;

    bytes = (EAS_U8 *) env->GetByteArrayElements(byteArray, &isCopy);
    length = env->GetArrayLength(byteArray);

    result = midi_write(bytes, length);

    env->ReleaseByteArrayElements(byteArray, (jbyte *) bytes, 0);

    return result;
}

// set EAS master volume
jboolean midi_setVolume(jint volume)
{
    EAS_RESULT result;

    if (pEASData == NULL || midiHandle == NULL)
        return JNI_FALSE;

    result = EAS_SetVolume(pEASData, NULL, (EAS_I32) volume);

    if (result != EAS_SUCCESS)
        return JNI_FALSE;

    return JNI_TRUE;
}

jboolean
Java_org_billthefarmer_mididriver_MidiDriver_setVolume(JNIEnv *env,
                                                       jobject obj,
                                                       jint volume)
{
    return midi_setVolume(volume);
}

// shutdown EAS midi
jboolean midi_shutdown() {
    EAS_RESULT result;

    shutdownAudio();

    if (buffer != NULL)
        delete[] buffer;
    buffer = NULL;

    shutdownEAS();

    return JNI_TRUE;
}

jboolean
Java_org_billthefarmer_mididriver_MidiDriver_shutdown(JNIEnv *env,
                                                      jobject obj)
{
    return midi_shutdown();
}
