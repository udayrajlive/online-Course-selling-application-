import 'package:bloc/bloc.dart';
import 'package:course_selling_app/app_events.dart';
import 'package:course_selling_app/app_states.dart';

class AppBlocs extends Bloc<AppEvents, AppStates> {
  AppBlocs() : super(InitState()) {
    on<Increment>((event, serve) {
      print('value is added');
      serve(AppStates(counter: state.counter + 1));
    });
    on<decrement>(((event, ask) {
      print('value is removed');
      ask(AppStates(counter: state.counter - 1));
    }));
  }
}
