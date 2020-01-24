import 'dart:convert';
import 'package:attendance_mobile/app/infrastructures/endpoints.dart';
import 'package:attendance_mobile/app/infrastructures/event/ios_notification.dart';
import 'package:attendance_mobile/app/infrastructures/persistences/api_service.dart';
import 'package:attendance_mobile/app/misc/user_data.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:dio/dio.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injector/injector.dart';

// Commonly here to declare dependency injection
class RootModule {
  static void init(Injector injector) {
    injector.registerSingleton<Endpoints>(
        (_) => Endpoints(DotEnv().env['BASE_URL']));
    injector.registerSingleton<UserData>((_) => UserData());

    injector.registerDependency<Dio>((Injector injector) {
      var dio = Dio();
      dio.options.connectTimeout = 10000;
      dio.options.receiveTimeout = 30000;

      var userData = injector.getDependency<UserData>();
      var endpoints = injector.getDependency<Endpoints>();

      dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
      dio.interceptors.add(DioCacheManager(CacheConfig(baseUrl: endpoints.baseUrl)).interceptor);

      if (userData.token != null && userData.token.isNotEmpty)
        dio.options.headers["Authorization"] = "Bearer " + userData.token;
      dio.options.baseUrl = endpoints.baseUrl;

      (dio.transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
      return dio;
    });

    injector.registerSingleton<EventBus>((Injector injector) {
      return EventBus();
    });

    injector.registerDependency<ApiService>((Injector injector) {
      return ApiService(
        injector.getDependency<Dio>(),
        injector.getDependency<EventBus>()
        );
    });

    // notification manager
    injector.registerDependency<AndroidInitializationSettings>((Injector injector) {
      return AndroidInitializationSettings('app_icon');
    });

    injector.registerDependency<IOSInitializationSettings>((Injector injector) {
      var _eventBus = injector.getDependency<EventBus>();
      return IOSInitializationSettings(
        onDidReceiveLocalNotification: (int id, String title, String body, String payload) async {
          _eventBus.fire(IOSNotification(id, title, payload));
        }
      );
    });

    injector.registerDependency<InitializationSettings>((Injector injector) {
      return InitializationSettings(
        injector.getDependency<AndroidInitializationSettings>(), 
        injector.getDependency<IOSInitializationSettings>()
      );
    });

  }

  static parseAndDecode(String response) {
    return jsonDecode(response);
  }

  static parseJson(String text) {
    return compute(parseAndDecode, text);
  }
}
