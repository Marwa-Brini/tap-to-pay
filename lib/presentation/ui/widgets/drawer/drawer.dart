import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inst_pay/core/utils/svg.dart';
import 'package:inst_pay/presentation/state_mangement/drawer_controller.dart';
import 'package:inst_pay/presentation/ui/screens/main_screen/contact_screen.dart';
import 'package:inst_pay/presentation/ui/screens/main_screen/profile_screen.dart';
import 'package:inst_pay/presentation/ui/screens/main_screen/transaction_screen.dart';
import 'package:inst_pay/presentation/ui/screens/payment/payment_screen.dart';
import 'package:inst_pay/presentation/ui/widgets/drawer/drawer_item.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MainDrawerController(),
      builder: (controller) {
        return SafeArea(
          child: Drawer(
            child: Column(
              children: [
                DrawerItem(
                  label: 'Profile',
                  icon: APPSVG.profileIcon,
                  index: 0,
                  onTap: () {
                    controller.selectDrawerItem(0);
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const ProfileScreen()),
                    );
                  },
                  groupeIndex: controller.groupeValue,
                ),
                DrawerItem(
                  label: 'Contacts',
                  icon: APPSVG.contactIcon,
                  index: 1,
                  onTap: () {
                    controller.selectDrawerItem(1);
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const ContactScreen()),
                    );
                  },
                  groupeIndex: controller.groupeValue,
                ),
                DrawerItem(
                  label: 'Transactions',
                  icon: APPSVG.transactionIcon,
                  index: 2,
                  onTap: () {
                    controller.selectDrawerItem(2);
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => const TransactionScreen(),
                      ),
                    );
                  },
                  groupeIndex: controller.groupeValue,
                ),
                DrawerItem(
                  label: 'Payment',
                  icon: APPSVG.paymentIcon,
                  index: 3,
                  onTap: () {
                    controller.selectDrawerItem(3);
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const PaymentScreen()),
                    );
                  },
                  groupeIndex: controller.groupeValue,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Divider(thickness: 2),
                ),
                DrawerItem(
                  label: 'Settings',
                  icon: APPSVG.settingsIcon,
                  index: 4,
                  onTap: () {
                    controller.selectDrawerItem(1);
                  },
                  groupeIndex: controller.groupeValue,
                ),
                DrawerItem(
                  label: 'Notifications',
                  icon: APPSVG.notificationIcon,
                  index: 5,
                  onTap: () {
                    controller.selectDrawerItem(1);
                  },
                  groupeIndex: controller.groupeValue,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Divider(thickness: 2),
                ),
                DrawerItem(
                  label: 'Support',
                  icon: APPSVG.supportIcon,
                  index: 6,
                  onTap: () {
                    controller.selectDrawerItem(1);
                  },
                  groupeIndex: controller.groupeValue,
                ),
                DrawerItem(
                  label: 'Share',
                  icon: APPSVG.shareIcon,
                  index: 7,
                  onTap: () {
                    controller.selectDrawerItem(1);
                  },
                  groupeIndex: controller.groupeValue,
                ),
                DrawerItem(
                  label: 'Rate Us',
                  icon: APPSVG.rateUsIcon,
                  index: 8,
                  onTap: () {
                    controller.selectDrawerItem(1);
                  },
                  groupeIndex: controller.groupeValue,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Divider(thickness: 2),
                ),
                DrawerItem(
                  label: 'Logout',
                  icon: APPSVG.logoutIcon,
                  index: 9,
                  onTap: () {
                    controller.selectDrawerItem(1);
                  },
                  groupeIndex: controller.groupeValue,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
