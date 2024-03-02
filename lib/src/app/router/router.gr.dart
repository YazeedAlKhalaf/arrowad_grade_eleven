// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddHomeworkItemRoute.name: (routeData) {
      final args = routeData.argsAs<AddHomeworkItemRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddHomeworkItemView(
          key: args.key,
          homeworkId: args.homeworkId,
        ),
      );
    },
    AddHomeworkRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddHomeworkView(),
      );
    },
    EditProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditProfileView(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomeView(),
      );
    },
    HomeworkItemInfoRoute.name: (routeData) {
      final args = routeData.argsAs<HomeworkItemInfoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomeworkItemInfoView(
          key: args.key,
          homeworkItem: args.homeworkItem,
        ),
      );
    },
    HomeworkItemsRoute.name: (routeData) {
      final args = routeData.argsAs<HomeworkItemsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomeworkItemsView(
          key: args.key,
          homework: args.homework,
        ),
      );
    },
    HomeworkRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomeworkView(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginView(),
      );
    },
    MaterialCoveredRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MaterialCoveredView(),
      );
    },
    RegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RegisterView(),
      );
    },
    ScheduleRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ScheduleView(),
      );
    },
    StartupRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: StartupView(),
      );
    },
    TeacherInfoRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<TeacherInfoRouteArgs>(
          orElse: () => TeacherInfoRouteArgs(id: pathParams.getString('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TeacherInfoView(
          key: args.key,
          id: args.id,
        ),
      );
    },
    TeacherListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TeacherListView(),
      );
    },
  };
}

/// generated route for
/// [AddHomeworkItemView]
class AddHomeworkItemRoute extends PageRouteInfo<AddHomeworkItemRouteArgs> {
  AddHomeworkItemRoute({
    Key? key,
    required String homeworkId,
    List<PageRouteInfo>? children,
  }) : super(
          AddHomeworkItemRoute.name,
          args: AddHomeworkItemRouteArgs(
            key: key,
            homeworkId: homeworkId,
          ),
          initialChildren: children,
        );

  static const String name = 'AddHomeworkItemRoute';

  static const PageInfo<AddHomeworkItemRouteArgs> page =
      PageInfo<AddHomeworkItemRouteArgs>(name);
}

class AddHomeworkItemRouteArgs {
  const AddHomeworkItemRouteArgs({
    this.key,
    required this.homeworkId,
  });

  final Key? key;

  final String homeworkId;

  @override
  String toString() {
    return 'AddHomeworkItemRouteArgs{key: $key, homeworkId: $homeworkId}';
  }
}

/// generated route for
/// [AddHomeworkView]
class AddHomeworkRoute extends PageRouteInfo<void> {
  const AddHomeworkRoute({List<PageRouteInfo>? children})
      : super(
          AddHomeworkRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddHomeworkRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditProfileView]
class EditProfileRoute extends PageRouteInfo<void> {
  const EditProfileRoute({List<PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeworkItemInfoView]
class HomeworkItemInfoRoute extends PageRouteInfo<HomeworkItemInfoRouteArgs> {
  HomeworkItemInfoRoute({
    Key? key,
    required KHomeworkItem homeworkItem,
    List<PageRouteInfo>? children,
  }) : super(
          HomeworkItemInfoRoute.name,
          args: HomeworkItemInfoRouteArgs(
            key: key,
            homeworkItem: homeworkItem,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeworkItemInfoRoute';

  static const PageInfo<HomeworkItemInfoRouteArgs> page =
      PageInfo<HomeworkItemInfoRouteArgs>(name);
}

class HomeworkItemInfoRouteArgs {
  const HomeworkItemInfoRouteArgs({
    this.key,
    required this.homeworkItem,
  });

  final Key? key;

  final KHomeworkItem homeworkItem;

  @override
  String toString() {
    return 'HomeworkItemInfoRouteArgs{key: $key, homeworkItem: $homeworkItem}';
  }
}

/// generated route for
/// [HomeworkItemsView]
class HomeworkItemsRoute extends PageRouteInfo<HomeworkItemsRouteArgs> {
  HomeworkItemsRoute({
    Key? key,
    required KHomework homework,
    List<PageRouteInfo>? children,
  }) : super(
          HomeworkItemsRoute.name,
          args: HomeworkItemsRouteArgs(
            key: key,
            homework: homework,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeworkItemsRoute';

  static const PageInfo<HomeworkItemsRouteArgs> page =
      PageInfo<HomeworkItemsRouteArgs>(name);
}

class HomeworkItemsRouteArgs {
  const HomeworkItemsRouteArgs({
    this.key,
    required this.homework,
  });

  final Key? key;

  final KHomework homework;

  @override
  String toString() {
    return 'HomeworkItemsRouteArgs{key: $key, homework: $homework}';
  }
}

/// generated route for
/// [HomeworkView]
class HomeworkRoute extends PageRouteInfo<void> {
  const HomeworkRoute({List<PageRouteInfo>? children})
      : super(
          HomeworkRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeworkRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginView]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MaterialCoveredView]
class MaterialCoveredRoute extends PageRouteInfo<void> {
  const MaterialCoveredRoute({List<PageRouteInfo>? children})
      : super(
          MaterialCoveredRoute.name,
          initialChildren: children,
        );

  static const String name = 'MaterialCoveredRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterView]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScheduleView]
class ScheduleRoute extends PageRouteInfo<void> {
  const ScheduleRoute({List<PageRouteInfo>? children})
      : super(
          ScheduleRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScheduleRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StartupView]
class StartupRoute extends PageRouteInfo<void> {
  const StartupRoute({List<PageRouteInfo>? children})
      : super(
          StartupRoute.name,
          initialChildren: children,
        );

  static const String name = 'StartupRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TeacherInfoView]
class TeacherInfoRoute extends PageRouteInfo<TeacherInfoRouteArgs> {
  TeacherInfoRoute({
    Key? key,
    required String id,
    List<PageRouteInfo>? children,
  }) : super(
          TeacherInfoRoute.name,
          args: TeacherInfoRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'TeacherInfoRoute';

  static const PageInfo<TeacherInfoRouteArgs> page =
      PageInfo<TeacherInfoRouteArgs>(name);
}

class TeacherInfoRouteArgs {
  const TeacherInfoRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final String id;

  @override
  String toString() {
    return 'TeacherInfoRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [TeacherListView]
class TeacherListRoute extends PageRouteInfo<void> {
  const TeacherListRoute({List<PageRouteInfo>? children})
      : super(
          TeacherListRoute.name,
          initialChildren: children,
        );

  static const String name = 'TeacherListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
