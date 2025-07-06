import 'package:flutter/material.dart';
import 'package:inst_pay/core/style/colors.dart';
import 'package:inst_pay/presentation/ui/widgets/buttons/main_buttons.dart';

import 'package:lottie/lottie.dart';

class TransferAnimationDialog extends StatelessWidget {
  const TransferAnimationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      content: FutureBuilder(
        future: Future.delayed(Duration(seconds: 3)).then((value) => 2),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return dialogContent(
              'assets/animations/success_animation.json',
              'Success',
              repeat: false,
              context: context,
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return dialogContent(
              'assets/animations/money_transfer.json',
              'Transferring...',
            );
          } else {
            return dialogContent(
              'assets/animations/error_animation.json',
              'Error',
              repeat: false,
              context: context,
            );
          }
        },
      ),
    );
  }
}

Widget dialogContent(
  String asset,
  String text, {
  bool? repeat,
  BuildContext? context,
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Lottie.asset(
        asset, // Add your animation file here
        width: 200,
        height: 200,
        repeat: repeat,
        fit: BoxFit.cover,
      ),
      const SizedBox(height: 16),
      Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      SizedBox(height: repeat ?? true ? 0 : 20),
      repeat ?? true
          ? const SizedBox()
          : PrimaryButton(
            color: AppColors.primary,
            text: 'Finish',
            click: () {
              Navigator.of(context!).pop();
            },
            height: 50,
          ),
    ],
  );
}
