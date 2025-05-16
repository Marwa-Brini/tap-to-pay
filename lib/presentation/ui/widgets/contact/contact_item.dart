import 'package:flutter/material.dart';
import 'package:inst_pay/core/style/text_styles.dart';

class ContactItem extends StatelessWidget {
  final bool isLastItem;
  const ContactItem({super.key, required this.isLastItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            'Marwa BRINI, Ariana',
            style: AppTextStyle.boldBlackTextStyle14,
          ),
          subtitle: Text(
            'RIB: 6548374587298745',
            style: AppTextStyle.greyTextStyle14,
          ),
          trailing: Image.network(
            "https://play-lh.googleusercontent.com/_dObGcNUCiZugiDIW_iuEVDIsulknrSEmMJNBVmgNChDf2W4wM-CCNGrmXVontsfzg",
          ),
        ),
        isLastItem
            ? const SizedBox()
            : const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(thickness: 2),
            ),
      ],
    );
  }
}
