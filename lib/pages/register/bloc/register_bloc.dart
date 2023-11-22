import 'package:course_selling_app/pages/register/bloc/register_event.dart';
import 'package:course_selling_app/pages/register/bloc/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBlocs extends Bloc<SignUpEvent, SignUpStates> {
  SignUpBlocs() : super(const SignUpStates()) {
    on<UserNameEvent>(_userNameEvent);
    on<RegisterEmailEvent>(_registerEmailEvent);
    on<RegisterPasswordEvent>(_registerPasswordEvent);
    on<RepasswordEvent>(_rePasswordEvent);
  }

  void _userNameEvent(UserNameEvent event, Emitter<SignUpStates> emit) {
    print("${event.userName}");
    emit(state.copyWith(username: event.userName));
  }

  void _registerEmailEvent( RegisterEmailEvent event, Emitter<SignUpStates> emit) {
    print("${event.email}");
    emit(state.copyWith(email: event.email));
  }

  void _registerPasswordEvent(  RegisterPasswordEvent event, Emitter<SignUpStates> emit) {
    print("${event.password}");
    emit(state.copyWith(password: event.password));
  }

  void _rePasswordEvent(RepasswordEvent event, Emitter<SignUpStates> emit) {
    print("${event.rePassword}");
    emit(state.copyWith(rePassword: event.rePassword));
  }
}
