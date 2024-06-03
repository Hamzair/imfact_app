import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../const/color.dart';
import '../../const/image_assets.dart';
import '../../widgets/custom_text.dart';
import '../on_boarding/on_boarding_screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Get.to(OnBoarding());

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              AppImages.splash,
              height: 290.h,
              width: 290.w,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          PretendardCustomText(
            text: 'Imfact',
            textColor: redColor,
            fontWeight: FontWeight.w700,
            fontsize: 48.sp,
          )
        ],
      ),
    );
  }
}
