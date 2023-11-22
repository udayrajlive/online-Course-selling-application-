import 'package:course_selling_app/pages/signIn/bloc/sign_in_bloc.dart';
import 'package:course_selling_app/widgets/flutter_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController {
  final BuildContext context;
  SignInController({required this.context});
  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        String emailaddress = state.email;
        String password = state.password;
        if (emailaddress.isEmpty) {
          toastinfo(msg: "email cannot be empty");
          if (kDebugMode) {
            print("email address is empty");
          }
        } else if (password.isEmpty) {
          toastinfo(msg: "password cannot be empty");
          if (kDebugMode) {
            print("email is $emailaddress");
          }
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailaddress, password: password);
          final user = credential.user;

          if (user != null) {
            if (!user.emailVerified) {
              toastinfo(msg: "User not verified", timesection: 3);
              toastinfo(msg: "Welcome ${user.email}", timesection: 2);
              if (kDebugMode) {
                print("User not verified");
              }
              // Handle the case where the user is not verified, if needed.
            } else {
              toastinfo(msg: "Welcome ${user.email}", timesection: 2);
              if (kDebugMode) {
                print("User exists");
              }
              // User is successfully signed in.
            }
          } else {
            toastinfo(msg: "User does not exist", timesection: 1);
            if (kDebugMode) {
              print("User does not exist");
            }
            // Handle the case where the user does not exist, if needed.
          }
        } on FirebaseAuthException catch (e) {
          print("FirebaseAuthException: ${e.code} }");
          if (e.code == 'user-not-found') {
            toastinfo(msg: "No user found", timesection: 3);

            if (kDebugMode) {
              print("user not found for email");
            }
          } else if (e.code == 'wrong-password') {
            toastinfo(
                msg: 'Wrong password provided for that user', timesection: 3);
            if (kDebugMode) {
              print('Wrong password provided for that user');
            }
          } else if (e.code == 'invalid-email') {
            toastinfo(
                msg: 'please provide a valid email address ', timesection: 3);
            if (kDebugMode) {
              print('Invalid email format');
            }
          } else {
            toastinfo(msg: 'Invalid Login Credentials');
            if (kDebugMode) {
              print('');
            }
          }
        }
      }
    } catch (e) {}
  }
}
