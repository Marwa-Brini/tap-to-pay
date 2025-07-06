import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inst_pay/controller/qr_controller.dart';
import 'package:inst_pay/core/style/colors.dart';
import 'package:inst_pay/core/style/text_styles.dart';
import 'package:inst_pay/core/utils/string_const.dart';
import 'package:inst_pay/core/utils/svg.dart';
import 'package:inst_pay/presentation/ui/widgets/buttons/main_buttons.dart';
import 'package:inst_pay/presentation/ui/widgets/input/input.dart';

class PayScreen extends StatelessWidget {
  const PayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        title: Text('Pay', style: AppTextStyle.appBarTextStyle),
        foregroundColor: AppColors.black,
        centerTitle: true,
      ),

      body: GetBuilder(
        init: QrController(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 20),

                InputText(
                  enabled: false,
                  hint: 'RIB',
                  leading: APPSVG.bankIcon,
                  controler:
                      TextEditingController()..text = controller.scanedCode[0],
                ),
                InputText(
                  enabled: false,
                  hint: 'Username',
                  leading: APPSVG.userIcon,
                  controler:
                      TextEditingController()
                        ..text = 'Marwa Brini', //controller.scanedCode[1],
                ),
                InputText(
                  enabled: false,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'Please enter an amount';
                    }
                  },
                  hint: 'Amount',
                  leading: APPSVG.amountIcon,
                  suffixText: const TextButton(
                    onPressed: null,
                    child: Text('DT'),
                  ),
                  type: TextInputType.number,
                  controler:
                      TextEditingController()..text = controller.scanedCode[2],
                ),
                SizedBox(height: 70.h),
                PrimaryButton(
                  color: AppColors.primary,
                  text: 'Pay',
                  click: () {},
                ),
                const SizedBox(height: 10),

                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel', style: AppTextStyle.greyTextStyle12),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
