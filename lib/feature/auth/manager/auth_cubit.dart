import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState());

  Future<void> register(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      emit(
        state.copyWith(
          status: AuthStatus.error,
          errorMessage: 'fill the boxes',
        ),
      );
      return;
    }

    emit(state.copyWith(status: AuthStatus.loading));

    try {
       final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      emit(state.copyWith(status: AuthStatus.success));
    } catch (e) {
      emit(
        state.copyWith(status: AuthStatus.error, errorMessage: e.toString()),
      );
    }
  }
}

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());
  Future<void> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      emit(
        state.copyWith(
          status: AuthStatus.error,
          errorMessage: " fill the boxes",
        ),
      );
      return;
    }
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      emit(state.copyWith(status: AuthStatus.success));
    } catch (e) {
      emit(
        state.copyWith(status: AuthStatus.error, errorMessage: e.toString()),
      );
    }
  }
}
