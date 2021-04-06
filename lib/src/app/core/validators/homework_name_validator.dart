String validateHomeworkName(String homeworkName) {
  final String homeworkNameTrimmed = homeworkName.trim();

  if (homeworkNameTrimmed.isEmpty) {
    return "Homework name can't by empty.";
  } else if (homeworkNameTrimmed.length < 5) {
    return "Homework name must be more than 5 characters.";
  } else if (homeworkNameTrimmed.length > 50) {
    return "Homework name must be less than 50 characters.";
  } else {
    return null;
  }
}
