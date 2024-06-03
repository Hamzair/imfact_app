import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxString signupName = "".obs;
  RxString signupEmail = "".obs;
  RxString signupPass = "".obs;
  RxString profileURL = "".obs;
  RxString authPhoneNumber = "".obs;
  Rx<File> profilePic = File("").obs;
  Rx<File> idCardFrontPic = File("").obs;
  Rx<File> idCardBackPic = File("").obs;
  RxString verificationIdCode = "".obs;
  RxString level = "".obs;
  RxString completePhoneNumber = "".obs;

  RxInt resendTokenCode = 0.obs;
  RxBool allSignInField = false.obs;
  RxBool allLoginInField = false.obs;

  RxBool signingUp = false.obs;
  RxBool fromLogin = false.obs;

  RxString sentOTP = "".obs;
  RxString recievedOTP = "".obs;
  final Rx<TextEditingController> emailController = TextEditingController().obs;
  final Rx<TextEditingController>  passwordController = TextEditingController().obs;
  final Rx<TextEditingController>  nameController = TextEditingController().obs;

}