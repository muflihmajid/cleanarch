import 'package:attendance_mobile/app/infrastructures/contracts/base_controller.dart';
import 'package:attendance_mobile/app/misc/user_data.dart';
import 'package:attendance_mobile/app/ui/pages/login/presenter.dart';
import 'package:attendance_mobile/app/ui/pages/pages.dart';
import 'package:attendance_mobile/data/payload/api/login_api_payload.dart';
import 'package:attendance_mobile/domains/entities/user.dart';
import 'package:flutter/widgets.dart';

class LoginController extends BaseController {
  LoginPresenter _presenter;
  Auth _auth;
  UserData _userData;

  bool _isErrorEmployeeCode = false, _isObscured = true;

  TextEditingController _employeeInput = new TextEditingController();
  TextEditingController _passwordInput = new TextEditingController();

  TextEditingController get employeeNumberInput => _employeeInput;
  TextEditingController get passwordInput => _passwordInput;
  ErrorMessage _errorMessage = new ErrorMessage();
  Auth get auth => _auth;
  ErrorMessage get errorMessage => _errorMessage;
  bool get isErrorEmployeeCode => _isErrorEmployeeCode;
  bool get isObscured => _isObscured;

  LoginController(this._presenter, this._userData) : super() {
    _auth = Auth();
    _passwordInput.addListener(_onInputChange);
  }

  void login() {
    refreshUI();
    _presenter.onLogin(LoginApiRequest(
        userID: _employeeInput.text,
        password: _passwordInput.text));
  }

  bool isAllFilled() {
    return _employeeInput.text.isNotEmpty
        ? true
        : false;
  }

  @override
  void initListeners() {
    super.initListeners();

    _presenter.loginOnNext = (Auth auth) {
      _auth = auth;
      refreshUI();
    };

    _presenter.loginOnComplete = () async {
      _userData.fromAuth(_auth);
      _userData.password = _passwordInput.text;
      await _userData.save();
      print("hasil ngegate${_auth.expiresAt}");
      Navigator.pushReplacementNamed(getContext(), Pages.main);
    };

    _presenter.loginOnError = (e) {
      // do log here
    };
  }

  @override
  void dispose() {
    _presenter.dispose();
    super.dispose();
  }

  void toggleVisibility() {
    _isObscured = !_isObscured;
    refreshUI();
  }

  void _onInputChange() {
    //_isError = _EmployeeCodeInput.text != "49494" ? true : false;
    //_errorMessage = _EmployeeCodeInput.text != "49494" ? 'Error: kode Employee tidak valid ' : null;
    _errorMessage.employeecode =
        _employeeInput.text.length < 3 ? 'Kode Employee tidak valid ' : '';
  }
}

class ErrorMessage {
  String employeecode = '';
  bool isValid() {
    return employeecode.isEmpty ? true : false;
  }
}
