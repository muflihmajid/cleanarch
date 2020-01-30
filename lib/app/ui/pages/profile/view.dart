import 'package:attendance_mobile/app/infrastructures/app_component.dart';
import 'package:attendance_mobile/app/misc/constants.dart';
import 'package:attendance_mobile/app/ui/pages/home/controller.dart';
import 'package:attendance_mobile/app/ui/pages/profile/controller.dart';
import 'package:attendance_mobile/app/ui/res/generated/i18n.dart';
import 'package:attendance_mobile/app/ui/widgets/app_bar.dart';
import 'package:attendance_mobile/app/ui/widgets/rto_widget.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter/material.dart';

class ProfilePage extends View {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => new _ProfilePageState(
      AppComponent.getInjector().getDependency<ProfileController>());
}

class _ProfilePageState extends ViewState<ProfilePage, ProfileController>
    with WidgetsBindingObserver {
  _ProfilePageState(ProfileController controller) : super(controller);

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
        body: Text("Cek bisa gak ${controller.userdata.data.email}"));
  }
}
