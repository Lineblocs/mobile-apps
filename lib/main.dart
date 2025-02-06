import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  if (WebRTC.platformIsDesktop) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
  final ThemeController themeController = Get.put(ThemeController());
  runApp( MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: themeController.isDarkMode.value ? null :
    AppColor.primaryColor,
    statusBarIconBrightness: Brightness.dark,
  ));
  await PreferencesManager.getInstance();
}

typedef PageContentBuilder = Widget Function(
    [SIPUAHelper? helper, Object? arguments]);

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeController themeController = Get.put(ThemeController());
  String? _fcmToken;
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

  @override
  initState() {
    super.initState();
    // _getToken();
  }

  Future<void> _getToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    // Request permission for iOS
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      String? token = await messaging.getToken();
      setState(() {
        _fcmToken = token;
      });
      print("FCM Token: $_fcmToken");
    } else {
      print("Permission declined");
    }
  }
}
