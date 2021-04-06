import 'dart:convert';

import 'package:meta/meta.dart';

class KUser {
  final String id;
  final String firstName;
  final String lastName;
  final String sNumber;
  final String phoneNumber;
  final String photoUrl;

  /// boys or girls.
  final String section;

  /// a letter indicating the batch the student is in.
  final String batch;

  const KUser({
    @required this.id,
    @required this.firstName,
    @required this.lastName,
    @required this.sNumber,
    @required this.phoneNumber,
    @required this.photoUrl,
    @required this.section,
    @required this.batch,
  });

  KUser copyWith({
    String id,
    String firstName,
    String lastName,
    String sNumber,
    String phoneNumber,
    String photoUrl,
    String section,
    String batch,
  }) {
    return KUser(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      sNumber: sNumber ?? this.sNumber,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      photoUrl: photoUrl ?? this.photoUrl,
      section: section ?? this.section,
      batch: batch ?? this.batch,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'sNumber': sNumber,
      'phoneNumber': phoneNumber,
      'photoUrl': photoUrl,
      'section': section,
      'batch': batch,
    };
  }

  factory KUser.fromMap(Map<String, dynamic> map) {
    return KUser(
      id: map['id'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      sNumber: map['sNumber'],
      phoneNumber: map['phoneNumber'],
      photoUrl: map['photoUrl'],
      section: map['section'],
      batch: map['batch'],
    );
  }

  String toJson() => json.encode(toMap());

  factory KUser.fromJson(String source) => KUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'KUser(id: $id, firstName: $firstName, lastName: $lastName, sNumber: $sNumber, phoneNumber: $phoneNumber, photoUrl: $photoUrl, section: $section, batch: $batch)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is KUser &&
        other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.sNumber == sNumber &&
        other.phoneNumber == phoneNumber &&
        other.photoUrl == photoUrl &&
        other.section == section &&
        other.batch == batch;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        sNumber.hashCode ^
        phoneNumber.hashCode ^
        photoUrl.hashCode ^
        section.hashCode ^
        batch.hashCode;
  }
}
