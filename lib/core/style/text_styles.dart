import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inst_pay/core/style/colors.dart';

class AppTextStyle {
  static TextStyle greyTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
    color: AppColors.grey,
  );
  static TextStyle smallGreyTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
    color: AppColors.grey,
  );
  static TextStyle smallRedTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
    color: AppColors.secondary,
  );
  static TextStyle titleTextStyle = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 35.sp,
    color: AppColors.primary,
  );

  static TextStyle buttonTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 20.sp,
    color: Colors.white,
  );
  static TextStyle redTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
    color: AppColors.secondary,
  );
  static TextStyle lightLabelTextStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 13.sp,
    color: AppColors.grey,
  );
  static TextStyle smallBlackTextStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
    color: AppColors.black,
  );
  static TextStyle blackTextStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    color: AppColors.black,
  );
}
