import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pinput/pinput.dart';

import '../../../const/color.dart';
import '../../../const/image_assets.dart';
import '../../../controller/auth_controller.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_textfield.dart';
import '../../../widgets/round_button.dart';
import 'package:pinput/pinput.dart' as pin;

class EmailVerify extends StatefulWidget {
  const EmailVerify({super.key});

  @override
  State<EmailVerify> createState() => _EmailVerifyState();
}

class _EmailVerifyState extends State<EmailVerify> {
  final verifyController = TextEditingController();

  AuthController authController = Get.put(AuthController());
  final emailController = TextEditingController();

  GlobalKey<FormState> formValidKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PretendardCustomText(
                  text: "Verify Your Email",
                  textColor: primaryColor,
                  fontWeight: FontWeight.w700,
                  fontsize: 24.sp,
                ),
                SizedBox(
                  height: 10.h,
                ),
                PretendardCustomText(
                  text: "Please enter a email address for verification",
                  fontsize: 12.sp,
                  fontWeight: FontWeight.w400,
                  textColor: greyColor,
                ),
                SizedBox(
                  height: 62.h,
                ),
                CustomTextFiled(
                  onChange: (v) {
                    authController.update();
                    authController.refresh();
                  },
                  readOnly: authController.fromLogin.value ?? false,
                  controller: emailController,
                  hintText: 'Your email',
                  hintColor: Colors.grey,
                  hintTextSize: 11.sp,
                  prefixIcon: AppImages.emailIcon,
                  isBorder: true,
                  borderRadius: 13.sp,
                  fillColor: Colors.transparent,
                ),
                SizedBox(
                  height: 62.h,
                ),
                RoundButton(height: 51.h, title: "Send", onTap: () {}),
                SizedBox(
                  height: 12.h,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
