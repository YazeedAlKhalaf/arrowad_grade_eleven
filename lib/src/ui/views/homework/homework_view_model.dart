import 'package:flutter/cupertino.dart';

import 'package:arrowad_grade_eleven/src/app/core/custom_base_view_model.dart';
import 'package:arrowad_grade_eleven/src/app/locator/locator.dart';
import 'package:arrowad_grade_eleven/src/app/models/k_error.dart';
import 'package:arrowad_grade_eleven/src/app/models/k_homework.dart';
import 'package:arrowad_grade_eleven/src/app/services/firestore_service.dart';
import 'package:arrowad_grade_eleven/src/app/utils/flash_helper.dart';

class HomeworkViewModel extends CustomBaseViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();

  BuildContext _context;
  BuildContext get context => _context;
  void setContext(BuildContext newValue) {
    _context = newValue;
    notifyListeners();
  }

  List<KHomework> _homeworkList = <KHomework>[];
  List<KHomework> get homeworkLit => _homeworkList;
  void setHomeworkList(List<KHomework> newValue) {
    _homeworkList = newValue;
    notifyListeners();
  }

  Future<void> init({
    @required BuildContext context,
  }) async {
    setContext(context);

    await getAllHomework();
  }

  Future<void> getAllHomework() async {
    final dynamic response = await _firestoreService.getAllHomework();

    if (response is KError) {
      FlashHelper.errorBar(
        context,
        message: response.userFriendlyMessage,
      );
    }

    setHomeworkList(response);
  }
}
