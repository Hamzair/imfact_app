import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../const/color.dart';
import '../../const/image_assets.dart';
import '../../controller/on_boarding.dart';
import '../../widgets/custom_text.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final OnBoardingController boardingVM = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: boardingVM.pageController,
        children: const <Widget>[
          OnBoardingOne(),
          OnBoardingTwo(),
        ],
      ),
    );
  }
}

class OnBoardingOne extends StatelessWidget {
  const OnBoardingOne({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardingController boardingVM = Get.find<OnBoardingController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 483.h,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    AppImages.onboarding,
                  ),
                  fit: BoxFit.cover)),
        ),
        SizedBox(
          height: 32.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InterCustomText(
                textColor: primaryColor,
                fontsize: 26.sp,
                text: 'Top Local Influencer\nat one place',
                fontWeight: FontWeight.w700,
              ),
              SizedBox(
                height: 15.h,
              ),
              InterCustomText(
                textColor: Color(0xff3B3B3B),
                fontsize: 15.sp,
                text:
                    'Welcome to joining the leading marketplace for discovering brand campaigns and sponsored collaborations.',
                fontWeight: FontWeight.w400,
              ),
              SizedBox(
                height: 52.h,
              ),
              GestureDetector(
                onTap: () => boardingVM.nextPage(),
                child: Container(
                    width: 310.w,
                    height: 53.h,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(13.r)),
                    child: Center(
                      child: InterCustomText(
                        textColor: whiteColor,
                        fontsize: 16.sp,
                        text: 'Get started',
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class OnBoardingTwo extends StatelessWidget {
  const OnBoardingTwo({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardingController boardingVM = Get.find<OnBoardingController>();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22.w),
      child: Column(
        children: [
          SizedBox(height: 58.h,),
          InterCustomText(
            textAlign: TextAlign.center,
            textColor: primaryColor,
            fontsize: 22.sp,
            text: 'Please select one of the following user type options',
            fontWeight: FontWeight.w700,
          ),
          SizedBox(
            height: 99.h,
          ),
          InterCustomText(
            textAlign: TextAlign.start,
            textColor: const Color(0xff3A3838),
            fontsize: 16.sp,
            text: 'Do you want to  promote your products, services through influencers?',
            fontWeight: FontWeight.w400,
          ),
          SizedBox(
            height: 40.h,
          ),

        ],
      ),
    );
  }
}
