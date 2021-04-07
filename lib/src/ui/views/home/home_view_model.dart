import 'package:flutter/material.dart';

import 'package:arrowad_grade_eleven/src/app/core/custom_base_view_model.dart';
import 'package:arrowad_grade_eleven/src/app/locator/locator.dart';
import 'package:arrowad_grade_eleven/src/app/models/k_error.dart';
import 'package:arrowad_grade_eleven/src/app/models/k_teacher.dart';
import 'package:arrowad_grade_eleven/src/app/router/router.gr.dart';
import 'package:arrowad_grade_eleven/src/app/services/auth_service.dart';
import 'package:arrowad_grade_eleven/src/app/services/firebase_messaging_service.dart';
import 'package:arrowad_grade_eleven/src/app/services/firestore_service.dart';
import 'package:arrowad_grade_eleven/src/app/services/router_service.dart';
import 'package:arrowad_grade_eleven/src/app/utils/flash_helper.dart';

class HomeViewModel extends CustomBaseViewModel {
  final AuthService _authService = locator<AuthService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final RouterService _routerService = locator<RouterService>();
  final FirebaseMessagingService _firebaseMessagingService =
      locator<FirebaseMessagingService>();

  BuildContext _context;
  BuildContext get context => _context;
  void setContext(BuildContext newValue) {
    _context = newValue;
    notifyListeners();
  }

  List<KTeacher> _teachersList = <KTeacher>[];
  List<KTeacher> get teachersList => _teachersList;
  void setTeachersList(List<KTeacher> newValue) {
    _teachersList = newValue;
    notifyListeners();
  }

  Future<void> init({
    @required BuildContext context,
  }) async {
    setContext(context);

    await getTeachers();
  }

  Future<void> getTeachers() async {
    final dynamic response = await _firestoreService.getTeachers();

    if (response is KError) {
      FlashHelper.errorBar(
        context,
        message: response.userFriendlyMessage,
      );
      return;
    }

    setTeachersList(response);
  }

  Future<void> navigateToMaterialCoveredView() async {
    await _routerService.appRouter.push(
      MaterialCoveredRoute(),
    );
  }

  Future<void> navigateToTeacherView({
    @required String teacherId,
  }) async {
    await _routerService.appRouter.push(
      TeacherInfoRoute(
        id: teacherId,
      ),
    );
  }

  Future<void> navigateToScheduleView() async {
    await _routerService.appRouter.push(
      ScheduleRoute(),
    );
  }

  Future<void> navigateToTeacherListView() async {
    await _routerService.appRouter.push(
      TeacherListRoute(),
    );
  }

  Future<void> signOut() async {
    final String deviceId = await _firebaseMessagingService.getDeviceToken();
    await _firestoreService.deleteDeviceId(
      deviceId: deviceId,
    );
    await _authService.signOut();

    await _routerService.appRouter.pushAndRemoveUntil(
      RegisterRoute(),
      predicate: (_) => false,
    );
  }

  Future<void> navigateToHomeworkView() async {
    await _routerService.appRouter.push(
      HomeworkRoute(),
    );
  }

  Future<void> navigateToEditProfileView() async {
    await goBack();
    await _routerService.appRouter.push(
      EditProfileRoute(),
    );
  }
}
