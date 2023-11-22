import 'package:course_selling_app/pages/register/register.dart';
import 'package:course_selling_app/pages/signIn/sign_in.dart';
import 'package:course_selling_app/pages/exceptions/error_screens/error_screen.dart';
import 'package:course_selling_app/pages/splashScreen/splashScreen.dart';
import 'package:course_selling_app/pages/welcome/welcome.dart';
import 'package:course_selling_app/utils/app_route_transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  errorBuilder: (context, state) => ErrorScreen(error: state.error),
  routes: <RouteBase>[
    GoRoute(
      routes: <RouteBase>[
        GoRoute(
          path: 'welcomeScreen',
          builder: (BuildContext context, GoRouterState state) =>
              const welcomePage(),
          pageBuilder: (context, state) =>
              RouterTransitionFactory.getTransitionPage(
            context: context,
            state: state,
            child: const welcomePage(),
            type: 'slide_right', // slide_right|slide_left|bottom_top|fade
          ),
        ),
        GoRoute(
          path: 'signInScreen',
          builder: (BuildContext context, GoRouterState state) =>
              const SignInPageForm(),
          pageBuilder: (context, state) =>
              RouterTransitionFactory.getTransitionPage(
            context: context,
            state: state,
            child: const SignInPageForm(),
            type: 'slide_right', // slide_right|slide_left|bottom_top|fade
          ),
        ),
        GoRoute(
          path: 'registerScreen',
          builder: (BuildContext context, GoRouterState state) =>
              const RegisterPage(),
          pageBuilder: (context, state) =>
              RouterTransitionFactory.getTransitionPage(
            context: context,
            state: state,
            child: const RegisterPage(),
            type: 'bottom_top', // slide_right|slide_left|bottom_top|fade
          ),
        ),
        // GoRoute(
        //   path: 'locationAccess',
        //   builder: (BuildContext context, GoRouterState state) =>
        //       const LocationView(),
        //   pageBuilder: (context, state) =>
        //       RouterTransitionFactory.getTransitionPage(
        //     context: context,
        //     state: state,
        //     child: const LocationView(),
        //     type: 'bottom_top', // slide_right|slide_left|bottom_top|fade
        //   ),
        // ),
        // GoRoute(
        //   path: 'manualLocation',
        //   builder: (BuildContext context, GoRouterState state) =>
        //       const ManualAddressScreen(),
        //   pageBuilder: (context, state) =>
        //       RouterTransitionFactory.getTransitionPage(
        //     context: context,
        //     state: state,
        //     child: const ManualAddressScreen(),
        //     type: 'slide_right', // slide_right|slide_left|bottom_top|fade
        //   ),
        // ),
      ],
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
  ],
);
