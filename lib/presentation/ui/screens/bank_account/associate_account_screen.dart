import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inst_pay/controller/bank_controller.dart';
import 'package:inst_pay/core/style/colors.dart';
import 'package:inst_pay/core/style/text_styles.dart';
import 'package:inst_pay/core/utils/svg.dart';
import 'package:inst_pay/model/bank.dart';
import 'package:inst_pay/presentation/ui/widgets/buttons/main_buttons.dart';
import 'package:inst_pay/presentation/ui/widgets/input/input.dart';
import 'package:inst_pay/service/bank_service.dart';

import 'bank_otp_verification_screen.dart';

class AssociateAccountScreen extends StatelessWidget {
  const AssociateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    BankModel? res;

    final _editingController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        foregroundColor: AppColors.black,

        elevation: 0,
        backgroundColor: AppColors.background,
      ),
      body: SafeArea(
        child: GetBuilder(
          init: BankController(),
          builder: (controller) {
            return Form(
              key: _formkey,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Associate Account",
                                style: AppTextStyle.titleTextStyle,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "We will send you a verification code to your phone number. Please enter your bank account details (RIB) below.",
                                style: AppTextStyle.greyTextStyle,
                              ),
                              const SizedBox(height: 40),

                              InputText(
                                hint: "RIB",
                                leading: APPSVG.bankIcon,
                                suffixText:
                                    controller.selectedbank == null
                                        ? Container(width: 0, height: 0)
                                        : Image.network(
                                          controller.selectedbank!.image,
                                          fit: BoxFit.cover,
                                          width: 60,
                                          height: 60,
                                        ),
                                type: TextInputType.number,
                                controler: _editingController,
                                onchange: (v) async {
                                  if (v.length == 2) {
                                    res = await BankService.getBankById(
                                      int.parse(v.substring(0, 2)),
                                    );
                                  }
                                  if (res != null) {
                                    controller.selectBank(res);
                                  } else {
                                    controller.selectBank(null);
                                  }
                                  //print(res!.name);

                                  if (v.length < 2) {
                                    controller.selectBank(null);
                                  }
                                },
                                length: 20,
                                validator: (v) {
                                  if (v == null || v.length != 20) {
                                    return "RIB must be 20 digits long";
                                  }
                                  return null;
                                },
                              ),

                              const SizedBox(height: 30),
                              PrimaryButton(
                                click: () async {
                                  if (_formkey.currentState!.validate()) {
                                    await controller.fetchData(
                                      controller.selectedbank!.url,
                                    );

                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder:
                                            (_) => BankOTPVerificationScreen(
                                              code: int.parse(
                                                _editingController.text
                                                    .substring(0, 2),
                                              ),
                                              rib: _editingController.text,
                                            ),
                                      ),
                                    );
                                  }
                                },
                                text: "Next",
                                color: AppColors.primary,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
