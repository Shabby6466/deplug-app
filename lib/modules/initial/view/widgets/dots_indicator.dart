import 'package:deplug/core/utils/resource/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DotsIndicator extends StatelessWidget {
  final int currentPage;
  final int pageCount;

  const DotsIndicator(
      {required this.currentPage, required this.pageCount, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pageCount,
        (index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            width: currentPage == index ? 38.w : 12.w,
            height: 8.h,
            decoration: BoxDecoration(
              color: currentPage == index
                  ? Theme.of(context).colorScheme.primary
                  : R.palette.sliderbtnColor,
            ),
          );
        },
      ),
    );
  }
}
