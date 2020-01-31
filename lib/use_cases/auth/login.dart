import 'dart:async';

import 'package:attendance_mobile/data/payload/contracts/auth_request.dart';
import 'package:attendance_mobile/domains/entities/user.dart';
import 'package:attendance_mobile/domains/repositories/auth_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class LoginUseCase extends UseCase<Auth, LoginRequestInterface> {
  AuthRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Stream<Auth>> buildUseCaseStream(LoginRequestInterface payload) async {
    final StreamController<Auth> controller = StreamController();
    try {
      Auth auth = await _repository.login(payload);
      controller.add(auth);
      controller.close();
    } catch (e) {
      print(e);
      controller.addError(e);
    }
    return controller.stream;
  }
}
