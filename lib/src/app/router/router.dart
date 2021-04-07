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

export './router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: "View,Route",
  routes: <AutoRoute<dynamic>>[
    AutoRoute(page: StartupView, path: "/", initial: true),
    AutoRoute(page: RegisterView, path: "/register"),
    AutoRoute(page: HomeView, path: "/home"),
    AutoRoute(page: MaterialCoveredView, path: "/material-covered"),
    AutoRoute(page: TeacherInfoView, path: "/teacher/:id"),
    AutoRoute(page: ScheduleView, path: "/schedule"),
    AutoRoute(page: TeacherListView, path: "/teacher-list"),
    AutoRoute(page: LoginView, path: "/login"),
    AutoRoute(page: HomeworkView, path: "/homework"),
    AutoRoute(page: AddHomeworkView, path: "/add-homework"),
    AutoRoute(page: HomeworkItemsView, path: "/homework-items"),
    AutoRoute(page: HomeworkItemInfoView, path: "/homework-item-info"),
    AutoRoute(page: AddHomeworkItemView, path: "/add-homework-item"),
    AutoRoute(page: EditProfileView, path: "/edit-profile"),
  ],
)
class $AppRouter {}
