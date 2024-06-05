import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imfact_influencer_marketplace/View/on_boarding/select_user_type.dart';
import 'package:imfact_influencer_marketplace/const/color.dart';
import 'package:imfact_influencer_marketplace/const/image_assets.dart';
import 'package:imfact_influencer_marketplace/widgets/custom_button.dart';
import 'package:imfact_influencer_marketplace/widgets/custom_text.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 483.h,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: Colors.white,
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
                    PretendardCustomText(
                      textColor: primaryColor,
                      fontsize: 26.sp,
                      text: 'Top Local Influencer\nat one place',
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    PretendardCustomText(
                      textColor: Color(0xff3B3B3B),
                      fontsize: 15.sp,
                      text:
                          'Welcome to joining the leading marketplace for discovering brand campaigns and sponsored collaborations.',
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(
                      height: 34.h,
                    ),

                    CustomButton(
                      width: 310.w,
                      height: 53.h,
                      borderRadius: 13.r,
                      buttonText: 'Get started',
                      onPressed: () {
                        Get.to(() => SelectUserType());
                      },
                    ),
                    // GestureDetector(
                    //   onTap: () => boardingVM.nextPage(),
                    //   child: Container(
                    //       width: 310.w,
                    //       height: 53.h,
                    //       decoration: BoxDecoration(
                    //           color: primaryColor,
                    //           borderRadius: BorderRadius.circular(13.r)),
                    //       child: Center(
                    //         child: PretendardCustomText(
                    //           textColor: whiteColor,
                    //           fontsize: 16.sp,
                    //           text: 'Get started',
                    //           fontWeight: FontWeight.w500,
                    //         ),
                    //       )),
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
