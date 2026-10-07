import 'ai_module.dart';

class AiRouter {
  AiModuleType? activeModule;

  void activate(AiModuleType module) {
    activeModule = module;
  }

  void deactivate() {
    activeModule = null;
  }
}
