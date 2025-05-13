import 'package:flutter/material.dart';
import 'package:inst_pay/core/style/colors.dart';
import 'package:inst_pay/core/style/text_styles.dart';
import 'package:inst_pay/presentation/ui/screens/authentication/landing_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  Future<void> init(BuildContext context, int duration) async {
    Future.delayed(Duration(seconds: duration), () {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (_) => const LandingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: FutureBuilder(
          future: init(context, 3),
          builder: (context, snapshot) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(),
                    Image.asset("assets/Sibtel.png"),
                    Text(
                      "For fast and secure transactions",
                      style: AppTextStyle.greyTextStyle,
                    ),
                    Spacer(),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Secured by',
                            style: AppTextStyle.smallGreyTextStyle,
                          ),
                          TextSpan(
                            text: ' SIBTEL',
                            style: AppTextStyle.smallRedTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
