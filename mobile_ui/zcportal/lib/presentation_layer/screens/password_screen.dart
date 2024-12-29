import 'package:flutter/material.dart';
import 'package:zcportal/constants/app_colors.dart';
import 'package:zcportal/constants/app_enum.dart';
import 'package:zcportal/constants/app_images_paths/app_images_assets.dart';
import 'package:zcportal/presentation_layer/widgets/custom_localized_text_widget.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: const CustomLocalizedTextWidget(
          stringKey: 'Password',
          fontSize: 20,
          fontWeight: CustomTextWeight.boldFont,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppImagesAssets.password, // Replace with your asset path
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.only(top: 16),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 7, 223, 252),
                    Color.fromARGB(255, 13, 67, 74)
                  ],
                ),
              ),
              child: Column(
                children: [
                  const CustomLocalizedTextWidget(
                    stringKey:
                        "Here are the steps to edit & reset your password:",
                    color: AppColors.white,
                    fontWeight: CustomTextWeight.boldFont,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    color: AppColors.white,
                    width: double.infinity,
                    height: 5,
                  ),
                  const SizedBox(height: 10),
                 const  Padding(
                    padding:  EdgeInsets.fromLTRB( 10, 0, 10.0,10.0),
                    child:  CustomLocalizedTextWidget(
                      stringKey:
                          '•	Open Google Chrome or your favourite browser. \n'
                          '•	Search by the keyword: “Office 365” and select the first link that will appear to you. \n'
                          '•	Click “Sign in” and enter your academic email, ex: “someone@zewailcity.edu.eg”.\n'
                          '•	Click next.\n'
                          '•	Click “Forget Password” and follow its steps to change your old password.\n',
                      color: AppColors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
