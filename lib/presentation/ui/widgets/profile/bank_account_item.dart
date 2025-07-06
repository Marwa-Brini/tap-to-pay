import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inst_pay/core/style/colors.dart';
import 'package:inst_pay/core/style/text_styles.dart';
import 'package:inst_pay/core/utils/enums.dart';
import 'package:inst_pay/model/bank_account_model.dart';
import 'package:inst_pay/presentation/state_mangement/payment_controller.dart';
import 'package:inst_pay/presentation/ui/screens/Transaction/request_screen.dart';
import 'package:inst_pay/presentation/ui/screens/Transaction/send_screen.dart';
import 'package:inst_pay/presentation/ui/screens/payment/pay_screen.dart';
import 'package:inst_pay/presentation/ui/widgets/buttons/main_buttons.dart';

class BankAccountItem extends StatefulWidget {
  final BankAccountModel bankAccountModel;
  const BankAccountItem({super.key, required this.bankAccountModel});

  @override
  State<BankAccountItem> createState() => _BankAccountItemState();
}

late ExpansionTileController controller;

class _BankAccountItemState extends State<BankAccountItem> {
  @override
  void initState() {
    controller = ExpansionTileController();
    super.initState();
  }

  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) async {
        switch (value) {
          case BankAccountActions.delete:
            print('delete');
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
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.lightgrey,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Image.network(widget.bankAccountModel.image!, width: 40.w),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.bankAccountModel.name,
                          style: AppTextStyle.smallTitleTextStyle,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3.0),
                          child: Text(
                            'RIB: ${widget.bankAccountModel.rib}',
                            style: AppTextStyle.greyTextStyle12,
                          ),
                        ),
                        Text(
                          'Balance: ${widget.bankAccountModel.balance.toString()} DT',
                          style: AppTextStyle.boldBlackTextStyle14,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      _isExpanded ? Icons.expand_less : Icons.expand_more,
                    ),
                    onPressed: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                  ),
                ],
              ),
              if (_isExpanded)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: PrimaryButton(
                          color: AppColors.primary,
                          text: 'Send',
                          click: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder:
                                    (_) => SendScreen(
                                      rib: widget.bankAccountModel.rib,
                                    ),
                              ),
                            );
                          },
                          height: 50.h,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: GetBuilder(
                          init: PaymentController(),
                          builder: (paymentController) {
                            return PrimaryButton(
                              color: AppColors.primary,
                              text: 'Pay',
                              click: () async {
                                await paymentController
                                    .pickImageFromCamera()
                                    .then(
                                      (value) => Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (_) => PayScreen(),
                                        ),
                                      ),
                                    );
                              },
                              height: 50.h,
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: PrimaryButton(
                          color: AppColors.primary,
                          text: 'Request',
                          click: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder:
                                    (_) => RequestScreen(
                                      rib: widget.bankAccountModel.rib,
                                      name: widget.bankAccountModel.name,
                                    ),
                              ),
                            );
                          },
                          height: 50.h,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
