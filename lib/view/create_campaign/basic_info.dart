import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imfact_influencer_marketplace/const/color.dart';
import 'package:imfact_influencer_marketplace/const/text_styles.dart';

import '../../widgets/custom_back_button.dart';

class BasicInfo extends StatefulWidget {
  const BasicInfo({super.key});

  @override
  State<BasicInfo> createState() => _BasicInfoState();
}

class _BasicInfoState extends State<BasicInfo> {
  int campaignTypeIndex = 0;
  String campaignType = '';
  List<String> campaignTypes = [
    'General',
    'Impact AI',
    'Quick',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 24.w, top: 16.h, right: 24.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      const CustomBackButton(),
                      SizedBox(width: 27.w),
                      Text(
                        'Create Campaign',
                        style: pretendard700(17.sp),
                      ),
                    ],
                  ),
                  SizedBox(height: 40.h),
                  Row(
                    children: [
                      Text(
                        'Basic info',
                        style: pretendardWithColor(redColor, 17.sp),
                      ),
                      SizedBox(width: 2.w),
                      const Icon(Icons.arrow_forward_ios_rounded,
                          size: 20, color: greyColor),
                      SizedBox(width: 2.w),
                      Text(
                        'Media',
                        style: pretendardWithColor500(greyShadeColor, 15.sp),
                      ),
                      SizedBox(width: 2.w),
                      const Icon(Icons.arrow_forward_ios_rounded,
                          size: 20, color: greyColor),
                      SizedBox(width: 2.w),
                      Text(
                        'Detail',
                        style: pretendardWithColor500(greyShadeColor, 15.sp),
                      ),
                      SizedBox(width: 2.w),
                      const Icon(Icons.arrow_forward_ios_rounded,
                          size: 20, color: greyColor),
                      SizedBox(width: 2.w),
                      Text(
                        'Product',
                        style: pretendardWithColor500(greyShadeColor, 15.sp),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            const Divider(color: dividerColor, thickness: 2),
            SizedBox(height: 25.h),
            Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Campaign Type',
                    style: TextStyle(
                      fontSize: 17.78,
                      fontWeight: FontWeight.w600,
                      color: headingBlackColor,
                      fontFamily: 'Pretendard',
                    ),
                  ),
                  SizedBox(height: 5.h),
                  const Text(
                    'Select campaign type',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: headingBlackColor,
                      fontFamily: 'Pretendard',
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Wrap(
                    // runSpacing: 29.h,
                    spacing: 29.w,
                    children: List.generate(
                      campaignTypes.length,
                      (index) => GestureDetector(
                        onTap: () {
                          campaignType = campaignTypes[index];
                          campaignTypeIndex = index;
                          setState(() {});
                        },
                        child: Container(
                          height: 26.h,
                          constraints: BoxConstraints(maxWidth: 84.w),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: campaignTypeIndex == index
                                  ? primaryColor
                                  : campaignTextTypeColor,
                            ),
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Center(
                            child: Text(
                              campaignTypes[index],
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: campaignTypeIndex == index
                                    ? primaryColor
                                    : campaignTextTypeColor,
                                fontFamily: 'Pretendard',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Container(
                    width: 310.w,
                    height: 86.h,
                    padding: EdgeInsets.only(left: 12.w, right: 10.w,top: 7.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.r),
                      color: containerBackgroundColor
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Guide',
                          style: TextStyle(
                            fontSize: 17.78.sp,
                            fontWeight: FontWeight.w600,
                            color: headingBlackColor,
                            fontFamily: 'Pretendard',
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Please choose category and select different methods that show below.',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: headingBlackColor,
                            fontFamily: 'Pretendard',
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
