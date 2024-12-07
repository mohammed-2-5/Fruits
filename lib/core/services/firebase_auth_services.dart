import 'dart:convert';
import 'dart:developer' as dv;
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruits/core/errors/exception.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';


class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthService({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;


  Future deleteUser() async {
    await _firebaseAuth.currentUser!.delete();
  }
  Future<User> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user!;
    } on FirebaseAuthException catch (e) {
      dv.log("Exception in FirebaseAuthService.signUpWithEmailAndPassword: ${e
          .toString()} and code is ${e.code}");
      if (e.code == 'weak-password') {
        throw CustomExternalException(
            message: "كلمة المرور التي أدخلتها ضعيفة جداً.");
      } else if (e.code == 'email-already-in-use') {
        throw CustomExternalException(
            message: "البريد الإلكتروني الذي أدخلته مستخدم من قبل.");
      } else if (e.code == 'network-request-failed') {
        throw CustomExternalException(message: 'تأكد من اتصالك بالإنترنت.');
      } else {
        throw CustomExternalException(
            message: "حدث خطأ ما. الرجاء المحاولة لاحقاً.");
      }
    } catch (e) {
      dv.log("Exception in FirebaseAuthService.signUpWithEmailAndPassword: ${e
          .toString()}");
      throw CustomExternalException(
          message: "حدث خطأ ما. الرجاء المحاولة لاحقاً.");
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user!;
    } on FirebaseAuthException catch (e) {
      dv.log("Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e
          .toString()} and code is ${e.code}");
      if (e.code == 'user-not-found') {
        throw CustomExternalException(
            message: "كلمة المرور او البريد الالكتروني غير صحيحة.");
      } else if (e.code == 'wrong-password') {
        throw CustomExternalException(
            message: "كلمة المرور او البريد الالكتروني غير صحيحة.");
      } else if (e.code == 'network-request-failed') {
        throw CustomExternalException(message: 'تأكد من اتصالك بالإنترنت.');
      } else {
        throw CustomExternalException(
            message: "حدث خطأ ما. الرجاء المحاولة لاحقاً.");
      }
    } catch (e) {
      dv.log("Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e
          .toString()}");
      throw CustomExternalException(
          message: "حدث خطأ ما. الرجاء المحاولة لاحقاً.");
    }
  }


  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
    await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential)).user!;
  }
  String generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<UserCredential> signInWithApple() async {

    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    // Create an `OAuthCredential` from the credential returned by Apple.
    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );

    // Sign in the user with Firebase. If the nonce we generated earlier does
    // not match the nonce in `appleCredential.identityToken`, sign in will fail.
    return await FirebaseAuth.instance.signInWithCredential(oauthCredential);
  }

  bool isLoggedIn() {
    return _firebaseAuth.currentUser != null;
  }
}