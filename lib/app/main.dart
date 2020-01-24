import 'package:attendance_mobile/app/infrastructures/app_component.dart';
import 'package:attendance_mobile/app/ui/pages/start/splash/view.dart';
import 'package:attendance_mobile/app/ui/res/generated/i18n.dart';
import 'package:connectivity/connectivity.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'infrastructures/router.dart';

main() {
  DotEnv().load('.env'); // load env
  AppComponent.init(); // init dependency
  
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(MyApp()); // run app
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Router _router = Router();
  final EventBus _eventBus = EventBus();
  static bool isConnectedToInternet = false;
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale('id'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),
      onGenerateRoute: _router.getRoute,
      navigatorObservers: [_router.routeObserver],
    );
  }
}

