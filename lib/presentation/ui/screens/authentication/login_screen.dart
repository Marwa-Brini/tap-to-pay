import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:inst_pay/core/style/colors.dart';
import 'package:inst_pay/core/style/text_styles.dart';
import 'package:inst_pay/core/utils/svg.dart';
import 'package:inst_pay/presentation/ui/screens/authentication/signup_screen.dart';
import 'package:inst_pay/presentation/ui/screens/main_screen/profile_screen.dart';
import 'package:inst_pay/presentation/ui/widgets/app_bar/auth_appbar.dart';
import 'package:inst_pay/presentation/ui/widgets/buttons/main_buttons.dart';
import 'package:inst_pay/presentation/ui/widgets/input/input.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AuthAppbar(),
      body: SafeArea(
        child: Form(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Login", style: AppTextStyle.titleTextStyle),
                          const SizedBox(height: 10),
                          Text(
                            "Enter your username and password or use finguerprint to login",
                            style: AppTextStyle.greyTextStyle,
                          ),
                          const SizedBox(height: 40),
                          InputText(hint: "username", leading: APPSVG.userIcon),
                          const SizedBox(height: 20),
                          InputText(
                            hint: "password",
                            isPassword: true,
                            leading: APPSVG.lockIcon,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},

                              child: Text(
                                'Forget password',
                                style: AppTextStyle.smallGreyTextStyle,
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          PrimaryButton(
                            click: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => ProfileScreen(),
                                ),
                              );
                            },
                            text: "Login",
                            color: AppColors.primary,
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "don't have account? ",
                                style: AppTextStyle.smallGreyTextStyle,
                                textAlign: TextAlign.center,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => SignupScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Signup',
                                  style: AppTextStyle.smallRedTextStyle,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
