import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inst_pay/controller/contact_controller.dart';
import 'package:inst_pay/core/style/text_styles.dart';

class SelectContactItem extends StatelessWidget {
  final bool isLastItem;
  final String rib;

  const SelectContactItem({
    super.key,
    required this.isLastItem,
    required this.rib,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ContactController(),
      builder: (controller) {
        return Column(
          children: [
            ListTile(
              leading: Radio<String>.adaptive(
                value: '654837458729874$rib',
                groupValue: controller.selectedContact,
                onChanged: (v) {
                  controller.selectContact(v!);
                },
              ),
              title: Text(
                'Marwa BRINI, Ariana',
                style: AppTextStyle.boldBlackTextStyle14,
              ),
              subtitle: Text(
                'RIB: 654837458729874$rib',
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
      },
    );
  }
}
