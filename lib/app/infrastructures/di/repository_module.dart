import 'package:attendance_mobile/app/infrastructures/endpoints.dart';
import 'package:attendance_mobile/app/infrastructures/persistences/api_service.dart';
import 'package:attendance_mobile/app/repositories/api/user_api_repository.dart';
import 'package:attendance_mobile/data/persistences/mappers/user_mapper.dart';
import 'package:injector/injector.dart';
class RepositoryModule {

  static void init(Injector injector) {
    injector.registerDependency<UserApiRepository>( (Injector injector) {
      return UserApiRepository(
        injector.getDependency<ApiService>(),
        injector.getDependency<Endpoints>(),
        injector.getDependency<UserMapper>()
      );
    });
  }
}