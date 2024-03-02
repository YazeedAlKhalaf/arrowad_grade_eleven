import 'package:arrowad_grade_eleven/src/app/router/router.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RouterService {
  final AppRouter appRouter = AppRouter();
}
