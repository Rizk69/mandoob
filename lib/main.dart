import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:mandoob/app/app.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/core/netowork_core/bloc_observer.dart';
import 'package:mandoob/core/netowork_core/firebase_notification.dart';
import 'package:mandoob/core/resources/language_manager.dart';
import 'package:mandoob/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = MyBlocObserver();


  await initAppModule();



  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseNotification().initNotification();
  /// transparent status bar
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
  initProfileModule();
  runApp(
    EasyLocalization(
      supportedLocales: const [ARABIC_LOCAL, ENGLISH_LOCAL],
      path: ASSTET_PATH_LOCALISATION,
      child: Phoenix(child: MyApp()),
    ),
  );
}
