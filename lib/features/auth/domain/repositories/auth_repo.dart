import 'package:dartz/dartz.dart';
import 'package:fruits/core/errors/failure.dart';
import 'package:fruits/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure,UserEntity>> createUserWithEmailAndPassword(
      String email, String password,String name);

  Future<Either<Failure,UserEntity>> signInWithEmailAndPassword(
      String email, String password);

  Future<Either<Failure,UserEntity>> signInWithGoogle();
  Future<Either<Failure,UserEntity>> signInWithFacebook();
  Future addUserData({required UserEntity userEntity});
  Future<UserEntity> getUserData({required String uId});
  Future saveUserData({required UserEntity user});

}
