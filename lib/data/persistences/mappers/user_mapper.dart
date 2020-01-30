import 'package:attendance_mobile/domains/entities/user.dart';

class UserMapper {
  User getUserApiConverter(Map<String, dynamic> response) {
    var data = response['data'];
    return User(
      data: Data(
        name: data['data']['name'],
        employeenumber: data['data']['employee_number'],
        position: data['data']['position'],
        grade: data['data']['grade'],
        email: data['data']['email'],
        mobilephone: data['data']['mobilephone'],
        joindate: data['data']['joindate'],
        employmentstatus: data['data']['employment_status'],
        profilephoto: data['data']['profile_photo'],
        ktp: data['data']['ktp'],
        npwp: data['data']['npwp'],
      ),
    );
  }
}
