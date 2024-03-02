String? validateHomeworkItemName(String name) {
  final String nameTrimmed = name.trim();

  if (nameTrimmed.isEmpty) {
    return "Name can't be empty.";
  } else if (nameTrimmed.length < 5) {
    return "Homework name must be more than 5 characters.";
  } else if (nameTrimmed.length > 50) {
    return "Homework name must be less than 50 characters.";
  } else {
    return null;
  }
}
