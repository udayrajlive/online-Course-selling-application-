abstract class SignUpEvent {
  const SignUpEvent();
}

class UserNameEvent extends SignUpEvent {
  final String  userName;
  const UserNameEvent(this.userName);
}

class RegisterEmailEvent extends SignUpEvent {
  final String  email;
  const RegisterEmailEvent(this.email);
}

class RegisterPasswordEvent extends SignUpEvent {
  final String  password;
  const RegisterPasswordEvent(this.password);
}

class RepasswordEvent extends SignUpEvent {
  final String  rePassword;
  const RepasswordEvent(this.rePassword);
}
