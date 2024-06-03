import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imfact_influencer_marketplace/const/image_assets.dart';

import '../../../const/color.dart';
import '../../../controller/selected_type_controller.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/forgot_password_back.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedTypeController = Get.put(SelectedTypeController());

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            const ForgetPasswordBackWidget(),
            SizedBox(
              height: 28.h,
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 14.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PretendardCustomText(
                    text: "Forgot password?",
                    textColor: primaryColor,
                    fontsize: 24.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  PretendardCustomText(
                    text: "Please choose a method to request a password reset.",
                    textColor: Color(0xff6B7280),
                    fontsize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      selectedTypeController.changeSelectedType('email');
                    },
                    child: Obx(() => Container(
                          height: 74.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: selectedTypeController.selectedType.value ==
                                    'email'
                                ? primaryColor.withOpacity(0.3)
                                : greyColor.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(10.sp),
                            border: Border.all(
                                color:
                                    selectedTypeController.selectedType.value ==
                                            'email'
                                        ? primaryColor
                                        : greyColor.withOpacity(0.3),
                                width: 2),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 15.w,),
                              Container(
                                height: 37.h,
                                width: 37.w,
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(6.sp)),
                                child: Center(
                                  child: Image.asset(
                                    scale: 3,
                                    AppImages.emailIcon,
                                    color: selectedTypeController
                                                .selectedType.value ==
                                            'email'
                                        ? primaryColor
                                        : greyColor,
                                  ),
                                ),
                              ),
                              SizedBox(width: 15.w,),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  PretendardCustomText(
                                    text: "Your email",
                                    textColor: Color(0xff111827),
                                    fontsize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  PretendardCustomText(
                                    text: "Enter your email",
                                    textColor: Color(0xff6B7280),
                                    fontsize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: greyColor,
                              ),
                            ],
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 11.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      selectedTypeController.changeSelectedType('phone');
                    },
                    child: Obx(() => Container(
                          height: 74.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: selectedTypeController.selectedType.value ==
                                    'phone'
                                ? primaryColor.withOpacity(0.3)
                                : greyColor.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(10.sp),
                            border: Border.all(
                                color:
                                    selectedTypeController.selectedType.value ==
                                            'phone'
                                        ? primaryColor
                                        : greyColor.withOpacity(0.3),
                                width: 2),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 15.w,),

                              Container(
                                height: 37.h,
                                width: 37.w,
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(6.sp)),
                                child: Center(
                                  child: Image.asset(
                                    scale: 3,
                                    AppImages.passwordIcon,
                                    color: selectedTypeController
                                                .selectedType.value ==
                                            'phone'
                                        ? primaryColor
                                        : greyColor,
                                  ),
                                ),
                              ),
                              SizedBox(width: 15.w,),
                              
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  PretendardCustomText(
                                    text: "Phone number",
                                    textColor: Color(0xff111827),
                                    fontsize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  PretendardCustomText(
                                    text: "Enter your phone number",
                                    textColor: Color(0xff6B7280),
                                    fontsize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: greyColor,
                              ),
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     PretendardCustomText(text: "Don't have an account?"),
            //
            //     PretendardCustomText(text: "Sign Up",textColor: primaryColor,),
            //   ],
            // ),
          ],
        ),
      )),
    );
  }
}
