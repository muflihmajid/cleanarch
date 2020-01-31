import 'package:attendance_mobile/domains/entities/user.dart';

class AuthMapper {

 Auth authApiConverter(Map<String, dynamic> response) {
    var data = response['data'];
    return Auth(
      accessToken: data['auth_token'],
      expiresAt:  data['expires_at']
    );
  }
  

}