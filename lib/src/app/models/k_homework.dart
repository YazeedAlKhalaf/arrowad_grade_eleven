import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class KHomework {
  final String id;
  final String name;
  final Timestamp createdAt;

  const KHomework({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  KHomework copyWith({
    String? id,
    String? name,
    Timestamp? createdAt,
  }) {
    return KHomework(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'createdAt': createdAt,
    };
  }

  factory KHomework.fromMap(Map<String, dynamic> map) {
    return KHomework(
      id: map['id'],
      name: map['name'],
      createdAt: map['createdAt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory KHomework.fromJson(String source) =>
      KHomework.fromMap(json.decode(source));

  @override
  String toString() => 'KHomework(id: $id, name: $name, createdAt: $createdAt)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is KHomework &&
        other.id == id &&
        other.name == name &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ createdAt.hashCode;
}
