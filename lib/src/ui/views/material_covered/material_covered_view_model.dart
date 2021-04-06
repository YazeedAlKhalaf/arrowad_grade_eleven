import 'package:arrowad_grade_eleven/src/app/core/custom_base_view_model.dart';
import 'package:arrowad_grade_eleven/src/app/locator/locator.dart';
import 'package:arrowad_grade_eleven/src/app/services/firestore_service.dart';

class MaterialCoveredViewModel extends CustomBaseViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();

  Future<String> getPdfUrl() async {
    final String pdfUrl = await _firestoreService.getPdfFileUrl();

    return pdfUrl;
  }
}
