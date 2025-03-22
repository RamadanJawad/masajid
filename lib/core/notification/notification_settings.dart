import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:masajid/core/constant/constant.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class NotificationSetting {
  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
  FlutterLocalNotificationsPlugin localNotifications =
      FlutterLocalNotificationsPlugin();

  Future<void> initLocalNotifications() async {
    var androidSettings =const AndroidInitializationSettings("@mipmap/ic_launcher");
    var initSettings = InitializationSettings(android: androidSettings);
    await localNotifications.initialize(initSettings);
  }


  Future<void> initPusher() async {
    try {
      await pusher.init(
        apiKey: Constant.appKeyPusher, // Replace with your Pusher App Key
        cluster: Constant.appClusterPusher, // Replace with your Pusher Cluster
        onConnectionStateChange: (currentState, previousState) {
          print("Pusher Connection State: $currentState");
        },
        onSubscriptionSucceeded: (channelName, data) {
          print("Subscribed to channel: $channelName");
        },
        onEvent: (event) {
          print("New Event: ${event.eventName}, Data: ${event.data}");
          try {
            Map<String, dynamic> eventData = event.data is String
                ? jsonDecode(event.data)
                : event.data;
            Map<String, dynamic> notificationData = eventData["notification"] ?? {};
            String title = notificationData["title"] ?? "New Notification";
            String message = notificationData["message"] ?? "You have a new notification.";
            showNotification(title, message);
          } catch (e) {
            print("Error parsing notification event: $e");
          }
        },
        onError: (message, code, e) {
          print("Pusher Error: $message ($code) - $e");
        },
      );
      await pusher.subscribe(channelName: "masjid-1-notifications-channel");
      await pusher.connect();
    } catch (e) {
      print("Pusher Exception: $e");
    }
  }

  Future<void> showNotification(String title, String body) async {
    var androidDetails =const AndroidNotificationDetails(
      'channelId',
      'Notifications',
      importance: Importance.high,
      priority: Priority.high,
      playSound: true,
    );
    var details = NotificationDetails(android: androidDetails);
    await localNotifications.show(0, title, body, details);
  }
}
