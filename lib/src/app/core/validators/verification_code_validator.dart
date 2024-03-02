String? validateVerificationCode(String verificationCode) {
  final String trimmedVerificationCode = verificationCode.trim();

  if (trimmedVerificationCode.isEmpty) {
    return "Verification Code can't be empty.";
  } else if (trimmedVerificationCode.length != 6) {
    return "Verification Code must be 6 characters.";
  } else {
    return null;
  }
}
