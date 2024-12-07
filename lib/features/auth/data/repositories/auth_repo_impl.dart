import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits/core/errors/exception.dart';
import 'package:fruits/core/errors/failure.dart';
import 'package:fruits/core/services/firebase_auth_services.dart';
import 'package:fruits/core/services/shared_preference.dart';
import 'package:fruits/core/utils/endpoints.dart';
import 'package:fruits/features/auth/data/models/user_model.dart';
import 'package:fruits/features/auth/domain/entities/user_entity.dart';
import 'package:fruits/features/auth/domain/repositories/auth_repo.dart';

import '../../../../core/services/data_base_services.dart';
import '../../../../core/utils/constants.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService authService;
  final DataBaseService dataBaseService;
  User? user;
  AuthRepoImpl({required this.authService, required this.dataBaseService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      user = await authService.signUpWithEmailAndPassword(
          email: email, password: password);
      var userEntity = UserEntity(
        email: email,
        uId: user!.uid,
        name: name,
      );

      await addUserData(userEntity: userEntity);
      return Right(userEntity);
    } on CustomExternalException catch (e) {
      await deleteUserCondition(user);
      return Left(ServerFailure(e.message));
    } catch (e) {
      await deleteUserCondition(user);
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<void> deleteUserCondition(User? user) async {
    if (user != null) {
      await authService.deleteUser();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await authService.signInWithEmailAndPassword(
          email: email, password: password);

      var userEntity = await getUserData(uId: user.uid);
     saveUserData(user: userEntity);
      return Right(userEntity);
    } on CustomExternalException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in AuthRepoImpl.signInWithEmailAndPassword: ${e.toString()}');
      return Left(ServerFailure('حدث خطأ ما. الرجاء المحاولة لاحقاً.'));
    }
  }

  @override
  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await authService.signInWithGoogle();

      var userEntity = UserModel.fromFirebaseUser(user);
      await saveUserData(user: userEntity);
      var isUserExist = await dataBaseService.isUserExits(
          collectionName: Endpoints.isUserExist, docId: user.uid);
      if (isUserExist) {
        await getUserData(uId: user.uid);

      } else {
        await addUserData(userEntity: userEntity);
      }
      return right(userEntity);
    } catch (e) {
      await deleteUserCondition(user);
      log(
        'Exception in AuthRepoImpl.signInWithGoogle: ${e.toString()}',
      );
      return left(
        ServerFailure(
          'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }
  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      var user = await authService.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      await saveUserData(user: userEntity);

      // Check if user exists in the database
      var isUserExist = dataBaseService.isUserExits(collectionName: Endpoints.isUserExist, docId: user.uid);
      if (await isUserExist) {
        await getUserData(uId: user.uid);
        print('signInWithFacebook');
      } else {
        await addUserData(userEntity: userEntity);
      }

      return Right(userEntity);
    } on CustomExternalException catch (e) {
      deleteUserCondition(user);
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in AuthRepoImpl.signInWithFacebook: ${e.toString()}');
      return Left(ServerFailure('حدث خطأ ما. الرجاء المحاولة لاحقاً.'));
    }
  }


  @override
  Future addUserData({required UserEntity userEntity}) async {

    await dataBaseService.addData(
        collectionName: Endpoints.addUserData,
        data: userEntity.toMap(),
      docId: userEntity.uId,

    );
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    var userData = await dataBaseService.getData(
        collectionName: Endpoints.getUserData, docId: uId);
    return UserModel.fromJson(userData);
  }
  @override
  Future saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await SharedPreferencesSingleton.setString(kUserData, jsonData);
  }
}
