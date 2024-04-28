import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mandoob/app/app_prefs.dart';
import 'package:mandoob/app/di.dart';

class FirebaseNotification{

  final _firebaseMessaging = FirebaseMessaging.instance;

  Future  initNotification() async {
    AppPreferences _appPreferences = instance<AppPreferences>();


    await _firebaseMessaging.requestPermission();

    String? token = await _firebaseMessaging.getToken();

    // print("Token : $token");

    _appPreferences.setUserDeviceToken(token!);

    print(_appPreferences.getUserDeviceToken());

  }

}