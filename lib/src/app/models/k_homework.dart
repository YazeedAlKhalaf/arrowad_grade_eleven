import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'package:arrowad_grade_eleven/src/app/models/k_homework_item.dart';

class KHomework {
  final String id;
  final String name;
  final List<KHomeworkItem> homeworkItems;
  final Timestamp createdAt;

  const KHomework({
    @required this.id,
    @required this.name,
    @required this.homeworkItems,
    @required this.createdAt,
  });

  KHomework copyWith({
    String id,
    String name,
    List<KHomeworkItem> homeworkItems,
    Timestamp createdAt,
  }) {
    return KHomework(
      id: id ?? this.id,
      name: name ?? this.name,
      homeworkItems: homeworkItems ?? this.homeworkItems,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'homeworkItems': homeworkItems?.map((x) => x.toMap())?.toList(),
      'createdAt': createdAt,
    };
  }

  factory KHomework.fromMap(Map<String, dynamic> map) {
    return KHomework(
      id: map['id'],
      name: map['name'],
      homeworkItems: List<KHomeworkItem>.from(
          map['homeworkItems']?.map((x) => KHomeworkItem.fromMap(x))),
      createdAt: map['createdAt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory KHomework.fromJson(String source) =>
      KHomework.fromMap(json.decode(source));

  @override
  String toString() {
    return 'KHomework(id: $id, name: $name, homeworkItems: $homeworkItems, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is KHomework &&
        other.id == id &&
        other.name == name &&
        listEquals(other.homeworkItems, homeworkItems) &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        homeworkItems.hashCode ^
        createdAt.hashCode;
  }
}
