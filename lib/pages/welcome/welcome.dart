// ignore_for_file: avoid_print, camel_case_types, duplicate_ignore

import 'package:course_selling_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:course_selling_app/pages/welcome/bloc/welcome_events.dart';
import 'package:course_selling_app/pages/welcome/bloc/welcome_states.dart';
import 'package:course_selling_app/utils/helper_widgets.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class welcomePage extends StatefulWidget {
  const welcomePage({super.key});

  @override
  State<welcomePage> createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 35.h),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return SizedBox(
              width: 375.w,
              child: Stack(alignment: Alignment.topCenter, children: [
                PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    state.page = index;
                    BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());

                    print("current index = {$index}");
                  },
                  children: [
                    _page(
                        1,
                        context,
                        'Next',
                        'Future is Here',
                        'Build your portfolio with Our Plaftform',
                        'assets/onboarding/ob_1.png'),
                    _page(
                        2,
                        context,
                        'Next',
                        'Learn anything',
                        'begin your Journey of greate learning from Learners',
                        'assets/onboarding/ob_2.png'),
                    _page(
                        3,
                        context,
                        'GetStarted',
                        'Online and anytime',
                        '24X7 lecture learn what ever you want',
                        'assets/onboarding/ob_3.png'),
                  ],
                ),
                Positioned(
                  bottom: 100.h,
                  child: DotsIndicator(
                    position: state.page,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                        color: Colors.grey,
                        activeColor: Colors.orange.shade900,
                        size: const Size.fromRadius(8),
                        shape: const BeveledRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                          top: Radius.circular(12),
                          bottom: Radius.circular(12),
                        )),
                        activeSize: const Size.fromRadius(13),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                    dotsCount: 3,
                  ),
                )
              ]),
            );
          },
        ),
      ),
    );
  }

  Widget _page(
    int index,
    BuildContext context,
    String buttomname,
    String title,
    String subTitle,
    String imagePath,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 2,
          child: SizedBox(
            width: 345.w,
            // height: 345.w,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Text(title,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.black,
                          )),
                ),
                addVerticalSpace(4.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Text.rich(
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.black.withOpacity(.5),
                          ),
                      TextSpan(
                        text: subTitle,
                      )),
                ),
                addVerticalSpace(20.h),
              ],
            )),
        addVerticalSpace(10.h),
        ElevatedButton(
            onPressed: () {
              if (index < 3) {
                pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              } else {
                context.push('/signInScreen');
              }
            },
            style: Theme.of(context).elevatedButtonTheme.style,
            child: SizedBox(
              width: 200.w,
              child: Center(
                child: Text(
                  buttomname,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            )),
        addVerticalSpace(30.h)
      ],
    );
  }
}




