class User {
  int id;
  Profile profile;

  User({this.id, this.profile});
}

class Profile {
  String idnumber;
  String name;
  String email;
  int phone;

  Profile({this.idnumber, this.name, this.email, this.phone});
}
