import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inst_pay/controller/qr_controller.dart';
import 'package:inst_pay/core/style/colors.dart';
import 'package:inst_pay/core/style/text_styles.dart';
import 'package:inst_pay/view/screen/Transaction/pay_screen.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScanScreen extends StatelessWidget {
  const QrScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        title: Text('Scan', style: AppTextStyle.appBarTextStyle),
        foregroundColor: AppColors.black,
        centerTitle: true,
      ),
      body: GetBuilder(
        init: QrController(),
        builder: (qrController) {
          return MobileScanner(
            controller: MobileScannerController(
              detectionSpeed: DetectionSpeed.noDuplicates,
            ),
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;
              for (final barcode in barcodes) {
                print('Barcode found! ${barcode.rawValue}');
                qrController.scanedCode = barcode.rawValue!.split("/");
              }
              Navigator.of(context).pop();
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => PayScreen()));
            },
          );
        },
      ),
    );
  }
}
