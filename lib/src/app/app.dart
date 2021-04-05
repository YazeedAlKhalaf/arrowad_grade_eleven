import 'package:arrowad_grade_eleven/src/app/locator/locator.dart';
import 'package:arrowad_grade_eleven/src/app/services/router_service.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RouterService _routerService = locator<RouterService>();

    return MaterialApp.router(
      routerDelegate: _routerService.appRouter.delegate(),
      routeInformationParser: _routerService.appRouter.defaultRouteParser(),
    );
  }
}
