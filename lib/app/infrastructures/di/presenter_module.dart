import 'package:injector/injector.dart';

// Commonly here to declare dependency injection
class PresenterModule {
  static void init(Injector injector) {

    // injector.registerDependency<AppInfoPresenter>((Injector injector) {
    //   return AppInfoPresenter(injector.getDependency<GetStaticContentUseCase>());
    // });
  }
}
