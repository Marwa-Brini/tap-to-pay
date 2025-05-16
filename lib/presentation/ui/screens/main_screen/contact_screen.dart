import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inst_pay/core/style/colors.dart';
import 'package:inst_pay/core/style/text_styles.dart';
import 'package:inst_pay/presentation/state_mangement/drawer_controller.dart';
import 'package:inst_pay/presentation/ui/widgets/contact/contact_item.dart';
import 'package:inst_pay/presentation/ui/widgets/drawer/drawer.dart';
import 'package:inst_pay/presentation/ui/widgets/input/search_input.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final TextEditingController editingController = TextEditingController();

    return GetBuilder(
      init: MainDrawerController(),
      builder: (drawerController) {
        return Scaffold(
          backgroundColor: AppColors.background,

          drawer: const MainDrawer(),
          key: scaffoldKey,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 130.h,
                elevation: 4,
                snap: true,
                pinned: true,
                floating: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SearchInput(
                        hint: 'Who are you searching for?',
                        onChanged: (v) {},
                        controler: editingController,
                      ),
                    ),
                  ),
                ),
                backgroundColor: AppColors.background,
                leading: IconButton(
                  onPressed: () {
                    scaffoldKey.currentState!.openDrawer();
                  },
                  icon: const Icon(Icons.menu, color: AppColors.black),
                ),
                title: Text("Contacts", style: AppTextStyle.appBarTextStyle),
                centerTitle: true,
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        'New Contact',
                        style: AppTextStyle.textButtonStyle,
                      ),
                    ),
                  ),
                ),
              ),
              SliverList.builder(
                itemCount: 10,
                itemBuilder: (_, index) => ContactItem(isLastItem: index == 9),
              ),
            ],
          ),
        );
      },
    );
  }
}
