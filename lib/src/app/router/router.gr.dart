// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:arrowad_grade_eleven/src/ui/views/add_homework/add_homework_view.dart'
    as _i11;
import 'package:arrowad_grade_eleven/src/ui/views/home/home_view.dart' as _i4;
import 'package:arrowad_grade_eleven/src/ui/views/homework/homework_view.dart'
    as _i10;
import 'package:arrowad_grade_eleven/src/ui/views/login/login_view.dart' as _i9;
import 'package:arrowad_grade_eleven/src/ui/views/material_covered/material_covered_view.dart'
    as _i5;
import 'package:arrowad_grade_eleven/src/ui/views/register/register_view.dart'
    as _i3;
import 'package:arrowad_grade_eleven/src/ui/views/schedule/schedule_view.dart'
    as _i7;
import 'package:arrowad_grade_eleven/src/ui/views/startup/startup_view.dart'
    as _i2;
import 'package:arrowad_grade_eleven/src/ui/views/teacher_info/teacher_info_view.dart'
    as _i6;
import 'package:arrowad_grade_eleven/src/ui/views/teacher_list/teacher_list_view.dart'
    as _i8;
import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i12;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    StartupRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i2.StartupView());
    },
    RegisterRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i3.RegisterView());
    },
    HomeRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i4.HomeView());
    },
    MaterialCoveredRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i5.MaterialCoveredView());
    },
    TeacherInfoRoute.name: (entry) {
      var pathParams = entry.routeData.pathParams;
      var args = entry.routeData.argsAs<TeacherInfoRouteArgs>(
          orElse: () => TeacherInfoRouteArgs(id: pathParams.getString('id')));
      return _i1.AdaptivePage(
          entry: entry, child: _i6.TeacherInfoView(key: args.key, id: args.id));
    },
    ScheduleRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i7.ScheduleView());
    },
    TeacherListRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i8.TeacherListView());
    },
    LoginRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i9.LoginView());
    },
    HomeworkRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i10.HomeworkView());
    },
    AddHomeworkRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i11.AddHomeworkView());
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(StartupRoute.name, path: '/'),
        _i1.RouteConfig(RegisterRoute.name, path: '/register'),
        _i1.RouteConfig(HomeRoute.name, path: '/home'),
        _i1.RouteConfig(MaterialCoveredRoute.name, path: '/material-covered'),
        _i1.RouteConfig(TeacherInfoRoute.name, path: '/teacher/:id'),
        _i1.RouteConfig(ScheduleRoute.name, path: '/schedule'),
        _i1.RouteConfig(TeacherListRoute.name, path: '/teacher-list'),
        _i1.RouteConfig(LoginRoute.name, path: '/login'),
        _i1.RouteConfig(HomeworkRoute.name, path: '/homework'),
        _i1.RouteConfig(AddHomeworkRoute.name, path: '/add-homework')
      ];
}

class StartupRoute extends _i1.PageRouteInfo {
  const StartupRoute() : super(name, path: '/');

  static const String name = 'StartupRoute';
}

class RegisterRoute extends _i1.PageRouteInfo {
  const RegisterRoute() : super(name, path: '/register');

  static const String name = 'RegisterRoute';
}

class HomeRoute extends _i1.PageRouteInfo {
  const HomeRoute() : super(name, path: '/home');

  static const String name = 'HomeRoute';
}

class MaterialCoveredRoute extends _i1.PageRouteInfo {
  const MaterialCoveredRoute() : super(name, path: '/material-covered');

  static const String name = 'MaterialCoveredRoute';
}

class TeacherInfoRoute extends _i1.PageRouteInfo<TeacherInfoRouteArgs> {
  TeacherInfoRoute({_i12.Key key, String id})
      : super(name,
            path: '/teacher/:id',
            args: TeacherInfoRouteArgs(key: key, id: id),
            params: {'id': id});

  static const String name = 'TeacherInfoRoute';
}

class TeacherInfoRouteArgs {
  const TeacherInfoRouteArgs({this.key, this.id});

  final _i12.Key key;

  final String id;
}

class ScheduleRoute extends _i1.PageRouteInfo {
  const ScheduleRoute() : super(name, path: '/schedule');

  static const String name = 'ScheduleRoute';
}

class TeacherListRoute extends _i1.PageRouteInfo {
  const TeacherListRoute() : super(name, path: '/teacher-list');

  static const String name = 'TeacherListRoute';
}

class LoginRoute extends _i1.PageRouteInfo {
  const LoginRoute() : super(name, path: '/login');

  static const String name = 'LoginRoute';
}

class HomeworkRoute extends _i1.PageRouteInfo {
  const HomeworkRoute() : super(name, path: '/homework');

  static const String name = 'HomeworkRoute';
}

class AddHomeworkRoute extends _i1.PageRouteInfo {
  const AddHomeworkRoute() : super(name, path: '/add-homework');

  static const String name = 'AddHomeworkRoute';
}
