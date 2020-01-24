import 'package:attendance_mobile/domains/entities/user.dart';

abstract class UserRepository {
  Future<List<User>> getAll();
  Future<User> show();
}