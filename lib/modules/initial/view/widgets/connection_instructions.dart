import 'package:deplug/core/services/l10n/gen_l10n/app_localizations.dart';
import 'package:deplug/core/utils/resource/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConnectionInstructions extends StatelessWidget {
  const ConnectionInstructions({super.key});

  @override
  Widget build(BuildContext context) {
    var tr = AppLocalizations.of(context);
    return Column(
      children: [
        SizedBox(height: 12.h),
        Row(
          children: [
            Text(
              '1. ',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: R.palette.disabledColor,
                    height: 24.sp / 14.sp,
                  ),
            ),
            Expanded(
              child: Text(
                tr.point1,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: R.palette.disabledColor,
                      letterSpacing: -.2,
                      height: 24.sp / 14.sp,
                    ),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '2. ',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: R.palette.disabledColor,
                    height: 24.sp / 14.sp,
                  ),
            ),
            Expanded(
              child: Text(
                tr.point2,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: R.palette.disabledColor,
                      letterSpacing: -.2,
                      height: 24.sp / 14.sp,
                    ),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '3. ',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: R.palette.disabledColor,
                    height: 24.sp / 14.sp,
                  ),
            ),
            Expanded(
              child: Text(
                tr.point3,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: R.palette.disabledColor,
                      letterSpacing: -.2,
                      height: 24.sp / 14.sp,
                    ),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '4. ',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: R.palette.disabledColor,
                    height: 24.sp / 14.sp,
                  ),
            ),
            Expanded(
              child: Text(
                tr.point4,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: R.palette.disabledColor,
                      letterSpacing: -.2,
                      height: 24.sp / 14.sp,
                    ),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '5. ',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: R.palette.disabledColor,
                    height: 24.sp / 14.sp,
                  ),
            ),
            Expanded(
              child: Text(
                tr.point5,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: R.palette.disabledColor,
                      letterSpacing: -.2,
                      height: 24.sp / 14.sp,
                    ),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '6. ',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: R.palette.disabledColor,
                    height: 24.sp / 14.sp,
                  ),
            ),
            Expanded(
              child: Text(
                tr.point6,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: R.palette.disabledColor,
                      letterSpacing: -.2,
                      height: 24.sp / 14.sp,
                    ),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '7. ',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: R.palette.disabledColor,
                    height: 24.sp / 14.sp,
                  ),
            ),
            Expanded(
              child: Text(
                tr.point7,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: R.palette.disabledColor,
                      letterSpacing: -.2,
                      height: 24.sp / 14.sp,
                    ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
