import 'package:attendance_mobile/domains/entities/user.dart';

class UserMapper {
  User getUserApiConverter(Map<String, dynamic> response) {
    var data = response['data'];
    return User(
      id: data['id'],
      profile: Profile(
        idnumber: data['profile']['id_number'],
        name: data['profile']['name'],
        email: data['profile']['email'],
        phone: data['profile']['phone'],
      ),
    );
  }
}
