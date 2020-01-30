import 'package:attendance_mobile/app/infrastructures/app_component.dart';
import 'package:attendance_mobile/app/infrastructures/event/connection.dart';
import 'package:attendance_mobile/app/infrastructures/event/error.dart';
import 'package:attendance_mobile/app/infrastructures/event/reset_ui.dart';
import 'package:attendance_mobile/app/infrastructures/view_utils.dart';
import 'package:connectivity/connectivity.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class BaseController extends Controller {
  EventBus _eventBus = AppComponent.getInjector().getDependency<EventBus>();
  bool _internetAvailable = true;
  bool _isMounted = true;
  Function _refresh;
  bool isLoading;

  bool get internetAvailable => _internetAvailable;

  @override
  void initListeners() {
    checkInternetConnection();

    _eventBus.on<ResetUIEvent>().listen((event) {
      dismissLoading();
      ViewUtils.dismissProgressDialog();
      refreshUI();
    });

    // Check if data/wifi is active every OS setting change
    _eventBus.on<ConnectionEvent>().listen((event) {
      if (event.isConnected) {
        internetAvailabilityCycle(true);
        refreshUI();
      } else {
        internetAvailabilityCycle(false);
        dismissLoading();
        refreshUI();
      }
    });
  }

  void internetAvailabilityCycle(bool status) {
    if (status) {
      _internetAvailable = status;
      onInternetDisconnected();
    } else {
      _internetAvailable = status;
      onInternetConnected();
    }
  }

  void onError({String title = "Error", String message = "Please try again!"}) {
    _eventBus.fire(ErrorEvent(message));
  }

  void checkInternetConnection() {
    // Check if data/wifi is active every init controller
    Connectivity().checkConnectivity().then((connection) {
      if (connection == ConnectivityResult.none) {
        dismissLoading();
        internetAvailabilityCycle(false);
        refreshUI();
      } else {
        internetAvailabilityCycle(true);
        refreshUI();
      }
    });
  }

  void onInternetConnected() {}

  void onInternetDisconnected() {}

  void onProgressLoading() {
    ViewUtils.showProgressDialog(getContext());
  }

  void onFinishLoading() {
    ViewUtils.dismissProgressDialog();
  }

  void dismissLoading() {
    assert(_refresh != null,
        '''The `refresh callback is somehow null. This might be because `dismissLoading()` was called
     before the `View` called `controller.initController()`.
     Please open an issue at `https://github.com/ShadyBoukhary/flutter_clean_architecture` describing 
     the error.''');
    if (_isMounted) _refresh(() => isLoading = false);
  }

  void showLoading() {
    assert(_refresh != null,
        '''The `_refresh callback is somehow null. This might be because `showLoading()` was called
     before the `View` called `controller.initController()`.
     Please open an issue at `https://github.com/ShadyBoukhary/flutter_clean_architecture` describing 
     the error.''');
    _refresh(() => isLoading = true);
  }
  
}
