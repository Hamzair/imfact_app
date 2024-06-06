import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:imfact_influencer_marketplace/View/Auth/signup_view/signup.dart';
import 'package:imfact_influencer_marketplace/View/bottom_nav_bar.dart';
import 'package:imfact_influencer_marketplace/const/image_assets.dart';
import 'package:imfact_influencer_marketplace/const/svg_assets.dart';

import '../../const/color.dart';
import '../../controller/auth_controller.dart';
import '../../widgets/custom_route.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/round_button.dart';
import 'forgot_password_view/forgot_password_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  AuthController _authController = Get.put(AuthController());
  bool isChecked = false;
  bool rememberPass = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 120.h),
            PretendardCustomText(
              text: "Login",
              textColor: primaryColor,
              fontWeight: FontWeight.w700,
              fontsize: 26.sp,
            ),
            SizedBox(height: 10.h),
            PretendardCustomText(
              text: "Welcome back! Please enter your details.",
              textColor: Color(0xff808B9A),
              fontWeight: FontWeight.w500,
              fontsize: 14.sp,
            ),
            SizedBox(height: 100.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.sp),
              child: Column(
                children: [
                  CustomTextFiled(
                    onChange: (v) {
                      _authController.update();
                      _authController.refresh();
                    },
                    readOnly: false,
                    controller: _authController.emailController.value,
                    hintText: 'Your email',
                    hintColor: Colors.grey,
                    hintTextSize: 11.sp,
                    prefixIcon: AppImages.emailIcon,
                    isBorder: true,
                    borderRadius: 13.sp,
                    fillColor: Colors.transparent,
                  ),
                  SizedBox(height: 27.h),
                  CustomTextFiled(
                    readOnly: false,
                    controller: _authController.passwordController.value,
                    hintText: 'Your password',
                    hintColor: Colors.grey,
                    hintTextSize: 11.sp,
                    onChange: (v) {
                      _authController.update();
                      _authController.refresh();
                    },
                    prefixIcon: AppImages.passwordIcon,
                    isBorder: true,
                    isPassword: true,
                    isObscure: isChecked,
                    passwordFunction: () {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                    borderRadius: 13.sp,
                    fillColor: Colors.transparent,
                    beforePasswordIcon: Icons.visibility_off_outlined,
                    afterPasswordIcon: Icons.visibility,
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          CustomRoute.navigateTo(
                              context, const ForgetPasswordView());
                        },
                        child: PretendardCustomText(
                          text: "Forgot password?",
                          textColor: primaryColor,
                          fontWeight: FontWeight.w500,
                          fontsize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25.h),
                  GetBuilder<AuthController>(builder: (_authController) {
                    return RoundButton(
                        color: _authController.emailController.value.text
                            .isNotEmpty &&
                            _authController.passwordController.value.text
                                .isNotEmpty ? primaryColor : greyColor,
                        textSize: 19.sp,
                        height: 51.h,
                        title: "Login",
                        onTap: () {

                          Get.to(() =>Navbar());
                        });
                  })

                ],
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PretendardCustomText(
                  text: "Don’t have an account?",
                  textColor: Color(0xff111827),
                  fontWeight: FontWeight.w400,
                  fontsize: 15.sp,
                ), GestureDetector(
                  onTap: () {
                    Get.to(SignUpView());
                  },
                  child: PretendardCustomText(
                    text: " Sign Up",
                    textColor: primaryColor,
                    fontWeight: FontWeight.w400,
                    fontsize: 15.sp,
                  ),
                ),
              ],),
            SizedBox(height: 36.h,)
          ],
        ),
      ),
    );
  }
}
