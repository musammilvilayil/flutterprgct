# Model and runtime catalogue

| Feature | Runtime / asset | Provenance and licence | Input / output | Status |
| --- | --- | --- | --- | --- |
| OCR | Google ML Kit Text Recognition, delivered in the Android app dependency | Google ML Kit Android SDK terms; Flutter bridge MIT | Camera image -> recognized blocks/lines/text | Implemented, on-device once installed |
| Object detection | Google ML Kit Object Detection and Tracking, base model | Google ML Kit Android SDK terms; Flutter bridge MIT | Camera image -> bounding boxes, labels, confidence | Implemented, on-device once installed |
| Speech recognition | Android `SpeechRecognizer` through `speech_to_text` | Android system service; package BSD-3-Clause | Microphone -> text | Requests `onDevice`; the user must install the required offline language pack |
| Speech synthesis | Android system TTS through `flutter_tts` | Android system service; package MIT | Text -> spoken audio | Implemented; quality/languages depend on installed voice data |
| Sign language / hand gestures | MediaPipe Gesture Recognizer `gesture_recognizer.task` v1 | MediaPipe model download and source are Apache-2.0. Do not substitute an unverified file. | Live/captured RGB image -> category and score | Android bridge present; model asset must be added with SHA-256 before release |
| Face recognition | Embedding model + local encrypted template store | No model is included yet. A detector is not an identity recognizer. | Aligned face -> embedding; cosine similarity | Not released: enrollment and recognition stay disabled until a verified redistributable embedding model is included |

## Gesture vocabulary

The upstream MediaPipe canned model recognizes only: `Closed_Fist`, `Open_Palm`,
`Pointing_Up`, `Thumb_Down`, `Thumb_Up`, `Victory`, and `ILoveYou` (plus
`None`). These are hand gestures, not a general sign-language interpreter and
must be presented under that limitation in the interface and release notes.

Before release, add the exact upstream URL, version, SHA-256, size, model card,
and the licence copy for every redistributed binary. Do not claim a face or
sign model is bundled until that file is in this directory and tested on a phone.
