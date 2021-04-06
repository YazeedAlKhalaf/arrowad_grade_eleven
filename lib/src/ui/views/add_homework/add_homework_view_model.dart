import 'package:arrowad_grade_eleven/src/app/core/custom_base_view_model.dart';
import 'package:arrowad_grade_eleven/src/app/locator/locator.dart';
import 'package:arrowad_grade_eleven/src/app/models/k_error.dart';
import 'package:arrowad_grade_eleven/src/app/router/router.dart';
import 'package:arrowad_grade_eleven/src/app/services/firestore_service.dart';
import 'package:arrowad_grade_eleven/src/app/services/router_service.dart';
import 'package:arrowad_grade_eleven/src/app/utils/flash_helper.dart';
import 'package:flutter/cupertino.dart';

class AddHomeworkViewModel extends CustomBaseViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final RouterService _routerService = locator<RouterService>();

  final GlobalKey<FormState> addHomeworkFormKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

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

  Future<void> init({
    @required BuildContext context,
  }) async {
    setContext(context);
  }

  Future<void> addNewHomework() async {
    final String nameTrimmed = nameController.text.trim();

    if (addHomeworkFormKey.currentState.validate()) {
      setBusy(true);
      final dynamic response = await _firestoreService.addNewHomework(
        name: nameTrimmed,
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
        message: "Home added successfully!",
      );

      await navigateToHomeView();

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
