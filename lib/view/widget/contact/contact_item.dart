import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inst_pay/core/style/text_styles.dart';
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
        ListTile(
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
