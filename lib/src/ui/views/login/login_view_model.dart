import 'package:arrowad_grade_eleven/src/app/models/k_error.dart';
import 'package:arrowad_grade_eleven/src/app/router/router.dart';
import 'package:arrowad_grade_eleven/src/app/services/firebase_messaging_service.dart';
import 'package:arrowad_grade_eleven/src/app/utils/flash_helper.dart';
import 'package:arrowad_grade_eleven/src/app/utils/utils.dart';
import 'package:arrowad_grade_eleven/src/ui/widgets/veritifcation_ui.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:arrowad_grade_eleven/src/app/core/custom_base_view_model.dart';
import 'package:arrowad_grade_eleven/src/app/locator/locator.dart';
import 'package:arrowad_grade_eleven/src/app/services/auth_service.dart';
import 'package:arrowad_grade_eleven/src/app/services/router_service.dart';

class LoginViewModel extends CustomBaseViewModel {
  final AuthService _authService = locator<AuthService>();
  final RouterService _routerService = locator<RouterService>();
  final FirebaseMessagingService _firebaseMessagingService =
      locator<FirebaseMessagingService>();

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

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

  ConfirmationResult _confirmationResult;
  ConfirmationResult get confirmationResult => _confirmationResult;
  void setConfirmationResult(ConfirmationResult newValue) {
    _confirmationResult = newValue;
    notifyListeners();
  }

  Future<void> loginUser({
    required BuildContext context,
  }) async {
    // TODO: make web work
    if (loginFormKey.currentState.validate()) {
      setBusy(true);
      final String phoneNumberTrimmed = Utils.formatPhoneNumber(
        phoneNumber: phoneNumberController.text.trim(),
      );

      print("Login existing user");

      if (!kIsWeb) {
        final dynamic response = await _getVerificationId(
          phoneNumber: phoneNumberTrimmed,
        );

        /// if error then show error bar
        if (response is KError) {
          setBusy(false);
          return FlashHelper.errorBar(
            context,
            message: response.userFriendlyMessage,
          );
        }
      } else {
        final ConfirmationResult confirmationResult =
            await _authService.sendVerificationCodeWeb(
          phoneNumber: phoneNumberTrimmed,
        );

        setConfirmationResult(confirmationResult);
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
              if (!kIsWeb) {
                await doVerification(
                  context: context,
                  phoneNumber: phoneNumberTrimmed,
                );
              } else {
                await _authService.verifyPhoneNumberWeb(
                  phoneNumber: phoneNumberTrimmed,
                  confirmationResult: confirmationResult,
                  verificationCode: verificationCodeController.text,
                );
              }
            },
          );
        },
      );
      await _firebaseMessagingService.initialize();
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
    required String phoneNumber,
  }) async {
    /// get verification id
    final dynamic response = await _authService.sendVerificationCode(
      phoneNumber: phoneNumber,
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
    required BuildContext context,
    required String phoneNumber,
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

  Future<void> navigateToRegisterView() async {
    await _routerService.appRouter.pushAndRemoveUntil(
      RegisterRoute(),
      predicate: (_) => false,
    );
  }
}
