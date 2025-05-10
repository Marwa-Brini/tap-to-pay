import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inst_pay/core/style/colors.dart';
import 'package:inst_pay/core/style/text_styles.dart';
import 'package:inst_pay/presentation/ui/screens/authentication/login_screen.dart';
import 'package:inst_pay/presentation/ui/screens/authentication/signup_screen.dart';
import 'package:inst_pay/presentation/ui/widgets/buttons/dropdown.dart';
import 'package:inst_pay/presentation/ui/widgets/buttons/main_buttons.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                AspectRatio(
                  aspectRatio: 1.8,

                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      const Color.fromARGB(93, 91, 90, 90),
                      BlendMode.lighten,
                    ),
                    child: Image.asset(
                      "assets/image cover.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,

                  child: Image.asset("assets/logo1.png", width: 100.w),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text("Welcome!", style: AppTextStyle.titleTextStyle),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Tap to Pay is a secure, contactless way to make payments by simply tapping",
                style: AppTextStyle.greyTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            LanguageInput(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: PrimaryButton(
                color: AppColors.primary,
                text: "login",
                click: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (_) => LoginScreen()));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 5.0,
              ),
              child: PrimaryButton(
                color: AppColors.secondary,
                text: "sign up",
                click: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (_) => SignupScreen()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
