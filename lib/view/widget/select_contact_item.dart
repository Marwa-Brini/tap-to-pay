import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:inst_pay/controller/contact_controller.dart';
import 'package:inst_pay/core/style/text_styles.dart';
import 'package:inst_pay/model/contact_model.dart';

class SelectContactItem extends StatelessWidget {
  final bool isLastItem;
  final ContactModel contactModel;

  const SelectContactItem({
    super.key,
    required this.isLastItem,
    required this.contactModel,
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
                value: contactModel.rib,
                groupValue: controller.selectedContact,
                onChanged: (v) {
                  controller.selectContact(v!);
                },
              ),
              title: Text(
                contactModel.name,
                style: AppTextStyle.boldBlackTextStyle14,
              ),
              subtitle: Text(
                'RIB: ${contactModel.rib}',
                style: AppTextStyle.greyTextStyle14,
              ),
              trailing: Image.network(
                contactModel.bankImage!,
                width: 50.w,
                fit: BoxFit.cover,
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
