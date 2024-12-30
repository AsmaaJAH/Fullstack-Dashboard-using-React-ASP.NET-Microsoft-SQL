import 'package:flutter/material.dart';
import 'package:zcportal/constants/app_colors.dart';
import 'package:zcportal/constants/app_enum.dart';
import 'package:zcportal/constants/app_images_paths/app_images_assets.dart';
import 'package:zcportal/constants/app_screen_dimensions.dart';
import 'package:zcportal/presentation_layer/app_snack_bar.dart';
import 'package:zcportal/presentation_layer/widgets/custom_localized_text_widget.dart';
import 'package:zcportal/presentation_layer/widgets/customized_button.dart';
import 'package:zcportal/presentation_layer/widgets/customized_textform_field.dart';

class HRLetterScreen extends StatefulWidget {
  const HRLetterScreen({Key? key}) : super(key: key);

  @override
  State<HRLetterScreen> createState() => _HRLetterScreenState();
}

class _HRLetterScreenState extends State<HRLetterScreen> {
  final TextEditingController _organizationController = TextEditingController();
  String salaryType="";
  String organizationName="";
  String _selectedSalaryType = 'Gross'; // Default selected salary type

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            const Center(
              child: CustomLocalizedTextWidget(
                stringKey: 'Request an HR letter',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Image.asset(AppImagesAssets.progressBar),
            const SizedBox(height: 24.0),

            // Organization Name Field
            const CustomLocalizedTextWidget(
              stringKey: 'Organization Name:',
              fontSize: 16,
              fontWeight: CustomTextWeight.boldFont,
            ),
            const SizedBox(height: 8.0),
            CustomizedTextFormField(
              width: double.infinity,
              controller: _organizationController,
              decoration: InputDecoration(
                hintText: 'The party to whom this is addressed',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 16.0,
                ),
              ),
            ),
            const SizedBox(height: 24.0),

            // Desired Salary Type
            const CustomLocalizedTextWidget(
              stringKey: 'Desired Salary Type:',
              fontSize: 16,
            ),
            const SizedBox(height: 8.0),
            Column(
              children: [
                RadioListTile<String>(
                  shape: RoundedRectangleBorder(
                    side: (_selectedSalaryType == 'Gross')
                        ? BorderSide.none
                        : const BorderSide(
                            color: AppColors.grayBorder, width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  tileColor: (_selectedSalaryType == 'Gross')
                      ? AppColors.lightCyan
                      : AppColors.white,
                  value: 'Gross',
                  groupValue: _selectedSalaryType,
                  onChanged: (value) {
                    setState(() {
                      _selectedSalaryType = value!;
                    });
                  },
                  title: const CustomLocalizedTextWidget(stringKey: 'Gross'),
                  subtitle: const CustomLocalizedTextWidget(
                    stringKey: 'Your total salary',
                    color: AppColors.secondary,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8.0),
                RadioListTile<String>(
                  shape: RoundedRectangleBorder(
                    side: (_selectedSalaryType == 'Net')
                        ? BorderSide.none
                        : const BorderSide(
                            color: AppColors.grayBorder, width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  tileColor: (_selectedSalaryType == 'Net')
                      ? AppColors.lightCyan
                      : AppColors.white,
                  value: 'Net',
                  groupValue: _selectedSalaryType,
                  onChanged: (value) {
                    setState(() {
                      _selectedSalaryType = value!;
                    });
                  },
                  title:
                      const CustomLocalizedTextWidget(stringKey: 'Net Salary'),
                  subtitle: const CustomLocalizedTextWidget(
                    stringKey: 'without taxes and insurance',
                    color: AppColors.secondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24.0),

            // Submit Button
            Center(
              child: CustomizedButton(
                buttonText: 'Submit',
                width: kScreenWidth * 0.9,
                borderRadius: 10,
                onPressed: () {
                  // Handle submit logic
                  organizationName = _organizationController.text;
                  salaryType = _selectedSalaryType;

                  if (organizationName.isEmpty) {
                    AppSnackBar(
                      context: context,
                      message: 'Please enter an organization name',
                      isError: true,
                    ).showAppSnackBar();
                    return;
                  }

                  AppSnackBar(
                    context: context,
                    message:
                        'Request submitted for $organizationName with $salaryType salary type',
                    isError: false,
                  ).showAppSnackBar();
                },
              ),
            ),
            const SizedBox(height: 24.0),

            // Notice Section
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kindly Notice That By submitting this form You’ll Get:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        color:AppColors.primary,
                        size: 20.0,
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: Text(
                          'A confirmation email notification with the date/place receipt.',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        color:AppColors.primary,
                        size: 20.0,
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: Text(
                          'The HR Letter itself after 2 working days.',
                        ),
                      ),
                    ],
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
