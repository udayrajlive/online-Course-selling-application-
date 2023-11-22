import 'package:course_selling_app/pages/signIn/bloc/sign_in_events.dart';
import 'package:course_selling_app/pages/signIn/bloc/sign_in_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInStates> {
  
  SignInBloc() : super(const SignInStates()) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<SignInStates> emit) {
    // print("my email is: ${event.email}");
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInStates> emit) {
    // print("my password is: ${event.password}");
    emit(state.copyWith(password: event.password));
  }

}
