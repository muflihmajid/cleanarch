import 'package:attendance_mobile/app/misc/constants.dart';
import 'package:attendance_mobile/domains/entities/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  // basic profile
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

  // token
  String token;
  int expiresAt;

  // misc
  bool isRegistered;

  UserData() {
    this._loadData();
  }

  void fromUser(User user) {
    this.name = user.data.name;
    this.employeenumber = user.data.employeenumber;
    this.position = user.data.position;
    this.grade = user.data.grade;
    this.email = user.data.grade;
    this.mobilephone = user.data.mobilephone;
    this.joindate = user.data.joindate;
    this.employmentstatus = user.data.employmentstatus;
    this.profilephoto = user.data.profilephoto;
    this.ktp = user.data.ktp;
    this.npwp = user.data.npwp;
  }

  void _loadData() {
    this._getSharedPreferences().then((sp) {
      this.name = sp.getString(AppConstants.USER_DATA_NAME) ?? "";
      this.employeenumber =
          sp.getString(AppConstants.USER_DATA_EMPLOYEE_NUMBER) ?? "";
      this.position = sp.getString(AppConstants.USER_DATA_POSITION) ?? "";
      this.grade = sp.getString(AppConstants.USER_DATA_GRADE) ?? "";
      ;
      this.email = sp.getString(AppConstants.USER_DATA_EMAIL) ?? "";
      this.mobilephone =
          sp.getString(AppConstants.USER_DATA_MOBILE_PHONE) ?? "";
      this.joindate = sp.getString(AppConstants.USER_DATA_JOIN_DATE) ?? "";
      this.employmentstatus =
          sp.getString(AppConstants.USER_DATA_EMPLOYEE_STATUS) ?? "";
      this.profilephoto =
          sp.getString(AppConstants.USER_DATA_PROFILE_PHOTO) ?? "";
      this.ktp = sp.getInt(AppConstants.USER_DATA_KTP) ?? "";
      this.npwp = sp.getString(AppConstants.USER_DATA_NPWP) ?? "";
    });
  }

  void clear() {
    this._getSharedPreferences().then((sp) {
      this.clearProperties();
      sp.clear();
    });
  }

  void clearWithCallback(Function callback) {
    this._getSharedPreferences().then((sp) {
      sp.clear().then((onValue) {
        this.clearProperties();
        callback();
      });
    });
  }

  void clearProperties() {
    this.name = null;
    this.employeenumber = null;
    this.position = null;
    this.grade = null;
    this.email = null;
    this.mobilephone = null;
    this.joindate = null;
    this.employmentstatus = null;
    this.profilephoto = null;
    this.ktp = null;
    this.npwp = null;
  }

  Future<void> save() {
    return this._getSharedPreferences().then((sp) {
      sp.setString(AppConstants.USER_DATA_NAME, this.name);
      sp.setString(AppConstants.USER_DATA_EMPLOYEE_NUMBER, this.employeenumber);
      sp.setString(AppConstants.USER_DATA_POSITION, this.position);
      sp.setString(AppConstants.USER_DATA_GRADE, this.grade);
      sp.setString(AppConstants.USER_DATA_EMAIL, this.email);
      sp.setString(AppConstants.USER_DATA_MOBILE_PHONE, this.mobilephone);
      sp.setString(AppConstants.USER_DATA_JOIN_DATE, this.joindate);
      sp.setString(AppConstants.USER_DATA_EMPLOYEE_STATUS, this.employmentstatus);
      sp.setString(AppConstants.USER_DATA_PROFILE_PHOTO, this.profilephoto);
      sp.setString(AppConstants.USER_DATA_KTP, this.ktp);
      sp.setString(AppConstants.USER_DATA_NPWP, this.npwp);
    });
  }

  Future<SharedPreferences> _getSharedPreferences() async {
    return SharedPreferences.getInstance();
  }
}
