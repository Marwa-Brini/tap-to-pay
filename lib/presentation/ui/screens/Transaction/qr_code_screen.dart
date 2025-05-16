import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inst_pay/core/style/colors.dart';
import 'package:inst_pay/core/style/text_styles.dart';
import 'package:inst_pay/presentation/ui/widgets/buttons/main_buttons.dart';

class QrTransactionScreen extends StatelessWidget {
  const QrTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        automaticallyImplyLeading: false,
        title: Text("QR Transaction", style: AppTextStyle.appBarTextStyle),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'scan the QR code for quick payment. the QR code will expires in 5min ',
              style: AppTextStyle.greyTextStyle,
            ),
            const SizedBox(height: 40),
            Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Qrcode_wikipedia_fr_v2clean.png/960px-Qrcode_wikipedia_fr_v2clean.png",
              height: 250.h,
            ),
            const Spacer(),
            PrimaryButton(
              color: AppColors.primary,
              text: 'Finish',
              click: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
