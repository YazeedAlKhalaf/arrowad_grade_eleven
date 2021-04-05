import 'package:injectable/injectable.dart';

import 'package:arrowad_grade_eleven/src/app/router/router.gr.dart';

@lazySingleton
class RouterService {
  final AppRouter appRouter = AppRouter();
}
