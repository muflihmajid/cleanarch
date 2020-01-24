// import 'package:flushbar/flushbar.dart';
import 'package:attendance_mobile/app/infrastructures/contracts/base_controller.dart';
import 'package:attendance_mobile/app/misc/user_data.dart';
import 'package:event_bus/event_bus.dart';


class MainController extends BaseController {
  EventBus _eventBus;
  UserData _sp;
  int _tabIndex;

  int get tabIndex => _tabIndex;
  UserData get sp => _sp;

  MainController(this._sp) : super() {
    _tabIndex = 0;
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
  }

  @override
  void onInternetDisconnected() {
    super.onInternetDisconnected();
  }

  void changeTab(i) {
    this._tabIndex = i;
    refreshUI();
  }

}
