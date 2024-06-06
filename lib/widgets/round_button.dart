import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/color.dart';

class RoundButton extends StatelessWidget {
  String title;
  final VoidCallback onTap;
  final bool loading;
  double? width;
  double? textSize;
  double? radius;
  double? height;
  Color? color;
  Color? titleColor;
  RoundButton(
      {super.key,
        required this.title,
        required this.onTap,
        this.loading = false,
        this.width,
        this.height,
        this.radius,
        this.textSize,
        this.color,
        this.titleColor});
  // final _controller=Get.put(BackendController());
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          height: height ?? 6.h,
          width: width,

          decoration: BoxDecoration(
            color: color ?? primaryColor,

            borderRadius: BorderRadius.circular(radius ?? 13.sp),
            // border: Border.all(
            //   color: primaryColor,
            //   width: 1
            // )
          ),
          child: Center(
            child: loading == true
                ? Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(
                color: whiteColor,
              ),
            )
                : Text(
              title,
              style: TextStyle(
                  color: titleColor ?? whiteColor,
                  fontFamily: 'Pretendard',
                  fontSize: textSize,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ));
  }
}