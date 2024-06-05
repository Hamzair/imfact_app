import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imfact_influencer_marketplace/const/color.dart';
import 'package:imfact_influencer_marketplace/const/text_styles.dart';


class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color textColor;
  final double width;
  final double height;
  final double borderRadius;
  final String fontFamily;


  const CustomButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.buttonColor = primaryColor,
    this.textColor = Colors.black,
    this.width = double.infinity,
    this.height = 54,
    this.borderRadius = 10,
    this.fontFamily = "inter",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: pretendardWithColor(whiteColor ,16.sp),
      ),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width, height),
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}




