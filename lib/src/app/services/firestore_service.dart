import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import 'package:arrowad_grade_eleven/src/app/models/k_user.model.dart';
import 'package:arrowad_grade_eleven/src/app/services/error_service.dart';
import 'package:arrowad_grade_eleven/src/app/utils/constants.dart';

@lazySingleton
class FirestoreService {
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;

  final CollectionReference _usersCollection = _firebaseFirestore.collection(
    Constants.usersCollectionName,
  );
  final CollectionReference _setupCollection = _firebaseFirestore.collection(
    Constants.setupCollectionName,
  );

  /// create user with provided user model
  /// may return error in case there is
  Future<dynamic> createUser({
    @required KUser user,
  }) async {
    try {
      await _usersCollection.doc(user.id).set(user.toMap());
      print("Created user with data: ${user.toString()}");
    } catch (exception) {
      ErrorService.handleUnknownErrors(exception);
    }
  }

  /// get user with provided ID
  /// may return error in case there is
  Future<dynamic> getUser({
    @required String userId,
  }) async {
    try {
      final DocumentSnapshot documentSnapshot =
          await _usersCollection.doc(userId).get();
      final KUser user = KUser.fromMap(documentSnapshot.data());
      print("Got user with data: ${user.toString()}");

      return user;
    } catch (exception) {
      return ErrorService.handleFirestoreExceptions(exception);
    }
  }

  Future<dynamic> getPdfFileUrl() async {
    try {
      final DocumentSnapshot documentSnapshot =
          await _setupCollection.doc("material_covered").get();

      final String pdfFileUrl = documentSnapshot.data()["pdfFileUrl"];

      return pdfFileUrl;
    } catch (exception) {
      return ErrorService.handleFirestoreExceptions(exception);
    }
  }
}
