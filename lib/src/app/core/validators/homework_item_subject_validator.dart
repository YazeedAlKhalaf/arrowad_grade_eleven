String? validateHomeworkItemSubject(String? subject) {
  final String? subjectTrimmed = subject?.trim();

  if (subjectTrimmed?.isEmpty == true) {
    return "Subject can't be empty.";
  } else if (subjectTrimmed == null) {
    return "Choose a subject.";
  } else {
    return null;
  }
}
