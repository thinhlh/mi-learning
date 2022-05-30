import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/core/errors/failures.dart';

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
      String message = '';

      switch (e.code) {
        case 'invalid-email':
          message = 'The email address is not valid';
          break;
        case 'user-disabled':
          message =
              'The user corresponding to the given email has been disabled';
          break;
        case 'user-not-found':
          message = 'There is no user corresponding to the given email';
          break;
        case 'wrong-password':
          message =
              'The given email, or the account corresponding to the email does not have a password set';
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
          message = 'The email address is not valid';
          break;
        case 'email-already-in-use':
          message =
              'There already exists an account with the given email address';
          break;
        case 'operation-not-allowed':
          message =
              'Email/password accounts are not enabled. Enable email/password accounts in the Firebase Console, under the Auth tab';
          break;
        case 'wrong-password':
          message =
              'The given email, or the account corresponding to the email does not have a password set';
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
