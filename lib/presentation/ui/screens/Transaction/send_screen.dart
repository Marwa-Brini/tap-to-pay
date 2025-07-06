import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inst_pay/controller/contact_controller.dart';
import 'package:inst_pay/core/style/colors.dart';
import 'package:inst_pay/core/style/text_styles.dart';
import 'package:inst_pay/core/utils/svg.dart';
import 'package:inst_pay/presentation/ui/widgets/buttons/main_buttons.dart';
import 'package:inst_pay/presentation/ui/widgets/dialog/money_transfert_animation_dialog.dart';
import 'package:inst_pay/presentation/ui/widgets/input/input.dart';
import 'package:inst_pay/view/screen/select_contact_screen.dart';

class SendScreen extends StatefulWidget {
  final String rib;
  const SendScreen({super.key, required this.rib});

  @override
  State<SendScreen> createState() => _SendScreenState();
}

class _SendScreenState extends State<SendScreen> {
  @override
  void dispose() {
    ContactController c = Get.find();
    c.resetSelectedController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        title: Text('Send', style: AppTextStyle.appBarTextStyle),
        foregroundColor: AppColors.black,
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),

            InputText(
              hint: 'RIB',
              leading: APPSVG.bankIcon,
              controler: TextEditingController()..text = widget.rib,
              enabled: false,
            ),
            GetBuilder(
              init: ContactController(),
              builder: (contactController) {
                return InputText(
                  controler:
                      TextEditingController()
                        ..text = contactController.finalSelectedContact ?? '',
                  type: TextInputType.none,
                  hint: 'Contact',
                  leading: APPSVG.contactIcon,
                  suffixText: TextButton(
                    onPressed: null,
                    child: IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => SelectContactScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
            InputText(
              validator: (v) {
                if (v!.isEmpty) {
                  return 'Please enter an amount';
                }
                return null;
              },
              hint: 'Amount',
              leading: APPSVG.amountIcon,
              suffixText: const TextButton(onPressed: null, child: Text('DT')),
              type: TextInputType.number,
            ),
            SizedBox(height: 70.h),
            PrimaryButton(
              color: AppColors.primary,
              text: 'Send',
              click: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (_) => const TransferAnimationDialog(),
                  // ignore: use_build_context_synchronously
                ).then((value) => Navigator.of(context).pop());
              },
            ),
          ],
        ),
      ),
    );
  }
}
