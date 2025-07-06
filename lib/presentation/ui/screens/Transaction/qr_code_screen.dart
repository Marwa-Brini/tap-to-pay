import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inst_pay/core/style/colors.dart';
import 'package:inst_pay/core/style/text_styles.dart';
import 'package:inst_pay/presentation/ui/screens/main_screen/profile_screen.dart';
import 'package:inst_pay/presentation/ui/widgets/buttons/main_buttons.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class QrTransactionScreen extends StatelessWidget {
  final String payload;
  const QrTransactionScreen({super.key, required this.payload});

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
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.8,

          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'scan the QR code for quick payment. the QR code will expires in 5min ',
                  style: AppTextStyle.greyTextStyle,
                ),
                const SizedBox(height: 40),
                // Image.network(
                //   "https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Qrcode_wikipedia_fr_v2clean.png/960px-Qrcode_wikipedia_fr_v2clean.png",
                //   height: 250.h,
                // ),
                PrettyQrView.data(data: payload),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: PrimaryButton(
                    color: AppColors.primary,
                    text: 'Finish',
                    click: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => ProfileScreen()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
