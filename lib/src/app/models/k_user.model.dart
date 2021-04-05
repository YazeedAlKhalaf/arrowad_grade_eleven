import 'dart:convert';
import 'package:meta/meta.dart';

class KUser {
  final String id;
  final String firstName;
  final String lastName;
  final String sNumber;
  final String phoneNumber;

  const KUser({
    @required this.id,
    @required this.firstName,
    @required this.lastName,
    @required this.sNumber,
    @required this.phoneNumber,
  });

  KUser copyWith({
    String id,
    String firstName,
    String lastName,
    String sNumber,
    String phoneNumber,
  }) {
    return KUser(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      sNumber: sNumber ?? this.sNumber,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'sNumber': sNumber,
      'phoneNumber': phoneNumber,
    };
  }

  factory KUser.fromMap(Map<String, dynamic> map) {
    return KUser(
      id: map['id'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      sNumber: map['sNumber'],
      phoneNumber: map['phoneNumber'],
    );
  }

  String toJson() => json.encode(toMap());

  factory KUser.fromJson(String source) => KUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'KUser(id: $id, firstName: $firstName, lastName: $lastName, sNumber: $sNumber, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is KUser &&
        other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.sNumber == sNumber &&
        other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        sNumber.hashCode ^
        phoneNumber.hashCode;
  }
}
