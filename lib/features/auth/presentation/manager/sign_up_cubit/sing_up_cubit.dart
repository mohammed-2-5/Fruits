import 'package:bloc/bloc.dart';
import 'package:fruits/features/auth/domain/entities/user_entity.dart';
import 'package:fruits/features/auth/domain/repositories/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sing_up_state.dart';

class SingUpCubit extends Cubit<SingUpState> {
  SingUpCubit(this.authRepo) : super(SingUpInitial());
  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword( String email, String password, String name) async {
    emit(SingUpLoading());
    var result = await authRepo.createUserWithEmailAndPassword(email, password, name);
    result.fold((failure) {
      emit(SingUpFailure(failure.message));
    }, (userEntity) {
      emit(SingUpSuccess(userEntity));
    });
  }

}
