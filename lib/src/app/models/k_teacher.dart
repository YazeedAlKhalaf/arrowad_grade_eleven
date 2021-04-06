import 'dart:convert';
import 'package:meta/meta.dart';

class KTeacher {
  final String id;
  final String firstName;
  final String lastName;
  final String photoUrl;

  const KTeacher({
    @required this.id,
    @required this.firstName,
    @required this.lastName,
    @required this.photoUrl,
  });

  KTeacher copyWith({
    String id,
    String firstName,
    String lastName,
    String photoUrl,
  }) {
    return KTeacher(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'photoUrl': photoUrl,
    };
  }

  factory KTeacher.fromMap(Map<String, dynamic> map) {
    return KTeacher(
      id: map['id'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      photoUrl: map['photoUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory KTeacher.fromJson(String source) =>
      KTeacher.fromMap(json.decode(source));

  @override
  String toString() {
    return 'KTeacher(id: $id, firstName: $firstName, lastName: $lastName, photoUrl: $photoUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is KTeacher &&
        other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.photoUrl == photoUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        photoUrl.hashCode;
  }
}
