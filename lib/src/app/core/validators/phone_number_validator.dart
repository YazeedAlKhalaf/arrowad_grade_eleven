String validatePhoneNumber(String phoneNumber) {
  final String trimmedPhoneNumber = phoneNumber.trim();

  /// Regular expression match for Saudi phone number
  final RegExpMatch phoneNumberMatch =
      RegExp(r"^(009665|9665|\+9665|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{7})$")
          .firstMatch(trimmedPhoneNumber);

  if (trimmedPhoneNumber.isEmpty) {
    return "Phone Number can't be empty.";
  } else if (phoneNumber.length > 14) {
    return "Phone Number can't be more than 14 characters.";
  } else if (phoneNumberMatch == null) {
    return "Phone Number is not correct.";
  } else {
    return null;
  }
}
