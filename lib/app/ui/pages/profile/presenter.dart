import 'package:attendance_mobile/domains/entities/user.dart';
import 'package:attendance_mobile/use_cases/user/get_user.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class ProfilePresenter extends Presenter {
  GetUserUseCase _getUseCase;

  Function getUserOnNext;
  Function getUserOnComplete;
  Function getUserOnError;

  ProfilePresenter(this._getUseCase);

  void onLoadUser() {
    _getUseCase.execute(_GetUserObserver(this));
  }

  
  void dispose() {
    _getUseCase.dispose();
    
  }
}

class _GetUserObserver implements Observer<User> {
  ProfilePresenter _presenter;
  _GetUserObserver(this._presenter);
  
  void onNext(User user) {
    _presenter.getUserOnNext(user);
  }

  void onComplete() {
    _presenter.getUserOnComplete();
  }

  void onError(e) {
    _presenter.getUserOnError(e);
  }
}
