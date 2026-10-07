enum AiModuleType {
  signLanguage,
  objectDetection,
  ocr,
  speechToText,
  textToSpeech,
  faceRecognition,
}

abstract interface class AiModule<I, O> {
  AiModuleType get type;
  Future<void> initialize();
  Future<O> process(I input);
  Future<void> dispose();
}
