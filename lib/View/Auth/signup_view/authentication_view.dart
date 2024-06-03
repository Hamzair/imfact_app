import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pinput/pinput.dart';

import '../../../const/color.dart';
import '../../../controller/auth_controller.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/round_button.dart';
import 'package:pinput/pinput.dart' as pin;

import 'email_verify.dart';

class AuthenticationCodeView extends StatefulWidget {
  const AuthenticationCodeView({super.key});

  @override
  State<AuthenticationCodeView> createState() => _AuthenticationCodeViewState();
}

class _AuthenticationCodeViewState extends State<AuthenticationCodeView> {
  final verifyController = TextEditingController();

  AuthController authController = Get.put(AuthController());

  final defaultPinTheme = pin.PinTheme(
    width: 52,
    height: 46,
    // textStyle: GoogleFonts.poppins(
    //   fontSize: 14,
    //   color: Colors.red,
    //   fontWeight: FontWeight.w400,
    // ),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.withOpacity(0.1),
        boxShadow: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 24,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),
        ]),
  );

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
                  text: "Authentication Code",
                  textColor: primaryColor,
                  fontWeight: FontWeight.w700,
                  fontsize: 24.sp,
                ),
                SizedBox(
                  height: 10.h,
                ),
                PretendardCustomText(
                  text:
                      "Enter 6-digit code we just texted to your\n phone number",
                  fontsize: 12.sp,
                  fontWeight: FontWeight.w400,
                  textColor: greyColor,
                ),
                SizedBox(
                  height: 62.h,
                ),
                // PinCodeTextField(
                //   controller: verifyController,
                //   appContext: context,
                //   length: ,
                //   keyboardType: TextInputType.number,
                //   animationType: AnimationType.scale,
                //   pinTheme: PinTheme(
                //       borderRadius: BorderRadius.circular(10),
                //       borderWidth: 1,
                //       activeFillColor: primaryColor,
                //       shape: PinCodeFieldShape.box,
                //       activeColor: primaryColor,
                //       selectedColor: primaryColor,
                //       inactiveColor: greyColor.withOpacity(0.1),
                //       fieldHeight: 7.h,
                //       fieldWidth: 14.w
                //   ),
                //
                // ),

                Form(
                  key: formValidKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Pinput(
                        length: 6,
                        keyboardType: TextInputType.number,
                        closeKeyboardWhenCompleted: true,
                        obscureText: false,
                        controller: verifyController,
                        defaultPinTheme: defaultPinTheme,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter the 6-digit OTP.";
                          }
                          return null;
                        },
                        focusedPinTheme: defaultPinTheme,
                        submittedPinTheme: defaultPinTheme,
                        textInputAction: TextInputAction.done,
                        showCursor: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                GestureDetector(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: PretendardCustomText(
                      text: "Use a different phone number",
                      fontsize: 12.sp,
                      textColor: primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 62.h,
                ),
                RoundButton(
                    height: 51.h,title: "Verify Account", onTap: () {
                      Get.to(EmailVerify());
                }),
                SizedBox(
                  height: 12.h,
                ),
                RoundButton(
                  height: 51.h,
                    title: "Resend Code",
                    color: Colors.transparent,
                    titleColor: primaryColor,
                    onTap: () {}),
              ],
            ),
          )
        ],
      ),
    );
  }
}
