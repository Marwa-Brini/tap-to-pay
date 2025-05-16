import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:inst_pay/core/style/colors.dart';
import 'package:inst_pay/core/style/text_styles.dart';
import 'package:inst_pay/core/utils/svg.dart';

// ignore: must_be_immutable
class InputText extends StatefulWidget {
  final String hint;
  bool? isPassword;
  final String? leading;
  final Widget? suffixText;
  final bool? enabled;
  final String? Function(String?)? validator;
  final TextEditingController? controler;
  final int? length;
  final TextInputType? type;
  InputText({
    super.key,
    required this.hint,
    this.isPassword,
    this.suffixText,
    this.type,
    this.controler,
    this.enabled,
    this.validator,
    this.length,
    this.leading,
  });

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  late bool obs;
  late String icon;
  @override
  void initState() {
    obs = widget.isPassword ?? false;
    icon = APPSVG.visibleIcon;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.length,
      style: AppTextStyle.blackTextStyle,
      validator: widget.validator,
      controller: widget.controler,
      obscureText: obs,

      keyboardType: widget.type ?? TextInputType.text,
      decoration: InputDecoration(
        enabled: widget.enabled ?? true,
        labelText: widget.hint,
        floatingLabelStyle: AppTextStyle.greyTextStyle,
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.secondary),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),

        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        fillColor: AppColors.white.withOpacity(0.3),
        //  hintText: widget.hint,
        //suffix: widget.suffix,
        prefixIcon:
            widget.leading == null
                ? null
                : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SvgPicture.string(
                    widget.leading!,
                    fit: BoxFit.scaleDown,
                  ),
                ),

        //suffixText: widget.suffixText,
        suffixIcon:
            widget.suffixText ??
            (widget.isPassword ?? false
                ? InkWell(
                  onTap: () {
                    setState(() {
                      obs = !obs;
                      icon = obs ? APPSVG.visibleIcon : APPSVG.invisibleIcon;
                    });
                  },
                  child: SvgPicture.string(icon, fit: BoxFit.scaleDown),
                )
                : null),
      ),
    );
  }
}
