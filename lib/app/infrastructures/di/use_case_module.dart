import 'package:attendance_mobile/app/repositories/api/user_api_repository.dart';
import 'package:attendance_mobile/use_cases/user/get_user.dart';
import 'package:injector/injector.dart';

// Commonly here to declare dependency injection
class UseCaseModule {
  static void init(Injector injector) {
    // Use case
    injector.registerDependency<GetUserUseCase>((Injector injector) {
      return GetUserUseCase(injector.getDependency<UserApiRepository>());
    });
  }
}
