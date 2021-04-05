import 'package:arrowad_grade_eleven/src/app/core/custom_base_view_model.dart';
import 'package:arrowad_grade_eleven/src/app/locator/locator.dart';
import 'package:arrowad_grade_eleven/src/app/router/router.dart';
import 'package:arrowad_grade_eleven/src/app/services/router_service.dart';

class StartupViewModel extends CustomBaseViewModel {
  final RouterService _routerService = locator<RouterService>();

  Future<void> init() async {
    await Future.delayed(
      Duration(milliseconds: 500),
      () async {
        await _routerService.appRouter.pushAndRemoveUntil(
          RegisterRoute(),
          predicate: (_) => false,
        );
      },
    );
  }
}
