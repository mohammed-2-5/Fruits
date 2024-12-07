import 'package:bloc/bloc.dart';
import 'package:fruits/features/auth/domain/entities/user_entity.dart';
import 'package:fruits/features/auth/domain/repositories/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());
  final AuthRepo authRepo;

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    emit(SignInLoading());
    var result = await authRepo.signInWithEmailAndPassword(email, password);
    result.fold(
        (l) => emit(SignInError(message: l.message)),
            (r) => emit(SignInSuccess(user:  r)));
  }

  Future<void> signInWithGoogle() async {
    emit(SignInLoading());
    var result = await authRepo.signInWithGoogle();
    result.fold(
        (l) => emit(SignInError(message: l.message)),
            (r) => emit(SignInSuccess(user:  r)));
  }

  Future<void> signInWithFacebook() async {
    emit(SignInLoading());
    var result = await authRepo.signInWithFacebook();
    result.fold(
        (l) => emit(SignInError(message: l.message)),
            (r) => emit(SignInSuccess(user:  r)));
  }
}
