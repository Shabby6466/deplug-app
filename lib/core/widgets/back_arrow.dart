import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackArrow extends StatelessWidget {
  final VoidCallback action;
  final Color? iconColor;

  const BackArrow({super.key, required this.action, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: action,
      child: Container(
        height: 60.h,
        width: 50.h,
        alignment: Alignment.centerLeft,
        child: Icon(Icons.arrow_back, size: 20.w, color: iconColor),
      ),
    );
  }
}
