import 'package:arrowad_grade_eleven/src/ui/views/home/home_view.dart';
import 'package:arrowad_grade_eleven/src/ui/views/material_covered/material_covered_view.dart';
import 'package:arrowad_grade_eleven/src/ui/views/register/register_view.dart';
import 'package:arrowad_grade_eleven/src/ui/views/startup/startup_view.dart';
import 'package:auto_route/auto_route.dart';

export './router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: "View,Route",
  routes: <AutoRoute<dynamic>>[
    AutoRoute(page: StartupView, path: "/", initial: true),
    AutoRoute(page: RegisterView, path: "/register"),
    AutoRoute(page: HomeView, path: "/home"),
    AutoRoute(page: MaterialCoveredView, path: "/material-covered"),
  ],
)
class $AppRouter {}
