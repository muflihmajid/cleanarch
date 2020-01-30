import 'package:attendance_mobile/app/infrastructures/app_component.dart';
import 'package:attendance_mobile/app/misc/constants.dart';
import 'package:attendance_mobile/app/ui/pages/attendance/controller.dart';
import 'package:attendance_mobile/app/ui/pages/home/controller.dart';
import 'package:attendance_mobile/app/ui/res/generated/i18n.dart';
import 'package:attendance_mobile/app/ui/widgets/app_bar.dart';
import 'package:attendance_mobile/app/ui/widgets/rto_widget.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter/material.dart';

class AttendancePage extends View {
  AttendancePage({Key key}) : super(key: key);

  @override
  _AttendancePageState createState() => new _AttendancePageState(
      AppComponent.getInjector().getDependency<AttendanceController>());
}

class _AttendancePageState extends ViewState<AttendancePage, AttendanceController>
    with WidgetsBindingObserver {
  _AttendancePageState(AttendanceController controller) : super(controller);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget buildPage() {
    return new Scaffold(
        key: globalKey,
        body: RtoWidget(
          onPressed: () {
            controller.checkInternetConnection();
          },
        ));
  }
}
