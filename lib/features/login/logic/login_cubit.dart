import 'package:bloc/bloc.dart';
import 'package:fruits_e_commerce/features/auth/data/model/user_entity.dart';
import 'package:fruits_e_commerce/features/auth/data/repos/auth_repo.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    var result = await authRepo.loginWithEmailAndPassword(email, password);
    result.fold(
      (failure) => emit(LoginFailure(message: failure.message)),
      (userEntity) => emit(LoginSuccess(userEntity)),
    );
  }

  Future<void> loginWithGoogle() async {
    emit(LoginLoading());
    var result = await authRepo.loginWithGoogle();
    result.fold(
      (failure) => emit(LoginFailure(message: failure.message)),
      (userEntity) => emit(LoginSuccess(userEntity)),
    );
  }

  Future<void> loginWithFacebook() async {
    emit(LoginLoading());
    var result = await authRepo.loginWithFacebook();
    result.fold(
      (failure) => emit(LoginFailure(message: failure.message)),
      (userEntity) => emit(LoginSuccess(userEntity)),
    );
  }
}
