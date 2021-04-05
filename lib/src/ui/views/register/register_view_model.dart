import 'package:flutter/material.dart';

import 'package:arrowad_grade_eleven/src/app/core/custom_base_view_model.dart';
import 'package:arrowad_grade_eleven/src/app/locator/locator.dart';
import 'package:arrowad_grade_eleven/src/app/models/k_error.dart';
import 'package:arrowad_grade_eleven/src/app/router/router.dart';
import 'package:arrowad_grade_eleven/src/app/services/auth_service.dart';
import 'package:arrowad_grade_eleven/src/app/services/router_service.dart';
import 'package:arrowad_grade_eleven/src/app/utils/flash_helper.dart';
import 'package:arrowad_grade_eleven/src/app/utils/utils.dart';
import 'package:arrowad_grade_eleven/src/ui/widgets/veritifcation_ui.dart';

class RegisterViewModel extends CustomBaseViewModel {
  final AuthService _authService = locator<AuthService>();

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  final RouterService _routerService = locator<RouterService>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController sNumberController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  final TextEditingController verificationCodeController =
      TextEditingController();

  bool _autoValidate = false;
  bool get autoValidate => _autoValidate;
  void setAutoValidate(bool newValue) {
    _autoValidate = newValue;
    notifyListeners();
  }

  String _verificationId;
  String get verificationId => _verificationId;
  void setVerificationId(String newValue) {
    _verificationId = newValue;
    notifyListeners();
  }

  int _resendToken;
  int get resendToken => _resendToken;
  void setResendToken(int newValue) {
    _resendToken = newValue;
    notifyListeners();
  }

  Future<void> registerUser({
    @required BuildContext context,
  }) async {
    if (registerFormKey.currentState.validate()) {
      setBusy(true);
      final String firstNameTrimmed = firstNameController.text.trim();
      final String lastNameTrimmed = lastNameController.text.trim();
      final String sNumberTrimmed = sNumberController.text.trim();
      final String phoneNumberTrimmed = Utils.formatPhoneNumber(
        phoneNumber: phoneNumberController.text.trim(),
      );

      print("Register new user in firebase");

      final dynamic response = await _getVerificationId(
        phoneNumber: phoneNumberTrimmed,
        firstName: firstNameTrimmed,
        lastName: lastNameTrimmed,
        sNumber: sNumberTrimmed,
      );

      /// if error then show error bar
      if (response is KError) {
        setBusy(false);
        return FlashHelper.errorBar(
          context,
          message: response.userFriendlyMessage,
        );
      }

      /// clear to make sure nothing remains in the controller
      verificationCodeController.clear();

      await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return VerificationUI(
            controller: verificationCodeController,
            onPressed: () async {
              await doVerification(
                context: context,
                phoneNumber: phoneNumberTrimmed,
                firstName: firstNameTrimmed,
                lastName: lastNameTrimmed,
                sNumber: sNumberTrimmed,
              );
            },
          );
        },
      );
      setBusy(false);
    } else {
      setAutoValidate(true);
      FlashHelper.errorBar(
        context,
        message: "Check the info you provided above!",
      );
    }
  }

  Future<dynamic> _getVerificationId({
    @required String phoneNumber,
    @required String firstName,
    @required String lastName,
    @required String sNumber,
  }) async {
    /// get verification id
    final dynamic response = await _authService.sendVerificationCode(
      phoneNumber: phoneNumber,
      firstName: firstName,
      lastName: lastName,
      sNumber: sNumber,
      codeSent: (String verificationId, int resendToken) {
        print(
          "(codeSent) Verification ID: $verificationId",
        );
        print(
          "(codeSent) Resend Token: $resendToken",
        );
        setVerificationId(verificationId);
        setResendToken(resendToken);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print(
          "(codeAutoRetrievalTimeout) Verification ID: $verificationId",
        );
        setVerificationId(verificationId);
      },
    );

    return response;
  }

  Future<void> doVerification({
    @required BuildContext context,
    @required String phoneNumber,
    @required String firstName,
    @required String lastName,
    @required String sNumber,
  }) async {
    removeFocus();
    final String verificationCodeString =
        verificationCodeController.text.trim();

    if (verificationCodeString.length == 6) {
      /// verify the phone number
      final dynamic response = await _authService.verifyPhoneNumber(
        verificationId: verificationId,
        verificationCode: verificationCodeString,
        phoneNumber: phoneNumber,
        firstName: firstName,
        lastName: lastName,
        sNumber: sNumber,
      );

      if (response is KError) {
        await FlashHelper.errorBar(
          context,
          message: response.userFriendlyMessage,
        );
        return;
      } else {
        /// go to home view
        await goBack();
        await _routerService.appRouter.pushAndRemoveUntil(
          HomeRoute(),
          predicate: (_) => false,
        );
      }
    }
  }
}
