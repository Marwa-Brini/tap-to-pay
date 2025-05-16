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
      backgroundColor: const Color.fromARGB(255, 251, 250, 250),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              AspectRatio(
                aspectRatio: 1.1,

                child: Image.asset("assets/image cover.png", fit: BoxFit.cover),
              ),
              Expanded(
                child: Container(
                  color: Colors.black.withOpacity(0.5), // Adjust the opacity
                ),
              ),

              Positioned(
                bottom: 10,

                child: Image.asset("assets/logo1.png", width: 100.w),
              ),
            ],
          ),
          const SizedBox(height: 30),
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
          Spacer(),
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
            padding: EdgeInsets.only(
              left: 15.0,
              right: 15.0,
              bottom: MediaQuery.of(context).viewPadding.bottom + 16,
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
    );
  }
}
