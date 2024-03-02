import 'dart:convert';

class KTeacher {
  final String id;
  final String firstName;
  final String lastName;
  final String photoUrl;
  final String phoneNumber;
  final String subject;

  const KTeacher({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.photoUrl,
    required this.phoneNumber,
    required this.subject,
  });

  KTeacher copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? photoUrl,
    String? phoneNumber,
    String? subject,
  }) {
    return KTeacher(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      photoUrl: photoUrl ?? this.photoUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      subject: subject ?? this.subject,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'photoUrl': photoUrl,
      'phoneNumber': phoneNumber,
      'subject': subject,
    };
  }

  factory KTeacher.fromMap(Map<String, dynamic> map) {
    return KTeacher(
      id: map['id'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      photoUrl: map['photoUrl'],
      phoneNumber: map['phoneNumber'],
      subject: map['subject'],
    );
  }

  String toJson() => json.encode(toMap());

  factory KTeacher.fromJson(String source) =>
      KTeacher.fromMap(json.decode(source));

  @override
  String toString() {
    return 'KTeacher(id: $id, firstName: $firstName, lastName: $lastName, photoUrl: $photoUrl, phoneNumber: $phoneNumber, subject: $subject)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is KTeacher &&
        other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.photoUrl == photoUrl &&
        other.phoneNumber == phoneNumber &&
        other.subject == subject;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        photoUrl.hashCode ^
        phoneNumber.hashCode ^
        subject.hashCode;
  }
}
