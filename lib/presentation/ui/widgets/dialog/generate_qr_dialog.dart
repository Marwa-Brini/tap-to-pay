import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inst_pay/core/style/colors.dart';
import 'package:inst_pay/core/style/text_styles.dart';
import 'package:inst_pay/core/utils/svg.dart';
import 'package:inst_pay/presentation/ui/widgets/buttons/dropdown_bank_account.dart';
import 'package:inst_pay/presentation/ui/widgets/buttons/main_buttons.dart';
import 'package:inst_pay/presentation/ui/widgets/input/input.dart';

class GenerateQRDialog extends StatelessWidget {
  GenerateQRDialog({super.key});
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formkey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Generate new QR Transactions',
              style: AppTextStyle.boldBlackTextStyle14,
            ),
            const SizedBox(height: 20),
            RibDropDown(),
            // InputText(hint: 'RIB',leading: APPSVG.bankIcon,),
            const SizedBox(height: 10),
            InputText(
              hint: 'User name',
              leading: APPSVG.userIcon,
              enabled: false,
              controler: TextEditingController.fromValue(
                TextEditingValue(text: 'Marwa BRINI'),
              ),
            ),
            const SizedBox(height: 10),
            InputText(
              validator: (v) {
                if (v!.isEmpty) {
                  return 'Please enter an amount';
                }
              },
              hint: 'Amount',
              leading: APPSVG.amountIcon,
              suffixText: const TextButton(onPressed: null, child: Text('DT')),
              type: TextInputType.number,
            ),

            const SizedBox(height: 30),
            PrimaryButton(
              color: AppColors.primary,
              text: "Generate",
              click: () {
                if (_formkey.currentState!.validate()) {}
              },
              height: 50.h,
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
      ),
    );
  }
}
