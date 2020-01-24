import 'dart:async';

import 'package:attendance_mobile/app/infrastructures/contracts/base_controller.dart';
import 'package:attendance_mobile/app/misc/user_data.dart';
import 'package:attendance_mobile/app/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashController extends BaseController {
  UserData _sp;

  PermissionStatus _statusCamera;
  PermissionStatus _statusLocation;

  SplashController(this._sp) : super() {
    _checkPermission();
  }

  @override
  void initListeners() {
    super.initListeners();
  }

  _checkPermission() {
    PermissionHandler()
        .checkPermissionStatus(PermissionGroup.locationAlways)
        .then(_updateStatusLocation);
    PermissionHandler()
        .checkPermissionStatus(PermissionGroup.camera)
        .then(_updateStatusCamera);

    if (_statusCamera != PermissionStatus.granted &&
        _statusLocation != PermissionStatus.granted) {
      _requestPermissions().whenComplete(() {
        Navigator.pushReplacementNamed(getContext(), Pages.main);
        _navigate();
      });
    }
  }

  _navigate() {
    var _duration = new Duration(seconds: 1);
    return new Timer(_duration, () {
      return Navigator.pushReplacementNamed(getContext(), Pages.main);
    });
  }

  Future<void> _requestPermissions() async {
    await PermissionHandler().requestPermissions(
        [PermissionGroup.locationAlways, PermissionGroup.camera]);
  }

  void _updateStatusCamera(PermissionStatus status) {
    if (status != _statusCamera) {
      _statusCamera = status;
    }
  }

  void _updateStatusLocation(PermissionStatus status) {
    if (status != _statusLocation) {
      _statusLocation = status;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
