import 'dart:io';

import 'package:arrowad_grade_eleven/src/app/locator/locator.dart';
import 'package:arrowad_grade_eleven/src/app/models/k_push_notification_token.dart';
import 'package:arrowad_grade_eleven/src/app/services/auth_service.dart';
import 'package:arrowad_grade_eleven/src/app/services/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FirebaseMessagingService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  final AuthService _authService = locator<AuthService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();

  Future<void> initialize() async {
    if (Platform.isIOS) {
      final NotificationSettings notificationSettings =
          await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      if (notificationSettings.authorizationStatus ==
              AuthorizationStatus.authorized ||
          notificationSettings.authorizationStatus ==
              AuthorizationStatus.provisional) {
        await _firestoreService.savePushNotificationToken(
          pushNotificationToken: KPushNotificationToken(
            token: await getDeviceToken(),
            ownerId: _authService.currentFirebaseUser.uid,
            platform: Platform.operatingSystem,
            createdAt: Timestamp.now(),
          ),
          currentUser: _authService.currentUser,
        );
      }
    } else {
      await _firestoreService.savePushNotificationToken(
        pushNotificationToken: KPushNotificationToken(
          token: await getDeviceToken(),
          ownerId: _authService.currentFirebaseUser.uid,
          platform: Platform.operatingSystem,
          createdAt: Timestamp.now(),
        ),
        currentUser: _authService.currentUser,
      );
    }

    _firebaseMessaging.onTokenRefresh.listen((String token) async {
      await _firestoreService.savePushNotificationToken(
        pushNotificationToken: KPushNotificationToken(
          token: token,
          ownerId: _authService.currentFirebaseUser.uid,
          platform: Platform.operatingSystem,
          createdAt: Timestamp.now(),
        ),
        currentUser: _authService.currentUser,
      );
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage) {
      print("Got a message whilst in the foreground!");
      print("Message data: ${remoteMessage.data}");

      if (remoteMessage.notification != null) {
        print(
          "Message also contained a notification: ${remoteMessage.notification}",
        );
      }
    });

    FirebaseMessaging.onBackgroundMessage((RemoteMessage remoteMessage) async {
      print("Handling a background message: ${remoteMessage.messageId}");
    });
  }

  Future<String> getDeviceToken() async {
    final String deviceToken = await _firebaseMessaging.getToken();
    return deviceToken;
  }
}
