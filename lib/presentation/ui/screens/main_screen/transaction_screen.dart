import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inst_pay/core/style/colors.dart';
import 'package:inst_pay/core/style/text_styles.dart';
import 'package:inst_pay/core/utils/svg.dart';
import 'package:inst_pay/presentation/ui/widgets/buttons/main_buttons.dart';
import 'package:inst_pay/presentation/ui/widgets/dialog/generate_qr_dialog.dart';
import 'package:inst_pay/presentation/ui/widgets/drawer/drawer.dart';
import 'package:inst_pay/presentation/ui/widgets/input/input.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppColors.background,
      drawer: const MainDrawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
          icon: const Icon(Icons.menu, color: AppColors.black),
        ),
        title: Text("Transactions", style: AppTextStyle.appBarTextStyle),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.string(APPSVG.qrCodeIcon),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              InputText(hint: 'RIB', leading: APPSVG.bankIcon),
              const SizedBox(height: 10),
              InputText(hint: 'User name', leading: APPSVG.userIcon),
              const SizedBox(height: 10),
              InputText(
                hint: 'Amount',
                leading: APPSVG.amountIcon,
                suffixText: const TextButton(
                  onPressed: null,
                  child: Text('DT'),
                ),
                type: TextInputType.number,
              ),
              const SizedBox(height: 10),
              InputText(hint: 'Note', leading: APPSVG.NoteIcon),
              const SizedBox(height: 40),
              PrimaryButton(
                color: AppColors.primary,
                text: 'Send',
                click: () {},
              ),
              const SizedBox(height: 20),
              Text('OR', style: AppTextStyle.greyTextStyle14),
              const SizedBox(height: 10),

              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => GenerateQRDialog(),
                  );
                },
                child: Text(
                  'Generate QR Transaction',
                  style: AppTextStyle.textButtonStyle16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
