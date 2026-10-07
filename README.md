# AI Universal Accessibility Assistant

Android-first Flutter accessibility assistant. Core processing is intended to run on-device; it has no FastAPI or server dependency.

## Honest release status

This branch is a **development baseline, not a release candidate**. It includes an accessible five-module UI, persisted dark/read-aloud settings, and functional Android system speech/TTS integration. Emotion recognition has been removed.

OCR and object detection dependencies are declared but their camera pipelines have not been verified on hardware. Sign recognition is gated on a verified bundled MediaPipe task asset. Face recognition is deliberately disabled: face detection is not identity recognition, and no licensed embedding model, encrypted template store, enrollment flow, or device validation has been completed. The app never substitutes fake detections or identities.

## Setup

1. Install Flutter and the Android SDK, then run `flutter doctor`.
2. Run `flutter pub get`, `flutter analyze`, and `flutter test`.
3. Connect an Android device with camera/microphone and run `flutter run`.
4. Install the relevant Android offline speech language pack before using offline STT.

## Required release gates

- Add the generated Android platform folder (`flutter create .`) and declare Camera and Record Audio permissions.
- Implement and physically validate camera-frame conversion, OCR, object boxes/labels and TTS throttling.
- Bundle a hash-pinned, licence-reviewed MediaPipe gesture task and test only its documented vocabulary.
- Add a permissively redistributable face embedding model, enrollment UI, encrypted local templates, threshold calibration and spoof/privacy evaluation.
- Build/debug and release APKs on CI and test on supported real devices.

See [the model catalogue](assets/models/MODEL_CATALOG.md) for source, licence, I/O and limitations.
