import 'package:course_selling_app/pages/register/bloc/register_bloc.dart';
import 'package:course_selling_app/pages/register/bloc/register_event.dart';
import 'package:course_selling_app/pages/register/bloc/register_state.dart';
import 'package:course_selling_app/pages/register/register_controller.dart';

import 'package:course_selling_app/pages/signIn/widgets/signIn_widget.dart';
import 'package:course_selling_app/utils/helper_widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  bool _passwordVisible = false;
  late String _password;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBlocs, SignUpStates>(builder: (context, state) {
      return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SafeArea(
          child: Scaffold(
              appBar: buildAppBar(context, 'Register'),
              body: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child:
                            reusableText('Sign up and start learning', context),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 36.h),
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Username',
                              overflow: TextOverflow.fade,
                              textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            addVerticalSpace(5.h),
                            TextFormField(
                              onChanged: (value) {
                                context
                                    .read<SignUpBlocs>()
                                    .add(UserNameEvent(value));
                              },
                              inputFormatters: <TextInputFormatter>[
                                LengthLimitingTextInputFormatter(15),
                              ],
                              decoration: const InputDecoration()
                                  .applyDefaults(
                                      Theme.of(context).inputDecorationTheme)
                                  .copyWith(hintText: 'floyd123'),
                            ),
                            addVerticalSpace(10.h),
                            Text('Email',
                                overflow: TextOverflow.fade,
                                textAlign: TextAlign.start,
                                style: Theme.of(context).textTheme.titleSmall),
                            addVerticalSpace(5.h),
                            TextFormField(
                              onChanged: (value) {
                                context
                                    .read<SignUpBlocs>()
                                    .add(RegisterEmailEvent(value));
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
                            ),
                            addVerticalSpace(10.h),
                            Text('Password',
                                overflow: TextOverflow.fade,
                                textAlign: TextAlign.start,
                                style: Theme.of(context).textTheme.titleSmall),
                            addVerticalSpace(5.h),
                            TextFormField(
                              obscureText: !_passwordVisible,
                              validator: (value) {
                                String pattern =
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                                RegExp regExp = RegExp(pattern.toString());

                                if (value!.isEmpty) {
                                  return "Password is required";
                                } else if (value.length < 8) {
                                  return "Password Must be more than 8 characters";
                                } else if (!regExp.hasMatch(value)) {
                                  return '''Password should contain upper,lower,digit'''
                                      ''' and Special character ''';
                                } else {
                                  return null;
                                }

                                // if (!regExp.hasMatch(value!)) {
                                //   return 'Name must be more than 2 charater';
                                // } else if (value.isNotEmpty || value.length < 8) {
                                //   return 'Password length must be more than 8 characters';
                                // } else {
                                //   return null;
                                // }
                              },
                              onChanged: (value) {
                                context
                                    .read<SignUpBlocs>()
                                    .add(RegisterPasswordEvent(value));
                              },
                              onSaved: (val) {
                                _password = val!;
                                print(_password);
                              },
                              inputFormatters: <TextInputFormatter>[
                                // FilteringTextInputFormatter.allow(RegExp('[0-9a-zA-Z]')),
                                LengthLimitingTextInputFormatter(20),
                              ],
                              decoration: const InputDecoration()
                                  .applyDefaults(
                                    Theme.of(context).inputDecorationTheme,
                                  )
                                  .copyWith(
                                      hintText: 'Eg.- Learning@247 ',
                                      // labelText: 'Password',
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _passwordVisible =
                                                  !_passwordVisible;
                                            });
                                          },
                                          icon: Icon(
                                            _passwordVisible
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ))),
                              keyboardType: TextInputType.text,
                            ),
                            addVerticalSpace(10.h),
                            Text('Confirm Password',
                                overflow: TextOverflow.fade,
                                textAlign: TextAlign.start,
                                style: Theme.of(context).textTheme.titleSmall),
                            addVerticalSpace(5.h),
                            TextFormField(
                              obscureText: true,
                              validator: (value) {
                                if (value != _password) {
                                  return "Password Does Not Match";
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (value) {
                                context
                                    .read<SignUpBlocs>()
                                    .add(RepasswordEvent(value));
                              },
                              inputFormatters: <TextInputFormatter>[
                                // FilteringTextInputFormatter.allow(RegExp('[0-9a-zA-Z]')),
                                LengthLimitingTextInputFormatter(20),
                              ],
                              decoration: const InputDecoration()
                                  .applyDefaults(
                                    Theme.of(context).inputDecorationTheme,
                                  )
                                  .copyWith(hintText: 'Confirm Your Password'),
                            ),
                            addVerticalSpace(20.h),
                            const Text.rich(TextSpan(
                                text: 'By signingup. you agree to our ',
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: 'Terms of use',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: ' and',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  TextSpan(
                                    text: ' Privacy Policy',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ])),
                            addVerticalSpace(20.h),
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  
                                  SignUpController(context:context).handleEmailSignup();
                                },
                                style: ButtonStyle(
                                  fixedSize: MaterialStateProperty.all<Size>(
                                    Size(MediaQuery.sizeOf(context).width * .60,
                                        56),
                                  ),
                                ),
                                child: Text(
                                  'SignUp',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                          color: Colors.white, fontSize: 16),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ]),
              )),
        ),
      );
    });
  }
}


