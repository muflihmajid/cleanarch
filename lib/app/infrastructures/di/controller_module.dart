import 'package:attendance_mobile/app/misc/user_data.dart';
import 'package:attendance_mobile/app/ui/pages/attendance/controller.dart';
import 'package:attendance_mobile/app/ui/pages/home/controller.dart';
import 'package:attendance_mobile/app/ui/pages/main/controller.dart';
import 'package:attendance_mobile/app/ui/pages/profile/controller.dart';
import 'package:attendance_mobile/app/ui/pages/start/splash/controller.dart';
import 'package:injector/injector.dart';

class ControllerModule {
  static void init(Injector injector) {
    injector.registerDependency<SplashController>((Injector injector) {
      return SplashController(injector.getDependency<UserData>());
    });
    injector.registerDependency<MainController>((Injector injector) {
      return MainController(injector.getDependency<UserData>());
    });
    injector.registerDependency<HomeController>((Injector injector) {
      return HomeController(injector.getDependency<UserData>());
    });
    injector.registerDependency<AttendanceController>((Injector injector) {
      return AttendanceController(injector.getDependency<UserData>());
    });
    injector.registerDependency<ProfileController>((Injector injector) {
      return ProfileController(injector.getDependency<UserData>());
    });
  }
  
}
