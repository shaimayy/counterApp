enum AuthStatus { initial, loading, success, error }

class RegisterState {
  final AuthStatus status;

  final String? errorMessage;

  const RegisterState({this.status = AuthStatus.initial, this.errorMessage});

  RegisterState copyWith({AuthStatus? status, String? errorMessage}) {
    return RegisterState(
      status: status ?? this.status,

      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return "status : $status error:$errorMessage";
  }
}

class LoginState {
  final AuthStatus status;

  final String? errorMessage;

  const LoginState({this.status = AuthStatus.initial, this.errorMessage});

  LoginState copyWith({AuthStatus? status, String? errorMessage}) {
    return LoginState(
      status: status ?? this.status,

      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return "status : $status , error:$errorMessage";
  }
}
