import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:inst_pay/core/style/colors.dart';
import 'package:inst_pay/core/style/text_styles.dart';
import 'package:inst_pay/core/utils/string_const.dart';
import 'package:inst_pay/presentation/state_mangement/authentication_controller.dart';
import 'package:inst_pay/presentation/ui/screens/authentication/login_screen.dart';
import 'package:inst_pay/presentation/ui/widgets/app_bar/auth_appbar.dart';
import 'package:inst_pay/presentation/ui/widgets/buttons/main_buttons.dart';
import 'package:inst_pay/presentation/ui/widgets/input/input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final cpassword = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    firstname.dispose();
    lastname.dispose();
    email.dispose();
    password.dispose();
    cpassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AuthAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(style: AppTextStyle.titleTextStyle, "Sign up"),
                SizedBox(height: 20),
                Text(
                  style: AppTextStyle.greyTextStyle,
                  "Fill out the information below to create your account",
                ),

                const SizedBox(height: 30),
                InputText(
                  hint: "first name",
                  controler: firstname,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "first name required";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),
                InputText(
                  hint: "last name",
                  controler: lastname,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "last name required";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),
                InputText(
                  hint: "email",
                  type: TextInputType.emailAddress,
                  controler: email,
                  validator: (v) {
                    if ((!v!.endsWith('@gmail.com') &&
                            !v.endsWith('@yahoo.fr') &&
                            !v.endsWith('marwa@marwa.marwa')) ||
                        v.isEmpty) {
                      return "invalid email address";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),
                InputText(
                  hint: "password",
                  isPassword: true,
                  controler: password,
                  validator: (v) {
                    if (v!.length < 8) {
                      return "invalid password";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),
                InputText(
                  hint: "confirm_password",
                  isPassword: true,
                  controler: cpassword,
                  validator: (v) {
                    if (v != password.text || v!.isEmpty) {
                      return "password_does_not_match";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GetBuilder<AuthenticationController>(
                        id: ControllerID.TERMS_AND_CONDITIONS,
                        init: AuthenticationController(),
                        builder: (controller) {
                          return Checkbox(
                            activeColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            value: controller.termsAccepted,
                            onChanged: (value) {
                              controller.aceptTerms(value!);
                            },
                          );
                        },
                      ),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "i_accept ",
                                style: AppTextStyle.smallBlackTextStyle,
                              ),
                              WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: GestureDetector(
                                  onTap: () {
                                    // showDialog(
                                    //   context: context,
                                    //   builder:
                                    //       (_) =>
                                    //           const TermsAndConditionsDialog(),
                                    // );
                                  },
                                  child: Text(
                                    "terms_and_conditions",
                                    style: AppTextStyle.smallBlackTextStyle
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                GetBuilder<AuthenticationController>(
                  init: AuthenticationController(),
                  builder: (controller) {
                    return PrimaryButton(
                      text: "registration",
                      click: () async {
                        if (_formKey.currentState!.validate() &&
                            controller.termsAccepted) {
                          await controller.createAccount().then(
                            (value) => Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (_) => const LoginScreen(),
                              ),
                            ),
                          );
                        } else {
                          Fluttertoast.showToast(
                            msg: "missing_data",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: AppColors.toastColor,
                            textColor: AppColors.white,
                            fontSize: 16.0,
                          );
                        }
                      },
                      color: AppColors.primary,
                    );
                  },
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "connect_to_your_account",
                      textAlign: TextAlign.center,
                      style: AppTextStyle.lightLabelTextStyle,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => const LoginScreen(),
                          ),
                        );
                      },
                      child: Text("login", style: AppTextStyle.redTextStyle),
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
