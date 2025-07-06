import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:inst_pay/controller/authentication_controller.dart';
import 'package:inst_pay/controller/bankaccount_controller.dart';
import 'package:inst_pay/core/style/colors.dart';
import 'package:inst_pay/core/style/text_styles.dart';
import 'package:inst_pay/presentation/ui/screens/main_screen/profile_screen.dart';
import 'package:inst_pay/presentation/ui/widgets/buttons/main_buttons.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';

class BankOTPVerificationScreen extends StatefulWidget {
  final int code;
  final String rib;
  const BankOTPVerificationScreen({
    super.key,
    required this.rib,
    required this.code,
  });

  @override
  State<BankOTPVerificationScreen> createState() =>
      _BankOTPVerificationScreenState();
}

class _BankOTPVerificationScreenState extends State<BankOTPVerificationScreen> {
  final otp = TextEditingController();
  final auth = AuthenticationController();
  @override
  Widget build(BuildContext context) {
    @override
    // ignore: unused_element
    void dispose() {
      otp.clear();
      super.dispose();
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        foregroundColor: AppColors.black,
        elevation: 0,
        backgroundColor: AppColors.background,
      ),
      body: SafeArea(
        child: GetBuilder(
          init: BankAccountController(),
          builder: (controller) {
            return Form(
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
                                "OTP Verification",
                                style: AppTextStyle.titleTextStyle,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Enter the verification code sent to your phone via SMS. The code expires in 5 minutes",
                                style: AppTextStyle.greyTextStyle,
                              ),
                              const SizedBox(height: 40),

                              Center(
                                child: OTPTextFieldV2(
                                  controller: OtpFieldControllerV2(),
                                  length: 4,
                                  width: 250.w,
                                  textFieldAlignment:
                                      MainAxisAlignment.spaceAround,
                                  fieldWidth: 45,
                                  fieldStyle: FieldStyle.box,
                                  outlineBorderRadius: 15,
                                  style: AppTextStyle.blackTextStyle,
                                  onChanged: (pin) {
                                    otp.text = pin;
                                  },
                                  onCompleted: (pin) async {
                                    await controller.createBankAccount(
                                      bankId: widget.code,
                                      rib: widget.rib,

                                      email: "email@gmail.com",

                                      balance: 1200,
                                      username: "Marwa Brini",
                                    );
                                  },
                                ),
                              ),

                              const SizedBox(height: 40),
                              PrimaryButton(
                                click: () {
                                  if (otp.text.length == 4) {
                                    Fluttertoast.showToast(
                                      msg: "Account successfully added",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: AppColors.green,
                                      textColor: Colors.white,
                                      fontSize: 16.0,
                                    );
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (_) => ProfileScreen(),
                                      ),
                                    );
                                  }
                                },
                                text: "Verify",
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
