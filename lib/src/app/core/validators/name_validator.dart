String validateName(String name, bool first) {
  final String trimmedName = name.trim();
  final String firstOrLast = first ? "First" : "Last";

  if (trimmedName.isEmpty) {
    return "$firstOrLast name can't be empty.";
  } else if (trimmedName.length < 3) {
    return "$firstOrLast name must be more than 3 characters.";
  } else if (trimmedName.length > 15) {
    return "$firstOrLast name must be less than 15 characters.";
  } else {
    return null;
  }
}
