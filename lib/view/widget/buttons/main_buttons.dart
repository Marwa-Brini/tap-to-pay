import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inst_pay/core/style/text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final Color color;
  final String text;
  final double? height;
  final double? width;
  final void Function()? click;
  const PrimaryButton({
    super.key,
    this.width,
    this.height,
    required this.color,
    required this.text,
    required this.click,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: click,
      child: Container(
        height: height ?? 60.h,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(child: Text(text, style: AppTextStyle.buttonTextStyle)),
      ),
    );
  }
}
