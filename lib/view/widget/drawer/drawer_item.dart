import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:inst_pay/core/style/colors.dart';
import 'package:inst_pay/core/style/text_styles.dart';

class DrawerItem extends StatelessWidget {
  final String label;
  final String icon;
  final int index;
  final void Function() onTap;
  final int? groupeIndex;
  const DrawerItem({
    super.key,
    required this.label,
    required this.icon,
    required this.index,
    required this.onTap,
    this.groupeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListTile(
          leading: SvgPicture.string(
            icon,
            color:
                index == groupeIndex ? AppColors.primary : AppColors.hintColor,
          ),
          title: Text(
            label,
            style: AppTextStyle.blackTextStyle14.copyWith(
              color:
                  index == groupeIndex
                      ? AppColors.primary
                      : AppColors.hintColor,
            ),
          ),
        ),
      ),
    );
  }
}
