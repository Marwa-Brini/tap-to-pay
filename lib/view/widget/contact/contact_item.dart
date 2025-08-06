import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inst_pay/controller/contact_controller.dart';
import 'package:inst_pay/core/style/text_styles.dart';
import 'package:inst_pay/core/utils/enums.dart';
import 'package:inst_pay/model/contact_model.dart';

class ContactItem extends StatelessWidget {
  final bool isLastItem;
  final ContactModel contact;
  const ContactItem({
    super.key,
    required this.isLastItem,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PopupMenuButton(
          onSelected: (value) async {
            switch (value) {
              case BankAccountActions.delete:
                showDialog(
                  context: context,
                  builder:
                      (_) => AlertDialog(
                        title: Text('delete contact'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('cancel'),
                          ),
                          TextButton(
                            onPressed: () async {
                              final ContactController controller = Get.find();
                              await controller.deleteContact(contact.id!);
                              Navigator.of(context).pop();
                            },
                            child: Text('delete'),
                          ),
                        ],
                        content: Text('do you confirm this action?'),
                      ),
                );
                break;
              case BankAccountActions.disable:
                break;
            }
          },
          enableFeedback: true,
          itemBuilder:
              ((context) => [
                PopupMenuItem(
                  value: BankAccountActions.delete,
                  child: Text('delete', style: AppTextStyle.blackTextStyle),
                ),
              ]),
          child: ListTile(
            title: Text(contact.name, style: AppTextStyle.boldBlackTextStyle14),
            subtitle: Text(
              'RIB: ${contact.rib}',
              style: AppTextStyle.greyTextStyle14,
            ),
            trailing: Image.network(
              contact.bankImage!,
              width: 50.w,
              fit: BoxFit.cover,
            ),
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
