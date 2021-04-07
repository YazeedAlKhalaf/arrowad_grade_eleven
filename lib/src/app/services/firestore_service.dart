import 'package:arrowad_grade_eleven/src/app/models/k_homework.dart';
import 'package:arrowad_grade_eleven/src/app/models/k_homework_item.dart';
import 'package:arrowad_grade_eleven/src/app/models/k_teacher.dart';
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
  final CollectionReference _teachersCollection = _firebaseFirestore.collection(
    Constants.teachersCollectionName,
  );
  final CollectionReference _homeworkCollection = _firebaseFirestore.collection(
    Constants.homeworkCollectionName,
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

  Future<dynamic> getTeachers() async {
    try {
      final QuerySnapshot querySnapshot = await _teachersCollection.get();

      final List<KTeacher> teacherList = <KTeacher>[];

      querySnapshot.docs.forEach((QueryDocumentSnapshot queryDocumentSnapshot) {
        teacherList.add(
          KTeacher.fromMap(
            queryDocumentSnapshot.data(),
          ),
        );
      });

      return teacherList;
    } catch (exception) {
      return ErrorService.handleFirestoreExceptions(exception);
    }
  }

  Future<dynamic> getTeacherById({
    @required String id,
  }) async {
    try {
      final DocumentSnapshot documentSnapshot =
          await _teachersCollection.doc(id).get();

      final KTeacher teacher = KTeacher.fromMap(documentSnapshot.data());

      return teacher;
    } catch (exception) {
      return ErrorService.handleFirestoreExceptions(exception);
    }
  }

  Future<dynamic> getAllHomework() async {
    try {
      final QuerySnapshot querySnapshot = await _homeworkCollection
          .orderBy("createdAt", descending: true)
          .get();

      final List<KHomework> homeworkList = <KHomework>[];

      querySnapshot.docs.forEach((QueryDocumentSnapshot queryDocumentSnapshot) {
        homeworkList.add(
          KHomework.fromMap(
            queryDocumentSnapshot.data(),
          ),
        );
      });

      return homeworkList;
    } catch (exception) {
      return ErrorService.handleFirestoreExceptions(exception);
    }
  }

  Future<dynamic> addNewHomework({
    @required String name,
  }) async {
    try {
      final DocumentReference documentReference = _homeworkCollection.doc();
      final KHomework homework = KHomework(
        id: documentReference.id,
        name: name,
        createdAt: Timestamp.now(),
      );

      await documentReference.set(
        homework.toMap(),
      );
    } catch (exception) {
      return ErrorService.handleFirestoreExceptions(exception);
    }
  }

  Future<dynamic> getAllHomeworkItems({
    @required String homeworkId,
  }) async {
    try {
      final QuerySnapshot querySnapshot = await _homeworkCollection
          .doc(homeworkId)
          .collection(Constants.homeworkItemsCollectionName)
          .orderBy("createdAt", descending: true)
          .get();

      final List<KHomeworkItem> homeworkItems = <KHomeworkItem>[];

      querySnapshot.docs.forEach((QueryDocumentSnapshot queryDocumentSnapshot) {
        homeworkItems.add(
          KHomeworkItem.fromMap(
            queryDocumentSnapshot.data(),
          ),
        );
      });

      return homeworkItems;
    } catch (exception) {
      return ErrorService.handleFirestoreExceptions(exception);
    }
  }
}
