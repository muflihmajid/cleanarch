import 'package:attendance_mobile/app/infrastructures/app_component.dart';
import 'package:attendance_mobile/app/misc/constants.dart';
import 'package:attendance_mobile/app/ui/pages/home/controller.dart';
import 'package:attendance_mobile/app/ui/res/generated/i18n.dart';
import 'package:attendance_mobile/app/ui/widgets/app_bar.dart';
import 'package:attendance_mobile/app/ui/widgets/rto_widget.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter/material.dart';

class HomePage extends View {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState(
      AppComponent.getInjector().getDependency<HomeController>());
}

class _HomePageState extends ViewState<HomePage, HomeController>
    with WidgetsBindingObserver {
  _HomePageState(HomeController controller) : super(controller);

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
  Widget build(BuildContext context) {
    return new Scaffold(
        key: globalKey,
        body: RtoWidget(
          onPressed: () {
            controller.checkInternetConnection();
          },
        ));
  }
}
