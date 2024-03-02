import 'dart:io';

import 'package:arrowad_grade_eleven/src/app/core/custom_base_view_model.dart';
import 'package:arrowad_grade_eleven/src/app/locator/locator.dart';
import 'package:arrowad_grade_eleven/src/app/models/k_error.dart';
import 'package:arrowad_grade_eleven/src/app/services/auth_service.dart';
import 'package:arrowad_grade_eleven/src/app/services/firestorage_service.dart';
import 'package:arrowad_grade_eleven/src/app/services/firestore_service.dart';
import 'package:arrowad_grade_eleven/src/app/utils/flash_helper.dart';
import 'package:flutter/material.dart';

class EditProfileViewModel extends CustomBaseViewModel {
  final AuthService _authService = locator<AuthService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final FirestorageService _firestorageService = locator<FirestorageService>();

  final GlobalKey<FormState> editProfileFormKey = GlobalKey<FormState>();

  bool _autoValidate = false;
  bool get autoValidate => _autoValidate;
  void setAutoValidate(bool newValue) {
    _autoValidate = newValue;
    notifyListeners();
  }

  BuildContext? _context;
  BuildContext? get context => _context;
  void setContext(BuildContext newValue) {
    _context = newValue;
    notifyListeners();
  }

  File? _pickedImage;
  File? get pickedImage => _pickedImage;
  void setPickedImage(File newValue) {
    _pickedImage = newValue;
    notifyListeners();
  }

  Future<void> init({
    required BuildContext context,
  }) async {
    setContext(context);
  }

  Future<void> updateUser() async {
    if (editProfileFormKey.currentState?.validate() == true) {
      setBusy(true);
      final dynamic uploadProfileImageResponse =
          await _firestorageService.uploadProfileImage(
        pickedImage!,
      );

      if (uploadProfileImageResponse is KError) {
        setBusy(false);
        FlashHelper.errorBar(
          context!,
          message: uploadProfileImageResponse.userFriendlyMessage,
        );

        return;
      }

      final String profileImageUrl = uploadProfileImageResponse;

      final dynamic updateUserResponse = await _firestoreService.updateUser(
        userId: currentFirebaseUser!.uid,
        firstName: currentUser!.firstName,
        lastName: currentUser!.lastName,
        photoUrl: profileImageUrl,
      );

      if (updateUserResponse is KError) {
        setBusy(false);
        FlashHelper.errorBar(
          context!,
          message: updateUserResponse.userFriendlyMessage,
        );

        return;
      }
      setBusy(false);
      await _authService.populateCurrentUser();
      goBack();
    } else {
      setAutoValidate(true);
    }
  }
}
