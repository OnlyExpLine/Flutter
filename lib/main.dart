import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constans.dart';
import 'package:flutter_app/pages/HomePage.dart';

void main() {
  AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
            channelKey: 'basic_channel',
            channelName: 'Notification',
            channelDescription: 'Тест уведов')
      ],
    debug: true,
  );
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: indigoColor),
    home: HomePage(),
  ));
}

