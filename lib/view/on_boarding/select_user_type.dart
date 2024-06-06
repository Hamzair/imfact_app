
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imfact_influencer_marketplace/View/Auth/login_view.dart';
import 'package:imfact_influencer_marketplace/const/color.dart';
import 'package:imfact_influencer_marketplace/const/image_assets.dart';
import 'package:imfact_influencer_marketplace/widgets/custom_text.dart';

class SelectUserType extends StatelessWidget {
  const SelectUserType({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(

      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                alignment: Alignment.topRight,
                child: Image.asset(
                  AppImages.onboardingvector,
                  height: 224,
                )),
            Center(
              child: PretendardCustomText(
                textAlign: TextAlign.center,
                textColor: primaryColor,
                fontsize: 22.sp,
                text: 'Please select one of the\nfollowing user type options',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 99.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: Column(
                children: [
                  PretendardCustomText(
                    textAlign: TextAlign.start,
                    textColor: const Color(0xff3A3838),
                    fontsize: 16.sp,
                    text:
                    'Do you want to  promote your products, services through influencers?',
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => LoginView());
                    },
                    child: Row(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: 280.w,
                              height: 36.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  gradient: LinearGradient(
                                      colors: [Color(0xff02CBC4), Color(0xff01CBA7)],
                                      begin: Alignment.topRight,
                                      end: Alignment.topLeft)),
                              child: Padding(
                                padding: EdgeInsets.only(left: 12.w, top: 8.h),
                                child: PretendardCustomText(
                                  text: 'Customer',
                                  textColor: whiteColor,
                                  fontWeight: FontWeight.w500,
                                  fontsize: 16.sp,
                                ),
                              ),
                            ),
                            Positioned(
                              right: -30,
                              top: -16,
                              child: Container(
                                // color: Colors.red,
                                child: Image.asset(
                                  fit: BoxFit.fill,
                                  AppImages.onboardingbutton,
                                  height: 69.h,
                                  width: 64.w,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: Column(
                children: [
                  PretendardCustomText(
                    textAlign: TextAlign.start,
                    textColor: const Color(0xff3A3838),
                    fontsize: 16.sp,
                    text:
                    'Do you want to make economic profits by introducing advertisers’ products?',
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 280.w,
                            height: 36.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                gradient: LinearGradient(
                                    colors: [Color(0xff02CBC4), Color(0xff01CBA7)],
                                    begin: Alignment.topRight,
                                    end: Alignment.topLeft)),
                            child: Padding(
                              padding: EdgeInsets.only(left: 12.w, top: 8.h),
                              child: PretendardCustomText(
                                text: 'Creator',
                                textColor: whiteColor,
                                fontWeight: FontWeight.w500,
                                fontsize: 16.sp,
                              ),
                            ),
                          ),
                          Positioned(
                            right: -30,
                            top: -16,
                            child: Container(
                              // color: Colors.red,
                              child: Image.asset(
                                fit: BoxFit.fill,
                                AppImages.onboardingbutton,
                                height: 69.h,
                                width: 64.w,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
                alignment: Alignment.bottomLeft,
                height: 120.h,
                width: 151.w,

                // color: Colors.pink,
                child: Image.asset(
                  // fit: BoxFit.contain,
                  AppImages.onboardingvector2,
                )),
          ],
        ),
      ),
    );
  }
}