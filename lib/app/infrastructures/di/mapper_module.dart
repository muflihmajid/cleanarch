import 'package:attendance_mobile/data/persistences/mappers/auth_mapper.dart';
import 'package:attendance_mobile/data/persistences/mappers/user_mapper.dart';
import 'package:injector/injector.dart';

class MapperModule {
  static void init(Injector injector) {
    injector.registerSingleton<UserMapper>((_) => UserMapper());
    injector.registerSingleton<AuthMapper>((_) => AuthMapper());
  }
}
