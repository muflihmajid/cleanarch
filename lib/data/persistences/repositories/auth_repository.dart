import 'package:attendance_mobile/data/payload/contracts/auth_request.dart';
import 'package:attendance_mobile/domains/entities/user.dart';

// Declaring interface that the entity should be implemented
abstract class AuthRepository {
  Future<Auth> login(LoginRequestInterface loginRequest);
}
