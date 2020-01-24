import 'package:attendance_mobile/app/misc/constants.dart';
import 'package:attendance_mobile/domains/entities/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  // basic profile
  int id_number;
  String name;

  // token
  String token;
  int expiresAt;

  // misc
  bool isRegistered;
  
  UserData() {
    this._loadData();
  }

  void fromUser(User user) {
    this.id_number = user.id;

  }


  void _loadData() {
    this._getSharedPreferences().then((sp) {
      this.id_number = sp.getInt(AppConstants.USER_DATA_ID) ?? 0;
      this.name = sp.getString(AppConstants.USER_DATA_NAME) ?? "";
      
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
    this.id_number = null;
    this.name = null;
  }

  Future<void> save() {
    return this._getSharedPreferences().then((sp) {
      sp.setInt(AppConstants.USER_DATA_ID, this.id_number);
      sp.setString(AppConstants.USER_DATA_NAME, this.name);
    });
  }
  
  Future<SharedPreferences> _getSharedPreferences() async {
    return SharedPreferences.getInstance();
  }
}
