import 'package:arrowad_grade_eleven/src/app/core/custom_base_view_model.dart';
import 'package:arrowad_grade_eleven/src/app/locator/locator.dart';
import 'package:arrowad_grade_eleven/src/app/models/k_error.dart';
import 'package:arrowad_grade_eleven/src/app/router/router.dart';
import 'package:arrowad_grade_eleven/src/app/services/firestore_service.dart';
import 'package:arrowad_grade_eleven/src/app/services/router_service.dart';
import 'package:arrowad_grade_eleven/src/app/utils/flash_helper.dart';
import 'package:flutter/material.dart';

class AddHomeworkItemViewModel extends CustomBaseViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final RouterService _routerService = locator<RouterService>();

  final GlobalKey<FormState> addHomeworkFormKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  String _subjectDropdown;
  String get subjectDropdown => _subjectDropdown;
  void setSubjectDropdown(String newValue) {
    _subjectDropdown = newValue;
    notifyListeners();
  }

  bool _autoValidate = false;
  bool get autoValidate => _autoValidate;
  void setAutoValidate(bool newValue) {
    _autoValidate = newValue;
    notifyListeners();
  }

  BuildContext _context;
  BuildContext get context => _context;
  void setContext(BuildContext newValue) {
    _context = newValue;
    notifyListeners();
  }

  String _homeworkId;
  String get homeworkId => _homeworkId;
  void setHomeworkId(String newValue) {
    _homeworkId = newValue;
    notifyListeners();
  }

  Future<void> init({
    @required BuildContext context,
    @required String homeworkId,
  }) async {
    setContext(context);
    setHomeworkId(homeworkId);
    setSubjectDropdown(subjects[0]);
  }

  Future<void> addNewHomeworkItem() async {
    final String nameTrimmed = nameController.text.trim();
    final String descriptionTrimmed = descriptionController.text.trim();
    final String subjectTrimmed = _subjectDropdown.trim();

    if (addHomeworkFormKey.currentState.validate()) {
      setBusy(true);
      final dynamic response = await _firestoreService.addNewHomeworkItem(
        homeworkId: homeworkId,
        name: nameTrimmed,
        description: descriptionTrimmed,
        subject: subjectTrimmed,
        creatorId: currentFirebaseUser.uid,
      );

      if (response is KError) {
        FlashHelper.errorBar(
          context,
          message: response.userFriendlyMessage,
        );
        setBusy(false);
        return;
      }

      FlashHelper.successBar(
        context,
        message: "Homework item added successfully!",
      );

      // await navigateToHomeView();
      goBack();

      setBusy(false);
    } else {
      setAutoValidate(true);
      FlashHelper.errorBar(
        context,
        message: "Check the info you provided above!",
      );
    }
  }

  Future<void> navigateToHomeView() async {
    await _routerService.appRouter.pushAndRemoveUntil(
      HomeRoute(),
      predicate: (_) => false,
    );
  }
}
