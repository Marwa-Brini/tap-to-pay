import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inst_pay/core/style/colors.dart';
import 'package:inst_pay/core/style/text_styles.dart';
import 'package:inst_pay/core/utils/enums.dart';

import 'package:inst_pay/presentation/ui/screens/main_screen/transaction_screen.dart';
import 'package:inst_pay/presentation/ui/screens/payment/payment_screen.dart';

class BankAccountItem extends StatelessWidget {
  const BankAccountItem({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) async {
        switch (value) {
          case MyActions.payment:
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => PaymentScreen()),
            );
            break;
          case MyActions.transaction:
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => TransactionScreen()),
            );
            break;
        }
      },
      enableFeedback: true,

      itemBuilder:
          ((context) => [
            PopupMenuItem(
              value: MyActions.payment,
              child: Text('payment', style: AppTextStyle.blackTextStyle),
            ),
            PopupMenuItem(
              value: MyActions.transaction,
              child: Text('transaction', style: AppTextStyle.blackTextStyle),
            ),
          ]),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.lightgrey,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.all(8),
          leading: Image.network(
            "https://play-lh.googleusercontent.com/_dObGcNUCiZugiDIW_iuEVDIsulknrSEmMJNBVmgNChDf2W4wM-CCNGrmXVontsfzg",
          ),
          title: Text('WIFAK Bank', style: AppTextStyle.smallTitleTextStyle),
          subtitle: Text(
            'RIB: 6548374587298745',
            style: AppTextStyle.greyTextStyle12,
          ),
          trailing: Text('1500 DT', style: AppTextStyle.boldBlackTextStyle14),
        ),
      ),
    );
  }
}
