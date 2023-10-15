import 'package:course_selling_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:course_selling_app/pages/welcome/bloc/welcome_states.dart';
import 'package:course_selling_app/utils/helper_widgets.dart';
import 'package:course_selling_app/widgetzs/dot_indicator_widget.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class welcomePage extends StatefulWidget {
  const welcomePage({super.key});

  @override
  State<welcomePage> createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 35.h),
      child: Scaffold(
        appBar: AppBar(),
        body: SizedBox(
          width: 375.w,
          child: Stack(children: [
            PageView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        width: 345.w,
                        // height: 345.w,
                        child: Center(
                          child: Text(
                            'Welcome',
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
                              child: Text('description text',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                        color: Colors.black,
                                      )),
                            ),
                            addVerticalSpace(4.h),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 30.w),
                              child: Text(
                                  'lorem ipsum dolor sit amet, consectetur  ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: Colors.black.withOpacity(.5),
                                      )),
                            ),
                            addVerticalSpace(20.h),
                          ],
                        )),
                    DotsIndicator(
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                          color: Colors.grey,
                          activeColor: Colors.orange.shade900,
                          size: const Size.fromRadius(8),
                          shape: const BeveledRectangleBorder(
                              borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(12),
                            right: Radius.circular(12),
                          )),
                          activeSize: const Size.square(16),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16))),
                      dotsCount: 3,
                    ),
                    addVerticalSpace(10.h),
                    ElevatedButton(
                        onPressed: () {},
                        style: Theme.of(context).elevatedButtonTheme.style,
                        child: SizedBox(
                          width: 200.w,
                          child: Center(
                            child: Text('next',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      color: Colors.white,
                                    )),
                          ),
                        )),
                    addVerticalSpace(30.h)
                  ],
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

// class OnboardingView extends StatefulWidget {
//   const OnboardingView({super.key});

//   @override
//   State<OnboardingView> createState() => _OnboardingViewState();
// }

// class _OnboardingViewState extends State<OnboardingView> {
//   late PageController _pageController;
//   int _pageindex = 0;

//   @override
//   void initState() {
//     _pageController = PageController(initialPage: 0);

//     super.initState();
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//       ),
//       body: SafeArea(
//         child:
//             BlocBuilder<WelcomeBloc, WelcomeState>(builder: (context, state) {
//           return Center(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Flexible(
//                   fit: FlexFit.tight,
//                   child: PageView.builder(
//                     itemCount: onBoardingData.length,
//                     controller: _pageController,
//                     onPageChanged: (index) {
//                       state.page = index;
//                       setState(() {
//                         _pageindex = index;
//                       });
//                     },
//                     itemBuilder: (context, index) => OnboardContent(
//                       image: onBoardingData[index].image,
//                       title: onBoardingData[index].title,
//                       description: onBoardingData[index].description,
//                     ),
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     ...List.generate(
//                       onBoardingData.length,
//                       (index) => Padding(
//                         padding: const EdgeInsets.only(right: 4),
//                         child: Flexible(
//                           fit: FlexFit.tight,
//                           child: DotIndicator(
//                             isActive: index == state.page,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 addVerticalSpace(50.h),
//                 ElevatedButton(
//                   onPressed: () {
//                     _pageController.nextPage(
//                       duration: const Duration(milliseconds: 400),
//                       curve: Curves.ease,
//                     );
//                     if (_pageindex == onBoardingData.length - 1) {
//                       // context.push('/loginScreen');
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.transparent,
//                     shape: const CircleBorder(),
//                     side: const BorderSide(
//                       width: 2,
//                       color: Color(0xff201A18),
//                     ),
//                   ),
//                   child: const Icon(
//                     Icons.navigate_next,
//                     color: Colors.black45,
//                   ),
//                 ),
//                 // addVerticalSpace(80.h),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Visibility(
//                       maintainSize: true,
//                       maintainState: true,
//                       maintainAnimation: true,
//                       visible: _pageindex != onBoardingData.length - 1,
//                       child: TextButton(
//                         onPressed: () {
//                           print(onBoardingData.length);
//                           print("Tapped");
//                           // context.push('/loginScreen');
//                         },
//                         style: ButtonStyle(
//                           backgroundColor: MaterialStateProperty.all<Color>(
//                               Colors.transparent),
//                         ),
//                         child: const Text(
//                           'Skip',
//                           style: TextStyle(fontSize: 18),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }

// class Onboard {
//   Onboard({
//     required this.image,
//     required this.title,
//     required this.description,
//   });
//   final String image;
//   final String title;
//   final String description;
// }

// final List<Onboard> onBoardingData = [
//   Onboard(
//     image: 'assets/onboarding/ob_1.png',
//     title: 'Online University',
//     description:
//         '''We make it simple to find the food you crave. \n Enter your address and let us do the rest.''',
//   ),
//   Onboard(
//     image: 'assets/onboarding/ob_2.png',
//     title: 'Home Learning',
//     description:
//         '''When you order eat street, we’ll hook you up with exclusive coupons, specials rewards.''',
//   ),
//   Onboard(
//     image: 'assets/onboarding/ob_3.png',
//     title: 'Distance Learning',
//     description:
//         '''We make food ordering fast, simple and free no matter if you order online or cash.''',
//   ),
// ];

// class OnboardContent extends StatelessWidget {
//   const OnboardContent({
//     required this.image,
//     required this.title,
//     required this.description,
//     super.key,
//   });

//   final String image, title, description;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         children: [
//           const Spacer(),
//           Image.asset(
//             image,
//             height: 260,
//           ),
//           const Spacer(),
//           Text(
//             title,
//             style: Theme.of(context)
//                 .textTheme
//                 .headlineLarge
//                 ?.copyWith(fontWeight: FontWeight.bold),
//           ),
//           const Spacer(),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 12),
//             child: Text(
//               description,
//               style: Theme.of(context)
//                   .textTheme
//                   .bodyLarge
//                   ?.copyWith(color: Colors.grey),
//               textAlign: TextAlign.center,
//             ),
//           ),
//           const Spacer(),
//         ],
//       ),
//     );
//   }
// }
