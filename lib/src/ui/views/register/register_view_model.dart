import 'package:arrowad_grade_eleven/src/app/core/custom_base_view_model.dart';
import 'package:arrowad_grade_eleven/src/app/models/k_user.model.dart';
import 'package:flutter/cupertino.dart';

class RegisterViewModel extends CustomBaseViewModel {
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController sNumberController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  bool _autoValidate = false;
  bool get autoValidate => _autoValidate;
  void setAutoValidate(bool newValue) {
    _autoValidate = newValue;
    notifyListeners();
  }

  Future<void> registerUser() async {
    if (registerFormKey.currentState.validate()) {
      final String firstNameTrimmed = firstNameController.text.trim();
      final String lastNameTrimmed = lastNameController.text.trim();
      final String sNumberTrimmed = sNumberController.text.trim();
      final String phoneNumberTrimmed = phoneNumberController.text.trim();

      final KUser newUser = KUser(
        id: null,
        firstName: firstNameTrimmed,
        lastName: lastNameTrimmed,
        sNumber: sNumberTrimmed,
        phoneNumber: phoneNumberTrimmed,
      );

      // TODO: register user
      print("Register new user in firebase");
    } else {
      setAutoValidate(true);
    }
  }
}
