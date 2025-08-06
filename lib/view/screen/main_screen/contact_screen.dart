import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inst_pay/controller/contact_controller.dart';
import 'package:inst_pay/core/style/colors.dart';
import 'package:inst_pay/core/style/text_styles.dart';
import 'package:inst_pay/controller/drawer_controller.dart';
import 'package:inst_pay/view/widget/contact/contact_item.dart';
import 'package:inst_pay/view/widget/dialog/add_contact_dialog.dart';
import 'package:inst_pay/view/widget/drawer/drawer.dart';
import 'package:inst_pay/view/widget/input/search_input.dart';

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
          body: GetBuilder(
            init: ContactController(),
            builder: (contactController) {
              return FutureBuilder(
                future: contactController.getContacts(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return CustomScrollView(
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
                                  onChanged: (v) {
                                    contactController.searchContact(v!);
                                  },
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
                            icon: const Icon(
                              Icons.menu,
                              color: AppColors.black,
                            ),
                          ),
                          title: Text(
                            "Contacts",
                            style: AppTextStyle.appBarTextStyle,
                          ),
                          centerTitle: true,
                        ),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (_) => AddContactDialog(),
                                  );
                                },
                                child: Text(
                                  'New Contact',
                                  style: AppTextStyle.textButtonStyle,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SliverList.builder(
                          itemCount: contactController.filterContact.length,
                          itemBuilder:
                              (_, index) => ContactItem(
                                isLastItem:
                                    index ==
                                    contactController.filterContact.length - 1,
                                contact: contactController.filterContact[index],
                              ),
                        ),
                      ],
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return Text('ereur');
                  }
                },
              );
            },
          ),
        );
      },
    );
  }
}
