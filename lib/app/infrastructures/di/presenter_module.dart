import 'package:attendance_mobile/app/ui/pages/profile/presenter.dart';
import 'package:attendance_mobile/use_cases/user/get_user.dart';
import 'package:injector/injector.dart';

// Commonly here to declare dependency injection
class PresenterModule {
  static void init(Injector injector) {
    injector.registerDependency<ProfilePresenter>((Injector injector) {
      return ProfilePresenter(injector.getDependency<GetUserUseCase>(),
          );
    });
  }
}
