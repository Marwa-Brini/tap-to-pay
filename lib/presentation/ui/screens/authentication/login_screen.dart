import 'package:flutter/material.dart';
import 'package:inst_pay/core/style/colors.dart';
import 'package:inst_pay/core/style/text_styles.dart';
import 'package:inst_pay/presentation/ui/screens/authentication/signup_screen.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Login", style: AppTextStyle.titleTextStyle),
                const SizedBox(height: 10),
                Text(
                  "Enter your username and password or use finguerprint to login",
                  style: AppTextStyle.greyTextStyle,
                ),
                const SizedBox(height: 30),
                InputText(hint: "username"),
                const SizedBox(height: 20),
                InputText(hint: "password", isPassword: true),
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
                  click: () {},
                  text: "Login",
                  color: AppColors.primary,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("don't have account? ", textAlign: TextAlign.center),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => SignupScreen()),
                        );
                      },
                      child: Text('Signup', style: AppTextStyle.redTextStyle),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
