import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inst_pay/core/style/colors.dart';
import 'package:inst_pay/core/style/text_styles.dart';
import 'package:inst_pay/core/utils/svg.dart';
import 'package:inst_pay/presentation/ui/screens/Transaction/qr_code_screen.dart';
import 'package:inst_pay/presentation/ui/widgets/buttons/main_buttons.dart';
import 'package:inst_pay/presentation/ui/widgets/input/input.dart';

class RequestScreen extends StatelessWidget {
  final String rib;
  final String name;
  const RequestScreen({super.key, required this.rib, required this.name});

  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    final amount = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        title: Text('Request for payment', style: AppTextStyle.appBarTextStyle),
        foregroundColor: AppColors.black,
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              const SizedBox(height: 20),

              InputText(
                controler: amount,
                validator: (v) {
                  if (v!.isEmpty) {
                    return 'Please enter an amount';
                  }
                  return null;
                },
                hint: 'Amount',
                leading: APPSVG.amountIcon,
                suffixText: const TextButton(
                  onPressed: null,
                  child: Text('DT'),
                ),
                type: TextInputType.number,
              ),
              SizedBox(height: 70.h),
              PrimaryButton(
                color: AppColors.primary,
                text: 'Generate',
                click: () {
                  if (_formkey.currentState!.validate()) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder:
                            (_) => QrTransactionScreen(
                              payload: '$rib/$name/${amount.text}',
                            ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
