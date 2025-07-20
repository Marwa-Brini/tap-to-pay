import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:inst_pay/controller/authentication_controller.dart';
import 'package:inst_pay/core/style/colors.dart';
import 'package:inst_pay/core/style/text_styles.dart';
import 'package:inst_pay/view/screen/main_screen/profile_screen.dart';

class LockScreen extends StatelessWidget {
  const LockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        actions: [
          GetBuilder(
            init: AuthenticationController(),
            builder: (controller) {
              return IconButton(
                onPressed: () async {
                  try {
                    final result = await controller.authenticate();
                    if (result) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => ProfileScreen()),
                      );
                    }
                  } catch (e) {
                    print(e.toString());
                  }
                },
                icon: Icon(Icons.fingerprint),
              );
            },
          ),
        ],
      ),
      body: GetBuilder(
        init: AuthenticationController(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Welcome back!', style: AppTextStyle.titleTextStyle),
                const SizedBox(height: 10),
                Text(
                  'Enter your pin or use finguerprint to login ',
                  style: AppTextStyle.greyTextStyle,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder:
                        (_, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: CircleAvatar(
                            backgroundColor:
                                index < controller.pinInput.length
                                    ? AppColors.primary
                                    : AppColors.lightgrey,
                            radius: 14,
                          ),
                        ),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(20),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                          childAspectRatio: 1,
                        ),
                    itemCount: controller.keys.length,
                    itemBuilder: (context, index) {
                      final key = controller.keys[index];
                      return GestureDetector(
                        onTap:
                            key == ''
                                ? null
                                : () async {
                                  if (index == 11) {
                                    if (controller.pinInput.isNotEmpty) {
                                      controller.deleteFromPin();
                                    }
                                  } else {
                                    if (controller.pinInput.length < 4) {
                                      controller.addToPin(key);
                                    }
                                  }

                                  if (controller.pinInput.length == 4) {
                                    if (controller.pinInput ==
                                        controller.currentUser!.pin
                                            .toString()) {
                                      await Future.delayed(
                                        const Duration(milliseconds: 200),
                                      );
                                      // ignore: use_build_context_synchronously
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (_) => ProfileScreen(),
                                        ),
                                      );
                                    } else {
                                      await Future.delayed(
                                        const Duration(milliseconds: 200),
                                      );

                                      controller.resetPin();
                                      Fluttertoast.showToast(
                                        msg: "Wrong Pin",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                    }
                                  }
                                },

                        child: Container(
                          decoration: BoxDecoration(
                            //color: key == '' ? Colors.transparent : Colors.grey[300],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            key,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: key == '⌫' ? Colors.red : Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
