import 'dart:async';

import 'package:course_selling_app/pages/register/bloc/register_bloc.dart';
import 'package:course_selling_app/widgets/flutter_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpController {
  final BuildContext context;
  const SignUpController({required this.context});

  Future<void> handleEmailSignup() async {
    final state = context.read<SignUpBlocs>().state;
    String userName = state.username;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      if (kDebugMode) {
        print('user name cannot be empty');
      }
      toastinfo(msg: 'user name cannot be empty');
      return;
    }
    if (email.isEmpty) {
      if (kDebugMode) {
        print('email cant be empty');
      }
      toastinfo(msg: 'email cannot be empty');
      return;
    }
    if (password.isEmpty) {
      if (kDebugMode) {
        print("password cannot be empty");
      }
      toastinfo(msg: 'password cannot be empty');
      return;
    }
    if (rePassword.isEmpty) {
      if (kDebugMode) {
        print('Confirm your password');
      }
      toastinfo(msg: 'Confirm Your Password');
      return;
    }
    if (password != rePassword) {
      if (kDebugMode) {
        print('passwords do not match ');
      }
      toastinfo(msg: 'Passwords do not match ');
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        if (kDebugMode) {
          print(
              "verification mail has been send to ${credential.user?.email} ");
        }
        toastinfo(
            msg:
                'verification mail has been send to ${credential.user?.email}');
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        if (kDebugMode) {
          print("provided password is too weak-password");
        }
        toastinfo(msg: 'provided password is too weak-password');
      } else if (e.code == 'email-already-in-use') {
        if (kDebugMode) {
          print('email is already in use ');
        }
        toastinfo(msg: 'email is already in use ');
      } else if (e.code == 'invalid-email') {
        if (kDebugMode) {
          print('provided mail is invalid');
        }
        toastinfo(msg: 'provide mail is invalid ');
      }
    }
  }
}
