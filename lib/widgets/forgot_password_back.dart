import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/color.dart';
import 'custom_text.dart';

class ForgetPasswordBackWidget extends StatelessWidget {
  const ForgetPasswordBackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              children: [

                PretendardCustomText(
                  text: "  Back",
                  textColor: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontsize: 20.sp,
                )
              ],
            ),
          ),
        ),

        Container(
          height: 0.4.h,
          width: double.infinity,
          color: Colors.grey.withOpacity(0.2),
        )
      ],
    );
  }
}