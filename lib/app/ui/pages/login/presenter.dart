import 'package:attendance_mobile/data/payload/contracts/auth_request.dart';
import 'package:attendance_mobile/domains/entities/user.dart';
import 'package:attendance_mobile/use_cases/auth/login.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class LoginPresenter extends Presenter {
  LoginUseCase _usecase;

  Function loginOnNext;
  Function loginOnComplete;
  Function loginOnError;

  LoginPresenter(LoginUseCase usecase) {
    _usecase = usecase;
  }

  void onLogin(LoginRequestInterface request) {
    _usecase.execute(_LoginObserver(this), request);
  }

  void dispose() {
    _usecase.dispose();
  }
}

class _LoginObserver implements Observer<Auth> {
  LoginPresenter _presenter;

  _LoginObserver(this._presenter);
  
  void onNext(Auth auth) {
    _presenter.loginOnNext(auth);
  }

  void onComplete() {
    _presenter.loginOnComplete();
  }

  void onError(e) {
    _presenter.loginOnError(e);
  }
}