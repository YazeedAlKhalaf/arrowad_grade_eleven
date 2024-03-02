import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class KHomeworkItem {
  final String id;
  final String creatorId;
  final String subject;
  final String name;
  final String description;
  final DateTime dueDate;
  final Timestamp createdAt;

  KHomeworkItem({
    required this.id,
    required this.creatorId,
    required this.subject,
    required this.name,
    required this.description,
    required this.dueDate,
    required this.createdAt,
  });

  KHomeworkItem copyWith({
    String? id,
    String? creatorId,
    String? subject,
    String? name,
    String? description,
    DateTime? dueDate,
    Timestamp? createdAt,
  }) {
    return KHomeworkItem(
      id: id ?? this.id,
      creatorId: creatorId ?? this.creatorId,
      subject: subject ?? this.subject,
      name: name ?? this.name,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'creatorId': creatorId,
      'subject': subject,
      'name': name,
      'description': description,
      'dueDate': dueDate.millisecondsSinceEpoch,
      'createdAt': createdAt,
    };
  }

  factory KHomeworkItem.fromMap(Map<String, dynamic> map) {
    return KHomeworkItem(
      id: map['id'],
      creatorId: map['creatorId'],
      subject: map['subject'],
      name: map['name'],
      description: map['description'],
      dueDate: DateTime.fromMillisecondsSinceEpoch(map['dueDate'] * 1000),
      createdAt: map['createdAt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory KHomeworkItem.fromJson(String source) =>
      KHomeworkItem.fromMap(json.decode(source));

  @override
  String toString() {
    return 'KHomeworkItem(id: $id, creatorId: $creatorId, subject: $subject, name: $name, description: $description, dueDate: $dueDate, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is KHomeworkItem &&
        other.id == id &&
        other.creatorId == creatorId &&
        other.subject == subject &&
        other.name == name &&
        other.description == description &&
        other.dueDate == dueDate &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        creatorId.hashCode ^
        subject.hashCode ^
        name.hashCode ^
        description.hashCode ^
        dueDate.hashCode ^
        createdAt.hashCode;
  }
}
