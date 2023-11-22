class SignUpStates {
  final String username;
  final String email;
  final String password;
  final String rePassword;

  const SignUpStates({this.email = "", this.password = "", this.username = "", this.rePassword=""});

  SignUpStates copyWith({String? email, String? password, String? username, String? rePassword,}) {
    return SignUpStates(
      email: email ?? this.email,
      password: password ?? this.password,
      username: username ?? this.username,
      rePassword: rePassword ?? this.rePassword
    );
  }
}

