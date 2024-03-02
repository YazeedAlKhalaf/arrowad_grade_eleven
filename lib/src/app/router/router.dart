import 'package:arrowad_grade_eleven/src/app/models/k_homework.dart';
import 'package:arrowad_grade_eleven/src/app/models/k_homework_item.dart';
import 'package:arrowad_grade_eleven/src/ui/views/add_homework/add_homework_view.dart';
import 'package:arrowad_grade_eleven/src/ui/views/add_homework_item/add_homework_item_view.dart';
import 'package:arrowad_grade_eleven/src/ui/views/edit_profile/edit_profile_view.dart';
import 'package:arrowad_grade_eleven/src/ui/views/home/home_view.dart';
import 'package:arrowad_grade_eleven/src/ui/views/homework/homework_view.dart';
import 'package:arrowad_grade_eleven/src/ui/views/homework_item_info/homework_item_info_view.dart';
import 'package:arrowad_grade_eleven/src/ui/views/homework_items/homework_items_view.dart';
import 'package:arrowad_grade_eleven/src/ui/views/login/login_view.dart';
import 'package:arrowad_grade_eleven/src/ui/views/material_covered/material_covered_view.dart';
import 'package:arrowad_grade_eleven/src/ui/views/register/register_view.dart';
import 'package:arrowad_grade_eleven/src/ui/views/schedule/schedule_view.dart';
import 'package:arrowad_grade_eleven/src/ui/views/startup/startup_view.dart';
import 'package:arrowad_grade_eleven/src/ui/views/teacher_info/teacher_info_view.dart';
import 'package:arrowad_grade_eleven/src/ui/views/teacher_list/teacher_list_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part './router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: "View,Route",
)
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: StartupRoute.page, path: "/", initial: true),
    AutoRoute(page: RegisterRoute.page, path: "/register"),
    AutoRoute(page: HomeRoute.page, path: "/home"),
    AutoRoute(page: MaterialCoveredRoute.page, path: "/material-covered"),
    AutoRoute(page: TeacherInfoRoute.page, path: "/teacher/:id"),
    AutoRoute(page: ScheduleRoute.page, path: "/schedule"),
    AutoRoute(page: TeacherListRoute.page, path: "/teacher-list"),
    AutoRoute(page: LoginRoute.page, path: "/login"),
    AutoRoute(page: HomeworkRoute.page, path: "/homework"),
    AutoRoute(page: AddHomeworkRoute.page, path: "/add-homework"),
    AutoRoute(page: HomeworkItemsRoute.page, path: "/homework-items"),
    AutoRoute(page: HomeworkItemInfoRoute.page, path: "/homework-item-info"),
    AutoRoute(page: AddHomeworkItemRoute.page, path: "/add-homework-item"),
    AutoRoute(page: EditProfileRoute.page, path: "/edit-profile"),
  ];
}
