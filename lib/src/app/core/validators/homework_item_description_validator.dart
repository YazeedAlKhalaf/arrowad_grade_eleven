String? validateHomeworkItemDescription(String description) {
  final String descriptionTrimmed = description.trim();

  if (descriptionTrimmed.isEmpty) {
    return "Description can't be empty.";
  } else if (descriptionTrimmed.length > 150) {
    return "Description can't be more than 15 characters.";
  } else {
    return null;
  }
}
