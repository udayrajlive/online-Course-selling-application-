import 'dart:async';
import 'package:course_selling_app/pages/signIn/bloc/sign_in_bloc.dart';
import 'package:course_selling_app/pages/signIn/bloc/sign_in_events.dart';
import 'package:course_selling_app/pages/signIn/bloc/sign_in_states.dart';
import 'package:course_selling_app/pages/signIn/sign_in_controller.dart';
import 'package:course_selling_app/pages/signIn/widgets/signIn_widget.dart';
import 'package:course_selling_app/utils/helper_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignInPageForm extends StatefulWidget {
  const SignInPageForm({super.key});

  @override
  State<SignInPageForm> createState() => _SignInPageFormState();
}

class _SignInPageFormState extends State<SignInPageForm> {
  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    _formKey;
  }

  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  bool _passwordVisible = false;
  late String _passsword;
  late String _email;
  // late TextEditingController nameController;
  // late TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInStates>(builder: (context, state) {
      return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SafeArea(
          child: Scaffold(
            appBar: buildAppBar(context, 'Log In'),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                        flex: 2,
                        fit: FlexFit.loose,
                        child: Column(
                          children: [
                            buildThirdpartyLogin(context),
                            reusableText(
                                'Or Use Your Email account to login', context),
                          ],
                        )),
                    addVerticalSpace(15.h),
                    Flexible(
                      flex: 5,
                      fit: FlexFit.loose,
                      child: userLogin(),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 1,
                          fit: FlexFit.loose,
                          child: TextButton(
                            onPressed: () {
                              SignInController(context: context)
                                  .handleSignIn("email");
                              if (kDebugMode) {
                                print('details saved  ');
                              }
                            },
                            style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all<Size>(
                                Size(
                                    MediaQuery.sizeOf(context).width * .95, 56),
                              ),
                            ),
                            child: Text(
                              'Confirm details',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                        addVerticalSpace(10.h),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.loose,
                          child: TextButton(
                            onPressed: () {
                              context.push('/registerScreen');
                            },
                            style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all<Size>(
                                Size(
                                    MediaQuery.sizeOf(context).width * .95, 56),
                              ),
                            ),
                            child: Text(
                              'Registration',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                    addVerticalSpace(15.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget userLogin() {
    return BlocBuilder<SignInBloc, SignInStates>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Email Address',
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleSmall),
              addVerticalSpace(5.h),
              TextField(
                onChanged: (value) {
                  context.read<SignInBloc>().add(EmailEvent(value));
                },
                inputFormatters: <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(50),
                ],
                decoration: const InputDecoration()
                    .applyDefaults(
                      Theme.of(context).inputDecorationTheme,
                    )
                    .copyWith(
                      hintText: ' Eg.- xyz@gmail.com',
                      // labelText: 'Email',
                    ),
                keyboardType: TextInputType.emailAddress,
              ),
              addVerticalSpace(10.h),
              Text('Password',
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleSmall),
              addVerticalSpace(5.h),
              TextField(
                obscureText: !_passwordVisible,
                onChanged: (value) {
                  context.read<SignInBloc>().add(PasswordEvent(value));
                },
                inputFormatters: <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(20),
                ],
                decoration: const InputDecoration()
                    .applyDefaults(
                      Theme.of(context).inputDecorationTheme,
                    )
                    .copyWith(
                        hintText: 'Eg.- Floyd@123 ',
                        // labelText: 'Password',
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).primaryColor,
                            ))),
                keyboardType: TextInputType.text,
              ),
              addVerticalSpace(15.h),
              GestureDetector(
                onTap: () {
                  print('forget password');
                },
                child: Text('Forget Password ',
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold)),
              ),
              addVerticalSpace(15.h),
            ],
          ),
        ],
      );
    });
  }
}
