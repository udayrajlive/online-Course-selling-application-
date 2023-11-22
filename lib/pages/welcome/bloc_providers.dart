import 'package:course_selling_app/app_bloc.dart';
import 'package:course_selling_app/pages/register/bloc/register_bloc.dart';
import 'package:course_selling_app/pages/signIn/bloc/sign_in_bloc.dart';
import 'package:course_selling_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => 
  [
        BlocProvider(lazy: false, create: (context) => WelcomeBloc(),),
        // BlocProvider(lazy: false, create: (context) => AppBlocs(),),
        BlocProvider(create: (context) => SignInBloc()),
        BlocProvider(create: (context)=>SignUpBlocs())
  
  ];
}
