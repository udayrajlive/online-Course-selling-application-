
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



/// go_route custom transitions ;
class RouterTransitionFactory {
  // slide_right|slide_left|bottom_top|fade
  static CustomTransitionPage<dynamic> getTransitionPage(
      {required BuildContext context,
        required GoRouterState state,
        required Widget child,
        required String type,}) {
    return CustomTransitionPage(
        key: state.pageKey,
        child: child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          switch (type) {
            case 'slide_right':
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).animate(CurvedAnimation(parent: animation, curve: Curves.fastLinearToSlowEaseIn)),
                child: child,
              );
            case 'slide_left':
              return  SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(-1, 0),
                  end: Offset.zero,
                ).animate(CurvedAnimation(parent: animation, curve: Curves.fastLinearToSlowEaseIn)),
                child: child,
              );
            case 'bottom_top':
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).animate(CurvedAnimation(parent: animation, curve: Curves.fastLinearToSlowEaseIn)),
                child: child,
              );
            case 'fade':
              return  FadeTransition(
                opacity: animation,
                child: child,
              );
            default:
              return FadeTransition(opacity: animation, child: child);
          }
        },);
  }
}


/// material page custom route transitions;
class SlideRightRoute extends PageRouteBuilder<dynamic> {
  SlideRightRoute({required this.page})
      : super(
    transitionDuration: const Duration(milliseconds: 1000),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(CurvedAnimation(parent: animation, curve: Curves.fastLinearToSlowEaseIn)),
            child: child,
          ),
        );
  final Widget page;
}
class SlideLeftRoute extends PageRouteBuilder<dynamic> {
  SlideLeftRoute({required this.page})
      : super(
    transitionDuration: const Duration(milliseconds: 1000),
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: animation, curve: Curves.fastLinearToSlowEaseIn)),
          child: child,
        ),
  );
  final Widget page;
}

class SlideBottomToTopRoute extends PageRouteBuilder<dynamic> {
  SlideBottomToTopRoute({required this.page})
      : super(
    transitionDuration: const Duration(milliseconds: 1000),
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: animation, curve: Curves.fastLinearToSlowEaseIn)),
          child: child,
        ),
  );
  final Widget page;
}


class FadeRoute extends PageRouteBuilder<dynamic> {
  FadeRoute({required this.page})
      : super(
    transitionDuration: const Duration(milliseconds:500),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
  final Widget page;
}
