import 'package:arrowad_grade_eleven/src/app/core/custom_base_view_model.dart';
import 'package:arrowad_grade_eleven/src/app/locator/locator.dart';
import 'package:arrowad_grade_eleven/src/app/models/k_error.dart';
import 'package:arrowad_grade_eleven/src/app/models/k_teacher.dart';
import 'package:arrowad_grade_eleven/src/app/services/firestore_service.dart';
import 'package:arrowad_grade_eleven/src/app/utils/flash_helper.dart';
import 'package:flutter/material.dart';

class TeacherInfoViewModel extends CustomBaseViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();

  BuildContext _context;
  BuildContext get context => _context;
  void setContext(BuildContext newValue) {
    _context = newValue;
    notifyListeners();
  }

  KTeacher _teacher;
  KTeacher get teacher => _teacher;
  void setTeacher(KTeacher newValue) {
    _teacher = newValue;
    notifyListeners();
  }

  Future<void> init({
    @required BuildContext context,
    @required String teacherId,
  }) async {
    setContext(context);

    await getTeacher(teacherId);
  }

  Future<void> getTeacher(String teacherId) async {
    final dynamic response = await _firestoreService.getTeacherById(
      id: teacherId,
    );

    if (response is KError) {
      FlashHelper.errorBar(
        context,
        message: response.userFriendlyMessage,
      );
      return;
    }

    setTeacher(response);
  }
}
