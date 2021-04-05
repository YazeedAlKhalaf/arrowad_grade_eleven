import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import 'package:arrowad_grade_eleven/src/app/locator/locator.dart';
import 'package:arrowad_grade_eleven/src/app/models/k_user.model.dart';
import 'package:arrowad_grade_eleven/src/app/router/router.dart';
import 'package:arrowad_grade_eleven/src/app/services/error_service.dart';
import 'package:arrowad_grade_eleven/src/app/services/firestore_service.dart';
import 'package:arrowad_grade_eleven/src/app/services/router_service.dart';

@lazySingleton
class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final RouterService _routerService = locator<RouterService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();

  KUser _currentUser;
  KUser get currentUser => _currentUser;

  User get currentFirebaseUser => _firebaseAuth.currentUser;

  /// sends verification code
  /// to create a user, pass `firstName`, `lastName`, and `sNumber`
  Future<dynamic> sendVerificationCode({
    @required String phoneNumber,
    String firstName,
    String lastName,
    String sNumber,
    @required Function(String, int) codeSent,
    @required Function(String) codeAutoRetrievalTimeout,
  }) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          _firebaseAuth.signInWithCredential(phoneAuthCredential);
          if (firstName != null && lastName != null && sNumber != null) {
            await _registerUserInDb(
              phoneNumber: phoneNumber,
              firstName: firstName,
              lastName: lastName,
              sNumber: sNumber,
            );
          } else {
            await populateCurrentUser();
          }
          await _routerService.appRouter.pushAndRemoveUntil(
            HomeRoute(),
            predicate: (_) => false,
          );
        },
        verificationFailed: (FirebaseAuthException firebaseAuthException) {
          throw firebaseAuthException;
        },
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
        timeout: const Duration(seconds: 60),
      );
    } on FirebaseAuthException catch (exception) {
      return ErrorService.handleFirebaseAuthExceptions(exception);
    }
  }

  Future<dynamic> verifyPhoneNumber({
    @required String verificationId,
    @required String verificationCode,
    @required String phoneNumber,
    String firstName,
    String lastName,
    String sNumber,
  }) async {
    try {
      final AuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: verificationCode,
      );

      await _firebaseAuth.signInWithCredential(phoneAuthCredential);

      if (firstName != null && lastName != null && sNumber != null) {
        await _registerUserInDb(
          firstName: firstName,
          lastName: lastName,
          phoneNumber: phoneNumber,
          sNumber: sNumber,
        );
      } else {
        await populateCurrentUser();
      }
    } on FirebaseAuthException catch (exception) {
      return ErrorService.handleFirebaseAuthExceptions(exception);
    }
  }

  Future<void> _registerUserInDb({
    @required String phoneNumber,
    @required String firstName,
    @required String lastName,
    @required String sNumber,
  }) async {
    _currentUser = KUser(
      id: currentFirebaseUser.uid,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      sNumber: sNumber,
    );
    await _firestoreService.createUser(
      user: currentUser,
    );
    await populateCurrentUser();
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  bool isUserLoggedIn() {
    return currentFirebaseUser != null;
  }

  Future<void> populateCurrentUser() async {
    if (isUserLoggedIn()) {
      final dynamic user = await _firestoreService.getUser(
        userId: currentFirebaseUser.uid,
      );

      if (user is KUser) {
        _currentUser = user;
      }
    }
  }
}
