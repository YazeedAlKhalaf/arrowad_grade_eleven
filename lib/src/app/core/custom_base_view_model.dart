import 'package:arrowad_grade_eleven/src/app/locator/locator.dart';
import 'package:arrowad_grade_eleven/src/app/models/k_user.model.dart';
import 'package:arrowad_grade_eleven/src/app/services/auth_service.dart';
import 'package:arrowad_grade_eleven/src/app/services/router_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

abstract class CustomBaseViewModel extends BaseViewModel {
  final AuthService _authService = locator<AuthService>();
  final RouterService _routerService = locator<RouterService>();

  KUser get currentUser => _authService.currentUser;
  User get currentFirebaseUser => _authService.currentFirebaseUser;

  Future<void> goBack() async {
    await _routerService.appRouter.pop();
  }

  void removeFocus() {
    FocusManager.instance.primaryFocus.unfocus();
  }
}
