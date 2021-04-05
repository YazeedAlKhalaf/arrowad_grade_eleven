String validateSNumber(String sNumber) {
  final String trimmedSNumber = sNumber.trim();

  if (trimmedSNumber.isEmpty) {
    return "S-Number can't empty.";
  } else if (trimmedSNumber.length != 6) {
    return "S-Number must be 6 charcters.";
  } else {
    return null;
  }
}
