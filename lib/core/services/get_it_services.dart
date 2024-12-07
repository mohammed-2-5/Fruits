import 'package:fruits/core/services/firebase_auth_services.dart';
import 'package:fruits/core/services/firestore_services.dart';
import 'package:fruits/features/auth/domain/repositories/auth_repo.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/repositories/auth_repo_impl.dart';

final getIt = GetIt.instance;

void setupGetIt () {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<FireStoreService>(FireStoreService());


// Alternatively you could write it if you don't like global variables
  getIt.registerSingleton<AuthRepo>(
      AuthRepoImpl(authService: getIt.get<FirebaseAuthService>(), dataBaseService: getIt.get<FireStoreService>()),);
}
