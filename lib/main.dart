import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seven_exam/app/app.dart';
import 'package:seven_exam/app/bloc_observer.dart';


Future<void> main() async {
  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     statusBarIconBrightness: Brightness.dark,
  //     statusBarColor: Colors.transparent, // status bar color
  //   ),
  // );
  WidgetsFlutterBinding.ensureInitialized();
  /// ESDAN CHIQMASIN!!! setup();
  Bloc.observer = AppBlocObserver();
  /// KERAK BOLIB QOLADI await StorageRepository.getInstance();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  // FirebaseMessaging.onBackgroundMessage();
  await FirebaseMessaging.instance.subscribeToTopic("my_news");
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'EN'),
        Locale('ru', 'RU'),
        Locale('uz', 'UZ'),
      ],
      //fallbackLocale: const Locale('uz', 'UZ'),
      startLocale:  const Locale('en','EN'),
      path: "assets/translations",
      //saveLocale: true,
      child: App(),
    ),
  );
}
