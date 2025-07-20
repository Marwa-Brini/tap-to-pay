import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inst_pay/controller/contact_controller.dart';
import 'package:inst_pay/core/style/colors.dart';
import 'package:inst_pay/core/style/text_styles.dart';
import 'package:inst_pay/core/utils/svg.dart';
import 'package:inst_pay/view/widget/buttons/main_buttons.dart';
import 'package:inst_pay/view/widget/input/input.dart';

class AddContactDialog extends StatefulWidget {
  AddContactDialog({super.key});

  @override
  State<AddContactDialog> createState() => _AddContactDialogState();
}

class _AddContactDialogState extends State<AddContactDialog> {
  final _formkey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ribController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      content: Form(
        key: _formkey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Add New contact', style: AppTextStyle.boldBlackTextStyle14),
            const SizedBox(height: 20),

            InputText(
              hint: 'RIB',
              length: 20,
              leading: APPSVG.bankIcon,
              controler: _ribController,
              validator: (v) {
                if (v!.isEmpty) {
                  return 'Please enter your rib';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            InputText(
              hint: 'User name',
              leading: APPSVG.userIcon,
              controler: _nameController,
              validator: (v) {
                if (v!.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),

            const SizedBox(height: 30),
            GetBuilder(
              init: ContactController(),
              builder: (controller) {
                return PrimaryButton(
                  color: AppColors.primary,
                  text: "Add",
                  click: () async {
                    if (_formkey.currentState!.validate()) {
                      await controller.addContact(
                        _nameController.text,
                        _ribController.text,
                      );
                      Navigator.of(context).pop();
                    }
                  },
                  height: 50.h,
                );
              },
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel', style: AppTextStyle.greyTextStyle12),
            ),
          ],
        ),
      ),
    );
  }
}
