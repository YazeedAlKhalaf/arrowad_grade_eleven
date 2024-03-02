import 'package:arrowad_grade_eleven/src/app/models/k_homework.dart';
import 'package:arrowad_grade_eleven/src/app/models/k_homework_item.dart';
import 'package:arrowad_grade_eleven/src/app/models/k_push_notification_token.dart';
import 'package:arrowad_grade_eleven/src/app/models/k_teacher.dart';
import 'package:arrowad_grade_eleven/src/app/models/k_user.dart';
import 'package:arrowad_grade_eleven/src/app/services/error_service.dart';
import 'package:arrowad_grade_eleven/src/app/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FirestoreService {
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;

  final CollectionReference<Map<String, dynamic>> _usersCollection =
      _firebaseFirestore.collection(
    Constants.usersCollectionName,
  );
  final CollectionReference<Map<String, dynamic>> _setupCollection =
      _firebaseFirestore.collection(
    Constants.setupCollectionName,
  );
  final CollectionReference<Map<String, dynamic>> _teachersCollection =
      _firebaseFirestore.collection(
    Constants.teachersCollectionName,
  );
  final CollectionReference<Map<String, dynamic>> _homeworkCollection =
      _firebaseFirestore.collection(
    Constants.homeworkCollectionName,
  );
  final CollectionReference<Map<String, dynamic>> _tokensCollection =
      _firebaseFirestore.collection(
    Constants.tokensCollectionName,
  );

  /// create user with provided user model
  /// may return error in case there is
  Future<dynamic> createUser({
    required KUser user,
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
    required String userId,
  }) async {
    try {
      final documentSnapshot = await _usersCollection.doc(userId).get();
      final KUser user = KUser.fromMap(documentSnapshot.data() ?? {});
      print("Got user with data: ${user.toString()}");

      return user;
    } catch (exception) {
      return ErrorService.handleFirestoreExceptions(exception);
    }
  }

  Future<dynamic> getPdfFileUrl() async {
    try {
      final documentSnapshot =
          await _setupCollection.doc("material_covered").get();

      final String pdfFileUrl = documentSnapshot.data()?["pdfFileUrl"];

      return pdfFileUrl;
    } catch (exception) {
      return ErrorService.handleFirestoreExceptions(exception);
    }
  }

  Future<dynamic> getTeachers() async {
    try {
      final querySnapshot = await _teachersCollection.get();

      final List<KTeacher> teacherList = <KTeacher>[];

      querySnapshot.docs.forEach((queryDocumentSnapshot) {
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
    required String id,
  }) async {
    try {
      final documentSnapshot = await _teachersCollection.doc(id).get();

      final KTeacher teacher = KTeacher.fromMap(documentSnapshot.data() ?? {});

      return teacher;
    } catch (exception) {
      return ErrorService.handleFirestoreExceptions(exception);
    }
  }

  Future<dynamic> getAllHomework() async {
    try {
      final querySnapshot = await _homeworkCollection
          .orderBy("createdAt", descending: true)
          .get();

      final List<KHomework> homeworkList = <KHomework>[];

      querySnapshot.docs.forEach((queryDocumentSnapshot) {
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
    required String name,
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
    required String homeworkId,
  }) async {
    try {
      final querySnapshot = await _homeworkCollection
          .doc(homeworkId)
          .collection(Constants.homeworkItemsCollectionName)
          .orderBy("createdAt", descending: true)
          .get();

      final List<KHomeworkItem> homeworkItems = <KHomeworkItem>[];

      querySnapshot.docs.forEach((queryDocumentSnapshot) {
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

  Future<dynamic> addNewHomeworkItem({
    required String homeworkId,
    required String name,
    required String description,
    required String subject,
    required String creatorId,
  }) async {
    try {
      final DocumentReference documentReference = _homeworkCollection
          .doc(homeworkId)
          .collection(Constants.homeworkItemsCollectionName)
          .doc();
      final KHomeworkItem homeworkItem = KHomeworkItem(
        id: documentReference.id,
        name: name,
        description: description,
        creatorId: creatorId,
        dueDate: DateTime.now(),
        subject: subject,
        createdAt: Timestamp.now(),
      );

      await documentReference.set(
        homeworkItem.toMap(),
      );
    } catch (exception) {
      return ErrorService.handleFirestoreExceptions(exception);
    }
  }

  Future<dynamic> updateUser({
    required String userId,
    required String firstName,
    required String lastName,
    required String photoUrl,
  }) async {
    try {
      await _usersCollection.doc(userId).update({
        "firstName": firstName,
        "lastName": lastName,
        "photoUrl": photoUrl,
      });
    } catch (exception) {
      return ErrorService.handleFirestoreExceptions(exception);
    }
  }

  Future<void> savePushNotificationToken({
    required KPushNotificationToken pushNotificationToken,
    required KUser currentUser,
  }) async {
    await _tokensCollection
        .doc(pushNotificationToken.token)
        .set(pushNotificationToken.toMap());
  }

  Future<void> deleteDeviceId({
    required String deviceId,
  }) async {
    await _tokensCollection.doc(deviceId).delete();
  }
}
