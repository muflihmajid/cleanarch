import 'dart:async';

import 'package:attendance_mobile/domains/entities/user.dart';
import 'package:attendance_mobile/domains/repositories/user_repositories.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:rxdart/rxdart.dart';

// Declaring usecase of the entity
class GetUserUseCase extends UseCase<User, void> {
  UserRepository _repository;

  GetUserUseCase(this._repository);

  @override
  Future<Observable<User>> buildUseCaseObservable(void ignore) async {
    final StreamController<User> _controller = new StreamController();
    try {
      User user = await _repository.show();
      _controller.add(user);
      _controller.close();
    } catch (e) {
      print(e);
      _controller.addError(e);
    }
    return Observable(_controller.stream);
  }
}
