import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inst_pay/controller/authentication_controller.dart';
import 'package:inst_pay/controller/bank_controller.dart';
import 'package:inst_pay/controller/bankaccount_controller.dart';
import 'package:inst_pay/controller/contact_controller.dart';
import 'package:inst_pay/controller/qr_controller.dart';
import 'package:inst_pay/core/style/colors.dart';
import 'package:inst_pay/core/style/text_styles.dart';

import 'package:inst_pay/presentation/ui/screens/pin/lock_screen.dart';
import 'package:inst_pay/presentation/ui/screens/pin/new_lock_screen.dart';
import 'package:inst_pay/service/bank_service.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  Future<void> init(BuildContext context, int duration) async {
    await BankService.createBank(
      00,
      'https://jsonplaceholder.typicode.com/posts',
      'https://www.bct.gov.tn/bct/siteprod/images/logo.png',
      'BCT',
    );
    await BankService.createBank(
      01,
      'https://jsonplaceholder.typicode.com/comments',
      'https://www.tustex.com/sites/default/files//ATB-logo.png',
      'ATB',
    );
    await BankService.createBank(
      03,
      'https://jsonplaceholder.typicode.com/todos',
      'https://upload.wikimedia.org/wikipedia/fr/0/02/Logo-bna-V213430-696x377.png',
      'BNA',
    );
    final auth = Get.put(AuthenticationController());
    final bank = Get.put(BankAccountController());
    Get.put(BankController());
    Get.put(QrController());
    Get.put(ContactController());
    await auth.getUser();
    await bank.getBankAccounts();
    Future.delayed(Duration(seconds: duration), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder:
              (_) =>
                  auth.currentUser == null
                      ? const NewLockScreen()
                      : const LockScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: FutureBuilder(
          future: init(context, 3),
          builder: (context, snapshot) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(),
                    Image.asset("assets/Sibtel.png"),
                    Text(
                      "For fast and secure transactions",
                      style: AppTextStyle.greyTextStyle,
                    ),
                    Spacer(),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Secured by',
                            style: AppTextStyle.smallGreyTextStyle,
                          ),
                          TextSpan(
                            text: ' SIBTEL',
                            style: AppTextStyle.smallRedTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
