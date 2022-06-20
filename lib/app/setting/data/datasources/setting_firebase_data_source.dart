import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mi_learning/base/failure.dart';

abstract class SettingFirebaseDataSource {
  Future<Either<Failure, String>> uploadAvatar(File file, String fileName);
}

class SettingFirebaseDataSourceImpl implements SettingFirebaseDataSource {
  final String avatarPath = "/images/avatar";
  final storage = FirebaseStorage.instance;

  @override
  Future<Either<Failure, String>> uploadAvatar(
      File file, String fileName) async {
    final path = avatarPath + "/$fileName";
    final reference = storage.ref(path);

    try {
      await reference.putFile(file);

      final url = await reference.getDownloadURL();

      return Right(url);
    } on FirebaseException catch (e) {
      return Left(Failure(message: e.message));
    }
  }
}
