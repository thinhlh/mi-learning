import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/config/local_keys.dart';
import 'package:mi_learning/core/errors/failures.dart';
import 'package:mi_learning/generated/locale_keys.g.dart';

abstract class AuthFirebaseDataSource {
  Future<Either<Failure, bool>> emailPasswordSignIn(
    String email,
    String password,
  );

  Future<Either<Failure, bool>> emailPasswordRegister(
    String email,
    String password,
  );

  Future<Either<Failure, bool>> forgetPassword(String email);
  // Future<Either<Failure, dynamic>> emailSignIn(String email);
  // Future<Either<Failure, dynamic>> googleSignIn();
}

class AuthFirebaseDataSourceImpl implements AuthFirebaseDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<Either<Failure, bool>> emailPasswordSignIn(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;

      // if (user != null && !user.emailVerified) {
      //   user.sendEmailVerification();
      //   return const Right(false);
      // }
      return const Right(true);
    } on FirebaseAuthException catch (e) {
      String message = tr(LocaleKeys.common_default_error);

      switch (e.code) {
        case 'invalid-email':
          message = tr(LocaleKeys.auth_invalid_email);
          break;
        case 'user-disabled':
          message = tr(LocaleKeys.auth_user_disabled);
          break;
        case 'user-not-found':
          message = tr(LocaleKeys.auth_user_not_found);
          break;
        case 'wrong-password':
          message = tr(LocaleKeys.auth_wrong_password);
          break;
        default:
          break;
      }

      return Left(AuthenticationFailure(message: message));
    }
  }

  @override
  Future<Either<Failure, bool>> emailPasswordRegister(
      String email, String password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;

      if (user != null && !user.emailVerified) {
        user.sendEmailVerification();
        return const Right(false);
      }
      return const Right(true);
    } on FirebaseAuthException catch (e) {
      String message = '';

      switch (e.code) {
        case 'invalid-email':
          message = tr(LocaleKeys.register_invalid_email);
          break;
        case 'email-already-in-use':
          message = tr(LocaleKeys.register_email_already_in_use);
          break;
        case 'operation-not-allowed':
          message = tr(LocaleKeys.register_operation_not_allowed);
          break;
        case 'wrong-password':
          message = tr(LocaleKeys.register_wrong_password);
          break;
        default:
          break;
      }

      return Left(AuthenticationFailure(message: message));
    }
  }

  @override
  Future<Either<Failure, bool>> forgetPassword(String email) async {
    try {
      final result = await _auth
          .sendPasswordResetEmail(
            email: email,
          )
          .timeout(const Duration(seconds: 60));

      return const Right(true);
    } on FirebaseAuthException catch (e) {
      return Left(Failure(message: e.message));
    }
  }

  // @override
  // Future<Either<Failure, dynamic>> emailSignIn(String email) async {}

  // @override
  // Future<Either<Failure, dynamic>> googleSignIn() async {}
}
