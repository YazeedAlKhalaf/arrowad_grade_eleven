import 'package:flutter/material.dart';

import 'package:arrowad_grade_eleven/src/app/core/custom_base_view_model.dart';
import 'package:arrowad_grade_eleven/src/app/locator/locator.dart';
import 'package:arrowad_grade_eleven/src/app/models/k_homework_item.dart';
import 'package:arrowad_grade_eleven/src/app/router/router.dart';
import 'package:arrowad_grade_eleven/src/app/services/router_service.dart';

class HomeworkItemsViewModel extends CustomBaseViewModel {
  final RouterService _routerService = locator<RouterService>();

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
