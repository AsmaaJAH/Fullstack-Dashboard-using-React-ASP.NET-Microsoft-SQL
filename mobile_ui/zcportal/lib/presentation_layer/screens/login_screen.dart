import 'package:flutter/material.dart';
import 'package:zcportal/constants/app_colors.dart';
import 'package:zcportal/constants/app_enum.dart';
import 'package:zcportal/constants/app_images_paths/app_images_assets.dart';
import 'package:zcportal/constants/app_screen_dimensions.dart';
import 'package:zcportal/constants/variables.dart';
import 'package:zcportal/control_layer/functions/provider_helper_functions.dart';
import 'package:zcportal/presentation_layer/screens/persist_tab_view.dart';
import 'package:zcportal/presentation_layer/widgets/custom_localized_text_widget.dart';
import 'package:zcportal/presentation_layer/widgets/customized_button.dart';
import 'package:zcportal/presentation_layer/widgets/customized_textform_field.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 7, 223, 252),
              Color.fromARGB(255, 13, 67, 74)
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo and Title
            Column(
              children: [
                Image.asset(
                  AppImagesAssets.splachScreenLogoPath,
                ),
                const SizedBox(height: 10),
                const CustomLocalizedTextWidget(
                  stringKey: 'ZC Portal',
                  fontSize: Variables.double24,
                  color: AppColors.white,
                  fontWeight: CustomTextWeight.boldFont,
                ),
              ],
            ),
            const SizedBox(height: 40),
            // Login Form
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  // Email Input
                  CustomizedTextFormField(
                    label: 'Email*',
                    labelColor: AppColors.white,
                    hintColor: AppColors.black,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.white,
                      hintText: "E-Mail...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Password Input
                  CustomizedTextFormField(
                    obscureText: !_isPasswordVisible,
                    isObsecuredPasswordForm: true,
                    label: 'Password*',
                    labelColor: AppColors.white,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                      filled: true,
                      fillColor: AppColors.white,
                      hintText: "Password...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomizedButton(
                    width: kScreenWidth * 0.25,
                    buttonText: "Login",
                    onPressed: () {
                      ProviderHelperFunctions.readCurrentProviderState(
                        currentOperation: Variables.accountProvider,
                      );
                      ProviderHelperFunctions.readCurrentProviderState(
                        currentOperation: Variables.persistTabViewProvider,
                      );

                      ProviderHelperFunctions.accountProvider
                          .updateAuthMode(AuthMode.authorized);
                      ProviderHelperFunctions.persistState
                          .updateIsHidden(false);

                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const PersistTabView(),
                        ),
                      );
                    },
                    borderRadius: 30,
                    elevation: 100,
                    textColor: AppColors.secondary,
                    backgroundColor: AppColors.offWhiteBackground,
                  ),
                ],
              ),
            ),
            // Forgot Password
            CustomizedButton(
              width: kScreenWidth * 0.5,
              backgroundColor: AppColors.transparent,
              fontWeight: CustomTextWeight.regularFont,
              onPressed: () {},
              buttonText: 'Forgot Password ?',
            ),
          ],
        ),
      ),
    );
  }
}
