// ignore: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar(BuildContext context, String label) {
  return AppBar(
    title: Text(label, style: Theme.of(context).textTheme.titleLarge),
    elevation: 0,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: Colors.grey.withOpacity(0.2),
      ),
    ),
  );
}

Widget buildThirdpartyLogin(BuildContext context) {
  return Container(
      margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
      height: 40.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _reusableIcons('google_icon'),
          _reusableIcons('apple_icon'),
          _reusableIcons('facebook_icon'),
        ],
      ));
}

// ignore: unused_element
Widget _reusableIcons(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      width: 30.w,
      height: 30.w,
      child: Image.asset(
        "assets/loginIcons/$iconName.png",
        fit: BoxFit.contain,
      ),
    ),
  );
}

Widget reusableText(String text, BuildContext context) {
  return Container(
    margin: EdgeInsets.only(
      bottom: 5.h,
    ),
    child: Text(
      text,
      style: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(color: Colors.grey.withOpacity(.5)),
    ),
  );
}
