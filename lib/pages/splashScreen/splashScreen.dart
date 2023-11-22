// ignore_for_file: file_names

import 'dart:async';

import 'package:course_selling_app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rive/rive.dart';

import '../../utils/helper_widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late RiveAnimationController<dynamic> _controller;
  @override
  void initState() {
    super.initState();
    _controller = SimpleAnimation('play');
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Timer(const Duration(milliseconds: 5000), () {
        context.push('/welcomeScreen');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _controller.isActive;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: const RiveAnimation.asset(
                  tLoadingAnimation,
                  fit: BoxFit.cover,
                ),
              ),
              addVerticalSpace(2),
            ],
          ),
        ),
      ),
    );
  }
}
