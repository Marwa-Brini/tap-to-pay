import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inst_pay/core/style/colors.dart';
import 'package:inst_pay/core/style/text_styles.dart';
import 'package:inst_pay/core/utils/svg.dart';
import 'package:inst_pay/presentation/ui/widgets/buttons/main_buttons.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.string(APPSVG.checkIcon, width: 200),
            const SizedBox(height: 30),
            Text("Successfully", style: AppTextStyle.titleTextStyle),
            const SizedBox(height: 10),
            Text(
              "Your account has been created",
              style: AppTextStyle.greyTextStyle,
            ),
            const SizedBox(height: 30),
            PrimaryButton(
              click: () {},
              color: AppColors.primary,
              text: "Finish",
            ),
          ],
        ),
      ),
    );
  }
}
