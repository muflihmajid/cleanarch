class User {
  Data data;
  Auth auth;

  User({this.data, this.auth});
}

class Auth {
  String accessToken;
  int expiresAt;

  Auth({this.accessToken, this.expiresAt});
}

class Data {
  String name;
  String employeenumber;
  String position;
  String grade;
  String email;
  String mobilephone;
  String joindate;
  String employmentstatus;
  String profilephoto;
  String ktp;
  String npwp;

  Data(
      {this.name,
      this.employeenumber,
      this.position,
      this.grade,
      this.email,
      this.mobilephone,
      this.joindate,
      this.employmentstatus,
      this.profilephoto,
      this.ktp,
      this.npwp});
}
