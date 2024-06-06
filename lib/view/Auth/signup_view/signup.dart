import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imfact_influencer_marketplace/View/Auth/signup_view/phone_number_View.dart';
import 'package:imfact_influencer_marketplace/const/image_assets.dart';
import '../../../const/color.dart';
import '../../../controller/auth_controller.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_textfield.dart';
import '../../../widgets/round_button.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  AuthController _authController = Get.put(AuthController());
  bool isChecked = true;
  ValueNotifier<bool> isButtonEnabled =
      ValueNotifier(false); // Track button state

  File? _imageFile;

  Future<void> pickImageFromGallery() async {
    final picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _authController.profilePic.value = File(pickedFile.path);
        _authController.profileURL.value = "";
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> pickImageFromCamera() async {
    final picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _authController.profilePic.value = File(pickedFile.path);
        _authController.profileURL.value = "";
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> showImagePickerOptions() async {
    await showModalBottomSheet(
      backgroundColor: const Color.fromRGBO(59, 59, 67, 1),
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Center(
                  child: PretendardCustomText(
                    text: "Photo Gallery",
                    fontsize: 19.sp,
                    textColor: const Color.fromRGBO(181, 181, 185, 1),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  pickImageFromGallery();
                },
              ),
              const Divider(),
              ListTile(
                title: Center(
                  child: PretendardCustomText(
                    text: "Camera",
                    fontsize: 19.sp,
                    textColor: const Color.fromRGBO(181, 181, 185, 1),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  pickImageFromCamera();
                },
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 50,
                  color: primaryColor,
                  child: Center(
                      child: PretendardCustomText(
                    text: "Cancel",
                    fontsize: 19.sp,
                    textColor: whiteColor,
                    fontWeight: FontWeight.w500,
                  )),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildImageWidget() {
    if (_imageFile != null) {
      return CircleAvatar(
        radius: 55,
        backgroundImage: FileImage(_imageFile!),
      );
    } else {
      return CircleAvatar(
        radius: 55,
        backgroundImage: AssetImage(
          AppImages.uploadImage,
        ),
      );
    }
  }

  int p = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          height: 55.h,
        ),
        PretendardCustomText(
          text: "Create an Account",
          fontsize: 26.sp,
          textColor: primaryColor,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(
          height: 47.h,
        ),
        GestureDetector(
            onTap: () {
              // Call a function to handle image picking here
              showImagePickerOptions();
            },
            child: _buildImageWidget()),
        SizedBox(
          height: 47.h,
        ),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 15.sp),
            child: Column(children: [
              CustomTextFiled(
                onChange: (v) {
                  _authController.update();
                  _authController.refresh();

                },
                readOnly: _authController.fromLogin.value ?? false,
                controller: nameController,
                hintText: 'Your name',
                hintColor: Colors.grey,
                hintTextSize: 11.sp,
                prefixIcon: AppImages.personIcon,
                isBorder: true,
                borderRadius: 13.sp,
                fillColor: Colors.transparent,
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomTextFiled(
                onChange: (v) {
                  _authController.update();
                  _authController.refresh();
                },
                readOnly: _authController.fromLogin.value ?? false,
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
                height: 30.h,
              ),
              CustomTextFiled(
                readOnly: false,
                controller: passwordController,
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
              SizedBox(
                height: 30.h,
              ),
              CustomTextFiled(
                readOnly: false,
                controller: confirmController,
                hintText: 'Confirm password',
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
              SizedBox(
                height: 41.h,
              ),
              GetBuilder<AuthController>(builder: (_authController) {
                return RoundButton(
                    color: _authController
                                .emailController.value.text.isNotEmpty &&
                            _authController
                                .passwordController.value.text.isNotEmpty &&
                            _authController.nameController.value.text.isNotEmpty
                        ? primaryColor
                        : greyColor,
                    textSize: 19.sp,
                    height: 51.h,
                    title: "Continue",
                    onTap: () {
                      Get.to(PhoneNumberView());
                    });
              })
            ])),
        SizedBox(
          height: 82.h,
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
    ));
  }
}
