import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ing_app_1502/package/local_notification_service.dart';
import 'package:ing_app_1502/package/notification_service.dart';
import 'package:ing_app_1502/pages/decoration_pages/colors.dart';
import 'package:ing_app_1502/pages/home_screen/home_page.dart';

final service = FirebaseNotificationService();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(
      FirebaseNotificationService.backgroundMessage);
  LocalNotificationServices.initialize();
  MobileAds.instance.initialize();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'E-LooPsAkademi',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: kDeepPurple),
            backgroundColor: Colors.white,
            elevation: 0.0,
            centerTitle: true,
          ),
          primarySwatch: Colors.yellow,
        ),
        home: const HomePage());
  }
}
