import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:inst_pay/core/style/text_styles.dart';
import 'package:inst_pay/core/utils/svg.dart';

class InvoiceItem extends StatelessWidget {
  final bool isLastItem;
  const InvoiceItem({super.key, required this.isLastItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: SvgPicture.string(APPSVG.pdfIcon, fit: BoxFit.scaleDown),
          title: Text("31-03-2025", style: AppTextStyle.greyTextStyle12),
          subtitle: Text(
            "Invoice_Wifak_23439.pdf",
            style: AppTextStyle.blackTextStyle,
          ),
          trailing: SvgPicture.string(APPSVG.downloadIcon),
        ),
        isLastItem ? SizedBox() : Divider(thickness: 2),
      ],
    );
  }
}
