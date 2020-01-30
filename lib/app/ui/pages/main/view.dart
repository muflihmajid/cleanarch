import 'package:attendance_mobile/app/infrastructures/app_component.dart';
import 'package:attendance_mobile/app/misc/constants.dart';
import 'package:attendance_mobile/app/ui/pages/attendance/view.dart';
import 'package:attendance_mobile/app/ui/pages/home/view.dart';
import 'package:attendance_mobile/app/ui/pages/main/controller.dart';
import 'package:attendance_mobile/app/ui/pages/profile/view.dart';
import 'package:attendance_mobile/app/ui/res/generated/i18n.dart';
import 'package:attendance_mobile/app/ui/widgets/app_bar.dart';
import 'package:attendance_mobile/app/ui/widgets/rto_widget.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter/material.dart';

class MainPage extends View {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => new _MainPageState(
      AppComponent.getInjector().getDependency<MainController>());
}

class _MainPageState extends ViewState<MainPage, MainController>
    with WidgetsBindingObserver {
  _MainPageState(MainController controller) : super(controller);

  List<Widget> pages = [
    new HomePage(),
    new AttendancePage(),
    new ProfilePage(),
  ];

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
      body: pages[controller.tabIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        backgroundColor: AppConstants.COLOR_WHITE,
        selectedItemColor: AppConstants.COLOR_PRIMARY_COLOR,
        unselectedItemColor: Colors.grey,
        items: [
          new BottomNavigationBarItem(
            icon: new ImageIcon(
              AssetImage('lib/app/ui/assets/icons/home.png'),
              size: 30,
            ),
            title: new Text(S.of(context).home_bar),
          ),
          new BottomNavigationBarItem(
            icon: new ImageIcon(
              AssetImage('lib/app/ui/assets/icons/attend.png'),
              size: 30,
            ),
            title: new Text(S.of(context).attendance_bar),
          ),
          new BottomNavigationBarItem(
            icon: new ImageIcon(
              AssetImage('lib/app/ui/assets/icons/profile.png'),
              size: 30,
            ),
            title: new Text(S.of(context).profile_bar),
          ),
        ],
        currentIndex: controller.tabIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          controller.changeTab(index);
        },
      ),
    );
  }
}
