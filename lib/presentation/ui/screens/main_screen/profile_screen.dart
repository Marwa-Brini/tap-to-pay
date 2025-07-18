import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:inst_pay/controller/bank_controller.dart';
import 'package:inst_pay/controller/bankaccount_controller.dart';
import 'package:inst_pay/core/style/colors.dart';
import 'package:inst_pay/core/style/text_styles.dart';
import 'package:inst_pay/core/utils/svg.dart';
import 'package:inst_pay/presentation/state_mangement/drawer_controller.dart';
import 'package:inst_pay/presentation/state_mangement/profile_screen_controller.dart';
import 'package:inst_pay/presentation/ui/screens/bank_account/associate_account_screen.dart';
import 'package:inst_pay/presentation/ui/widgets/drawer/drawer.dart';
import 'package:inst_pay/presentation/ui/widgets/profile/bank_account_item.dart';
import 'package:inst_pay/presentation/ui/widgets/profile/invoice_item.dart';
import 'package:inst_pay/presentation/ui/widgets/profile/transaction_history_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return DefaultTabController(
      length: 3, // Number of tabs
      child: GetBuilder(
        init: MainDrawerController(),
        builder: (drawerController) {
          return Scaffold(
            drawer: const MainDrawer(),
            key: scaffoldKey,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: AppColors.background,
              leading: IconButton(
                onPressed: () {
                  scaffoldKey.currentState!.openDrawer();
                },
                icon: const Icon(Icons.menu, color: AppColors.black),
              ),
              title: Text("Profile", style: AppTextStyle.appBarTextStyle),
              centerTitle: true,
            ),

            backgroundColor: AppColors.background,

            body: GetBuilder(
              init: ProfileScreenController(),
              builder: (controller) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        "https://i.pinimg.com/1200x/8b/16/7a/8b167af653c2399dd93b952a48740620.jpg",
                        width: 100.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text("Marwa_BRINI", style: AppTextStyle.boldBlackTextStyle),
                    const SizedBox(height: 5),
                    Text(
                      "marwa_brini@gmail.Com",
                      style: AppTextStyle.greyTextStyle14,
                    ),

                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TabBar(
                        onTap: (value) {
                          controller.selectIndex(value);
                        },
                        labelStyle: AppTextStyle.blackTextStyle14,
                        unselectedLabelColor: AppColors.black,
                        indicatorColor: AppColors.primary,
                        labelPadding: const EdgeInsets.all(5),
                        indicatorWeight: 3,
                        labelColor: AppColors.primary,
                        tabs: const [
                          Text("Accounts"),
                          Text("History"),
                          Text("Invoices"),
                        ],
                      ),
                    ),
                    controller.selectedIndex == 0
                        ? Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 8.0,
                          ),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => AssociateAccountScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'New Account',
                                style: AppTextStyle.textButtonStyle,
                              ),
                            ),
                          ),
                        )
                        : controller.selectedIndex == 1
                        ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SvgPicture.string(
                                APPSVG.listIcon,
                                fit: BoxFit.scaleDown,
                              ),
                              SvgPicture.string(
                                APPSVG.graphIcon,
                                fit: BoxFit.scaleDown,
                              ),
                            ],
                          ),
                        )
                        : const SizedBox(),
                    GetBuilder(
                      init: BankAccountController(),
                      builder: (bankController) {
                        return Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: bankController.bankAccountList.length,
                            itemBuilder:
                                (_, index) => Padding(
                                  padding: const EdgeInsets.only(
                                    right: 20.0,
                                    left: 20.0,
                                    bottom: 10,
                                  ),
                                  child:
                                      controller.selectedIndex == 0
                                          ? BankAccountItem(
                                            bankAccountModel:
                                                bankController
                                                    .bankAccountList[index],
                                          )
                                          : controller.selectedIndex == 1
                                          ? TransactionHistoryItem()
                                          : InvoiceItem(isLastItem: index == 4),
                                ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}



//  body: CustomScrollView(
//           slivers: [
//             SliverAppBar(
//               pinned: true,
             
//             ),
//             SliverToBoxAdapter(
//               child: 
//             ),
//             SliverToBoxAdapter(
//               child: Column(children: [
//                 TextButton(onPressed: (){}, child: Text('data',style: AppTextStyle.greyTextStyle14,))  ,
//                               //Text('data',style: AppTextStyle.appBarTextStyle,),Text('data',style:  AppTextStyle.appBarTextStyle,)
//               ],),
//             ),
//             SliverList.builder(
//               itemBuilder: (_,index)=>Text(index.toString(),style: AppTextStyle.blackTextStyle,))
//           ],
//         ),