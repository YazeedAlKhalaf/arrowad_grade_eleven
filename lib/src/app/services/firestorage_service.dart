import 'dart:io';

import 'package:arrowad_grade_eleven/src/app/locator/locator.dart';
import 'package:arrowad_grade_eleven/src/app/services/auth_service.dart';
import 'package:arrowad_grade_eleven/src/app/services/error_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FirestorageService {
  final AuthService _authService = locator<AuthService>();
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  TaskSnapshot? _taskSnapshot;
  TaskSnapshot? get taskSnapshot => _taskSnapshot;
  void _setTaskSnapshot(TaskSnapshot? newValue) {
    _taskSnapshot = newValue;
  }

  Future<dynamic> uploadProfileImage(File profileImage) async {
    try {
      _setTaskSnapshot(null);
      final Reference reference = _firebaseStorage.ref(
        "profile_images/${_authService.currentUser!.id}/${DateTime.now().toIso8601String()}.jpeg",
      );
      final TaskSnapshot _taskSnapshotTemp = await reference.putFile(
        profileImage,
      );
      _setTaskSnapshot(_taskSnapshotTemp);

      final String downloadUrl = await reference.getDownloadURL();

      return downloadUrl;
    } catch (exception) {
      return ErrorService.handleUnknownErrors(exception);
    }
  }
}
