
import 'package:course_selling_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
  });
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      height: isActive ? 24 : 8,
      width: 8,
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.primary60
            : AppColors.primary60.withOpacity(0.5),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}
