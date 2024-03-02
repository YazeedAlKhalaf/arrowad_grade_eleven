import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class KPushNotificationToken {
  final String token;
  final String ownerId;
  final String platform;
  final Timestamp createdAt;

  const KPushNotificationToken({
    required this.token,
    required this.ownerId,
    required this.platform,
    required this.createdAt,
  });

  KPushNotificationToken copyWith({
    String? token,
    String? ownerId,
    String? platform,
    Timestamp? createdAt,
  }) {
    return KPushNotificationToken(
      token: token ?? this.token,
      ownerId: ownerId ?? this.ownerId,
      platform: platform ?? this.platform,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'ownerId': ownerId,
      'platform': platform,
      'createdAt': createdAt,
    };
  }

  factory KPushNotificationToken.fromMap(Map<String, dynamic> map) {
    return KPushNotificationToken(
      token: map['token'],
      ownerId: map['ownerId'],
      platform: map['platform'],
      createdAt: map['createdAt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory KPushNotificationToken.fromJson(String source) =>
      KPushNotificationToken.fromMap(json.decode(source));

  @override
  String toString() {
    return 'KPushNotificationToken(token: $token, ownerId: $ownerId, platform: $platform, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is KPushNotificationToken &&
        o.token == token &&
        o.ownerId == ownerId &&
        o.platform == platform &&
        o.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return token.hashCode ^
        ownerId.hashCode ^
        platform.hashCode ^
        createdAt.hashCode;
  }
}
