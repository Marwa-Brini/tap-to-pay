import 'package:flutter/material.dart';
import 'package:inst_pay/core/style/colors.dart';
import 'package:inst_pay/core/style/text_styles.dart';

class TransactionHistoryItem extends StatelessWidget {
  const TransactionHistoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.lightgrey,
        border: Border(left: BorderSide(color: AppColors.green, width: 4)),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(8),
        leading: Image.network(
          "https://play-lh.googleusercontent.com/_dObGcNUCiZugiDIW_iuEVDIsulknrSEmMJNBVmgNChDf2W4wM-CCNGrmXVontsfzg",
        ),
        title: Text('WIFAK Bank', style: AppTextStyle.smallTitleTextStyle),
        subtitle: Text(
          'Transaction ID\nGDK44LL33KKK3',
          style: AppTextStyle.greyTextStyle12,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('20-01-2025 14:05', style: AppTextStyle.greyTextStyle12),
            Text('+1500 DT', style: AppTextStyle.boldGreenTextStyle14),
          ],
        ),
      ),
    );
  }
}
