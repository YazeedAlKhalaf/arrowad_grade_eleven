import 'package:arrowad_grade_eleven/src/app/models/k_error.dart';
import 'package:arrowad_grade_eleven/src/app/models/k_homework.dart';
import 'package:arrowad_grade_eleven/src/app/services/firestore_service.dart';
import 'package:arrowad_grade_eleven/src/app/utils/flash_helper.dart';
import 'package:flutter/material.dart';

import 'package:arrowad_grade_eleven/src/app/core/custom_base_view_model.dart';
import 'package:arrowad_grade_eleven/src/app/locator/locator.dart';
import 'package:arrowad_grade_eleven/src/app/models/k_homework_item.dart';
import 'package:arrowad_grade_eleven/src/app/router/router.dart';
import 'package:arrowad_grade_eleven/src/app/services/router_service.dart';

class HomeworkItemsViewModel extends CustomBaseViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final RouterService _routerService = locator<RouterService>();

  BuildContext _context;
  BuildContext get context => _context;
  void setContext(BuildContext newValue) {
    _context = newValue;
    notifyListeners();
  }

  KHomework _homework;
  KHomework get homework => _homework;
  void setHomework(KHomework newValue) {
    _homework = newValue;
    notifyListeners();
  }

  List<KHomeworkItem> _homeworkItemList = <KHomeworkItem>[];
  List<KHomeworkItem> get homeworkItemList => _homeworkItemList;
  void setHomeworkList(List<KHomeworkItem> newValue) {
    _homeworkItemList = newValue;
    notifyListeners();
  }

  Future<void> init({
    @required BuildContext context,
    @required KHomework homework,
  }) async {
    setContext(context);
    setHomework(homework);

    await getHomeworkItems();
  }

  Future<void> getHomeworkItems() async {
    final dynamic response = await _firestoreService.getAllHomeworkItems(
      homeworkId: homework.id,
    );

    if (response is KError) {
      FlashHelper.errorBar(
        context,
        message: response.userFriendlyMessage,
      );
      return;
    }

    setHomeworkList(response);
  }

  Future<void> navigateToHomeworkItemInfoView({
    @required KHomeworkItem homeworkItem,
  }) async {
    await _routerService.appRouter.push(
      HomeworkItemInfoRoute(
        homeworkItem: homeworkItem,
      ),
    );
  }
}
