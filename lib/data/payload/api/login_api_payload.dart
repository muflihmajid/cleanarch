import 'package:attendance_mobile/data/payload/contracts/auth_request.dart';

class LoginApiRequest extends LoginRequestInterface {
  String userID;
  String password;

  LoginApiRequest({this.userID, this.password});

  Map<String, dynamic> toJson() {
    var data = {
      "user_id": this.userID,
      "password": this.password,
    };

    return {
      "data": data
    };
  }
}