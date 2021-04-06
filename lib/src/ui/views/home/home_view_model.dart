import 'package:arrowad_grade_eleven/src/app/core/custom_base_view_model.dart';
import 'package:arrowad_grade_eleven/src/app/locator/locator.dart';
import 'package:arrowad_grade_eleven/src/app/models/k_teacher.dart';
import 'package:arrowad_grade_eleven/src/app/router/router.gr.dart';
import 'package:arrowad_grade_eleven/src/app/services/router_service.dart';

class HomeViewModel extends CustomBaseViewModel {
  final RouterService _routerService = locator<RouterService>();

  List<KTeacher> _teachersList = <KTeacher>[
    KTeacher(
      id: "ali_hwedy",
      firstName: "Ali",
      lastName: "Hwedy",
      photoUrl:
          "https://t3.ftcdn.net/jpg/02/22/85/16/360_F_222851624_jfoMGbJxwRi5AWGdPgXKSABMnzCQo9RN.jpg",
    ),
    KTeacher(
      id: "mohammad_abdulaziz",
      firstName: "Mohammad",
      lastName: "Abdulaziz",
      photoUrl:
          "https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg?size=626&ext=jpg&ga=GA1.2.1588707983.1617235200",
    ),
  ];
  List<KTeacher> get teachersList => _teachersList;
  void setTeachersList(List<KTeacher> newValue) {
    _teachersList = newValue;
    notifyListeners();
  }

  Future<void> navigateToMaterialCoveredView() async {
    await _routerService.appRouter.push(
      MaterialCoveredRoute(),
    );
  }
}
