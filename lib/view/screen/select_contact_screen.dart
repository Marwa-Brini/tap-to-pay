import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inst_pay/controller/contact_controller.dart';
import 'package:inst_pay/core/style/colors.dart';
import 'package:inst_pay/core/style/text_styles.dart';
import 'package:inst_pay/view/widget/select_contact_item.dart';

class SelectContactScreen extends StatelessWidget {
  const SelectContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ContactController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                foregroundColor: AppColors.black,
                elevation: 4,
                snap: true,
                pinned: true,
                floating: true,
                actions: [
                  TextButton(
                    onPressed: () {
                      controller.selectfinalContact();
                      Navigator.of(context).pop();
                    },
                    child: Text('select'),
                  ),
                ],
                backgroundColor: AppColors.background,

                title: Text(
                  "Select Contacts",
                  style: AppTextStyle.appBarTextStyle,
                ),
                centerTitle: true,
              ),

              SliverList.builder(
                itemCount: 10,
                itemBuilder:
                    (_, index) => SelectContactItem(
                      isLastItem: index == 9,
                      rib: index.toString(),
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}
