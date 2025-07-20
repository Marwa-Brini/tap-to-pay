import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:inst_pay/core/style/colors.dart';
import 'package:inst_pay/core/style/text_styles.dart';
import 'package:inst_pay/core/utils/svg.dart';

// ignore: must_be_immutable
class SearchInput extends StatefulWidget {
  final String hint;
  final void Function(String?)? onChanged;
  final TextEditingController? controler;
  SearchInput({super.key, required this.hint, this.controler, this.onChanged});

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: TextField(
        controller: widget.controler,
        onChanged: widget.onChanged,
        style: AppTextStyle.blackTextStyle,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          fillColor: AppColors.lightgrey,
          filled: true,
          hintText: widget.hint,
          prefixIcon: SvgPicture.string(
            APPSVG.searchIcon,
            color: AppColors.hintColor,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
