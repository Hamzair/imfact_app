import 'dart:math';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../const/color.dart';
import '../../../controller/auth_controller.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/phone_number_field.dart';
import '../../../widgets/round_button.dart';
import 'authentication_view.dart';

class PhoneNumberView extends StatefulWidget {
  const PhoneNumberView({super.key});

  @override
  State<PhoneNumberView> createState() => _PhoneNumberViewState();
}

class _PhoneNumberViewState extends State<PhoneNumberView> {
  AuthController authController = Get.put(AuthController());
  final phoneController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String countryCode = "+92 ";

  String phoneNumber = "";

  @override
  void initState() {
    super.initState();
    // Initialize Twilio
    authController.authPhoneNumber.value = '';

    authController.allSignInField.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.sp),
        child: Form(
          key: _formKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: 70.h,
            ),
            PretendardCustomText(
              text: "What's Your Mobile\nNumber?",
              textAlign: TextAlign.center,
              fontsize: 24.sp,
              textColor: primaryColor,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 5.h,
            ),
            PretendardCustomText(
              text:
                  "Enter your mobile phone number so we\ncan text you an authentication code.",
              fontsize: 14.sp,
              textColor: greyColor,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(
              height: 34.h,
            ),
            CustomPhoneNumberField(
              childWidget: CountryCodePicker(
                onChanged: (value) {
                  setState(() {
                    countryCode = value.toString();
                    print(value);
                  });
                },
                initialSelection: 'PK',
                favorite: ['+1', ''],
                showCountryOnly: false,
                showOnlyCountryWhenClosed: false,
                alignLeft: false,
              ),
              controller: phoneController,
              onChange: (value) {},
              hintText: "",
              passwordFunction: () {
                phoneController.clear();
              },
              keyboardType: TextInputType.number,
              hintColor: greyColor,
              hintTextSize: 14.sp,
              isBorder: true,
              borderRadius: 13.sp,
              fillColor: Colors.transparent,
              suffixIcon: Icons.cancel,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter the number";
                }
                return null;
              },
            ),
            Spacer(),
            Obx(
              () => RoundButton(
                  height: 51.h,
                  title: "Continue",
                  color: authController.authPhoneNumber.value.isEmpty
                      ? greyColor.withOpacity(0.5)
                      : primaryColor,
                  //width: 90.w,
                  onTap: () {
                    Get.to(AuthenticationCodeView());
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        phoneNumber = countryCode + phoneController.text;
                      });
                      print(phoneNumber);
                      authController.authPhoneNumber.value =
                          countryCode + phoneNumber;
                      // if (authController.fromLogin.value == true) {
                      //   _progressController.initialPage.value = 3;
                      //   _progressController.initialContent.value = 3;
                      // } else {
                      //   _progressController.changePage();
                      //   _progressController.changeScreenContent();
                      // }
                      // print(authController.authPhoneNumber.value);
                    }
                  }),
            ),
            SizedBox(
              height: 72.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PretendardCustomText(
                  text: "Already have an account? ",
                  textColor: Color(0xff111827),
                  fontWeight: FontWeight.w400,
                  fontsize: 14.sp,
                ),
                PretendardCustomText(
                  text: "Sign in",
                  textColor: primaryColor,
                  fontWeight: FontWeight.w400,
                  fontsize: 14.sp,
                ),
              ],
            ),
            SizedBox(
              height: 36.h,
            ),
          ]),
        ),
      ),
    );
  }
}
