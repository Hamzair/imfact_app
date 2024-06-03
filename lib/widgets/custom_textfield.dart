import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/color.dart';

class CustomTextFiled extends StatelessWidget {
  String? hintText;
  TextEditingController? controller;
  bool? isFilled;
  Color? fillColor;
  String? fontFamily;
  Color? hintColor;
  FontWeight? fontWeight;
  double? hintTextSize;
  String? Function(String?)? validator;
  String? Function(String?)? onChange;
  String? Function()? passwordFunction;
  double? borderRadius;
  bool? isBorder;
  IconData? suffixIcon;
  String? prefixIcon;
  bool? isErrorBorder;
  TextInputType? keyboardType;
  bool? isPassword;
  IconData? beforePasswordIcon;
  IconData? afterPasswordIcon;
  bool? isObscure;
  final bool readOnly;
  CustomTextFiled(
      {super.key,
        this.hintText,
        this.controller,
        this.isFilled,
        this.fillColor,
        this.fontFamily,
        this.hintColor,
        this.hintTextSize,
        this.fontWeight,
        this.validator,
        this.isBorder,
        this.borderRadius,
        this.suffixIcon,
        this.prefixIcon,
        this.isErrorBorder,
        this.onChange,
        this.keyboardType,
        this.isPassword,
        this.passwordFunction,
        this.beforePasswordIcon,
        this.isObscure,
        this.afterPasswordIcon,
        required this.readOnly
      });

  final _focusNode=FocusNode();
  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isNotEmptyNotifier=ValueNotifier(controller!.text.isNotEmpty);
    controller!.addListener(() {
      isNotEmptyNotifier.value=controller!.text.isNotEmpty;
    });
    return ValueListenableBuilder(valueListenable: isNotEmptyNotifier, builder: (context,isNotEmpty,child){
      return TextFormField(

        controller: controller,
        validator: validator,
        onChanged: onChange,
        keyboardType: keyboardType,
        obscureText: isObscure ?? false,
        focusNode: _focusNode,
        style: TextStyle(
            color: greenColor,
            fontSize: 11.sp,
            fontWeight: FontWeight.w400
        ),
        readOnly: readOnly,
        decoration: InputDecoration(
          suffixIcon: isPassword == true
              ? IconButton(
              onPressed: passwordFunction,
              icon: Icon(isObscure == true
                  ? beforePasswordIcon
                  : afterPasswordIcon,color: isNotEmpty?greenColor:greyColor,))
              : Icon(suffixIcon,),
          prefixIcon: Image.asset(prefixIcon??'',scale: 3,color:isNotEmpty?greenColor :Color(0xffD9DFE6),),
          filled: isFilled ?? true,
          fillColor: fillColor ?? whiteColor,
          //contentPadding: const EdgeInsets.only(left: 12),
          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily: fontFamily ?? 'jost',
            fontSize: hintTextSize ?? 10.sp,
            color: hintColor ?? Colors.black,
            fontWeight: fontWeight ?? FontWeight.w400,
          ),
          border: isBorder == true
              ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
              borderSide:  BorderSide(color:
              isNotEmpty ? greenColor
                  : greyColor, width: 1))
              : InputBorder.none,
          errorBorder: isErrorBorder == true
              ? OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(borderRadius!))
              : InputBorder.none,
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: greenColor),
              borderRadius: BorderRadius.circular(borderRadius!)),
          enabledBorder: OutlineInputBorder(
              borderSide:  BorderSide(color:isNotEmpty? greenColor:Colors.grey.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(borderRadius!)),

        ),
      );
    });
  }
}