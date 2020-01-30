// import 'package:flushbar/flushbar.dart';
import 'package:attendance_mobile/app/infrastructures/contracts/base_controller.dart';
import 'package:attendance_mobile/app/misc/user_data.dart';
import 'package:attendance_mobile/app/ui/pages/profile/presenter.dart';
import 'package:attendance_mobile/domains/entities/user.dart';

class ProfileController extends BaseController {
  UserData _sp;
  User _user;
  ProfilePresenter _presenter;

  User get userdata=> _user;
  UserData get sp => _sp;

  ProfileController(this._sp) : super() {
    // setupFlushbar();
  }

  @override
  void initListeners() {
    super.initListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _presenter.getUserOnNext = (User user) {
      _user = user;
      print("${_user.data.email}");
      dismissLoading();
      refreshUI();
    };

    _presenter.getUserOnComplete = () {
      sp.fromUser(_user);
      sp.save();
    };

    _presenter.getUserOnError = (e) {
      dismissLoading();
    };
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
