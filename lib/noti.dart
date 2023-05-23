import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notifi{
  static Future initialise(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitialise=new AndroidInitializationSettings('mipmap/ic_launcher');
    var iosInitialize=new DarwinInitializationSettings();
    var  initializationSettings=new InitializationSettings(android: androidInitialise,iOS: iosInitialize);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }
}