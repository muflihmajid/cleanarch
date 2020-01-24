// import 'package:flushbar/flushbar.dart';
import 'package:attendance_mobile/app/infrastructures/contracts/base_controller.dart';
import 'package:attendance_mobile/app/misc/user_data.dart';
import 'package:event_bus/event_bus.dart';


class AttendanceController extends BaseController {
  UserData _sp;
  EventBus _eventBus;
  
  UserData get sp => _sp;

  AttendanceController(this._sp) : super() {
    // setupFlushbar();
  }

  @override
  void initListeners() {
    super.initListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onInternetConnected() {
    super.onInternetConnected();
    // kFlushbar..show(getContext());
  }

  @override
  void onInternetDisconnected() {
    super.onInternetDisconnected();
  }

}
