import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_background/flutter_background.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart';
import 'package:lineblocs/screen/callscreen.dart';
import 'package:lineblocs/screen/dashboard.dart';
import 'package:lineblocs/screen/splash_screen.dart';
import 'package:lineblocs/utils/app_colors.dart';
import 'package:lineblocs/utils/shared_preferences/preferences_manager.dart';
import 'package:sip_ua/sip_ua.dart';
import 'package:sizer/sizer.dart';

import 'controller/theme_controller.dart';

/// SDK version 3.24.2 and dart version 3.5.2

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await FlutterBackground.initialize();
  if(Platform.isAndroid) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: 'AIzaSyDv6xzA3diMrfClAPxRMZxJv6KGIaHpGDc',
          appId: '1:507730239963:android:1d705bd25ab916291a47fe',
          messagingSenderId: '507730239963',
          projectId: 'lineblocs-18e64',
          storageBucket: 'lineblocs-18e64.firebasestorage.app',
        )
    );
  }else{
    await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: 'AIzaSyBjKRH5OoYMq77xddzazkLFcfYwk_e7sWo',
          appId: '1:507730239963:ios:b5393e95882f1d721a47fe',
          messagingSenderId: '507730239963',
          projectId: 'lineblocs-18e64',
          storageBucket: 'lineblocs-18e64.firebasestorage.app',
        )
    );
  }

  if (WebRTC.platformIsDesktop) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
  final DarwinInitializationSettings initializationSettingsDarwin = DarwinInitializationSettings();
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsDarwin,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  final ThemeController themeController = Get.put(ThemeController());
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: themeController.isDarkMode.value ? null :
    AppColor.primaryColor,
    statusBarIconBrightness: Brightness.dark,
  ));
  await PreferencesManager.getInstance();
}

typedef PageContentBuilder = Widget Function(
    [SIPUAHelper? helper, Object? arguments]);

class MyApp extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());

  final SIPUAHelper _helper = SIPUAHelper();

  Map<String, PageContentBuilder> routes = {
    '/': ([SIPUAHelper? helper, Object? arguments]) => SplashScreen(helper!),
    '/dashboard': ([SIPUAHelper? helper, Object? arguments]) =>
        DashboardScreen(helper),
    '/callscreen': ([SIPUAHelper? helper, Object? arguments]) => CallScreenWidget(helper!,arguments as Call?),
  };

  Route<dynamic>? _onGenerateRoute(RouteSettings settings) {
    final String? name = settings.name;
    final PageContentBuilder? pageContentBuilder = routes[name!];
    if (pageContentBuilder != null) {
      if (settings.arguments != null) {
        final Route route = MaterialPageRoute<Widget>(
            builder: (context) =>
                pageContentBuilder(_helper, settings.arguments));
        return route;
      } else {
        final Route route = MaterialPageRoute<Widget>(
            builder: (context) => pageContentBuilder(_helper));
        return route;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return  Obx(() {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
          initialRoute: '/',
          onGenerateRoute: _onGenerateRoute,
        );
      });
    });
  }

}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  _showNotification(message);
}

void _showNotification(RemoteMessage message) async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
  AndroidNotificationDetails(
    'your_channel_id',
    'your_channel_name',
    importance: Importance.max,
    priority: Priority.high,
    showWhen: false,
  );
  const NotificationDetails platformChannelSpecifics =
  NotificationDetails(android: androidPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.show(
    0,
    message.notification?.title,
    message.notification?.body,
    platformChannelSpecifics,
    payload: 'item x',
  );
}