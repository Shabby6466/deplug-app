import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingSlide extends StatelessWidget {
  final String title;
  final String description;

  const OnboardingSlide({required this.title, required this.description, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  height: 35.sp / 28.sp,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w600,
                ),
          ),
          SizedBox(height: 12.h),
          Text(
            description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  height: 20.h / 14.h,
                  fontSize: 14.sp,
                ),
          ),
          SizedBox(height: 25.h),
        ],
      ),
    );
  }
}
