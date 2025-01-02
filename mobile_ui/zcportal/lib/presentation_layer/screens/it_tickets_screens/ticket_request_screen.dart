import 'package:flutter/material.dart';
import 'package:zcportal/constants/app_colors.dart';
import 'package:zcportal/constants/app_enum.dart';
import 'package:zcportal/constants/app_forms_keys.dart';
import 'package:zcportal/constants/app_images_paths/app_images_assets.dart';
import 'package:zcportal/constants/app_screen_dimensions.dart';
import 'package:zcportal/constants/variables.dart';
import 'package:zcportal/presentation_layer/app_snack_bar.dart';
import 'package:zcportal/presentation_layer/widgets/custom_localized_text_widget.dart';
import 'package:zcportal/presentation_layer/widgets/customized_button.dart';

class TicketRequestScreen extends StatefulWidget {
  const TicketRequestScreen({super.key});

  @override
  State<TicketRequestScreen> createState() => _TicketRequestScreenState();
}

class _TicketRequestScreenState extends State<TicketRequestScreen> {
  var _enteredRoomName = '';
  var _enteredDescription = '';
  var _enteredType = '';
  var _enteredDepartment = '';
  void _onPressSubmit() {
    if (AppFormsKeys.ticketRequestFormKey.currentState!.validate()) {
      AppFormsKeys.ticketRequestFormKey.currentState!.save();
      // Reset the form after submission
      AppFormsKeys.ticketRequestFormKey.currentState!.reset();
      AppSnackBar(
        context: context,
        message: "Submitted Successfully",
        isError: false,
      ).showAppSnackBar();
    } else {
      AppSnackBar(
        context: context,
        message: "Failed",
        isError: true,
      ).showAppSnackBar();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: AppFormsKeys.ticketRequestFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        AppImagesAssets
                            .ticketRequest, // Replace with your image asset
                      ),
                    ),
                    const SizedBox(height: 18),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: AppColors.lightCyan,
                      ),
                      child: const CustomLocalizedTextWidget(
                        stringKey:
                            'Do you need help in a technical issue? If yes, fill the following form with the details.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const CustomLocalizedTextWidget(
                  stringKey: 'Department Name',
                  fontSize: 16,
                  fontWeight: CustomTextWeight.boldFont,
                ),
                const SizedBox(height: 8.0),
                DropdownButtonFormField<String>(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a department.';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _enteredDepartment = newValue!;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Choose Department ',
                    border: OutlineInputBorder(),
                  ),
                  items: Variables.departments.map((department) {
                    return DropdownMenuItem(
                      value: department,
                      child: Text(department),
                    );
                  }).toList(),
                  onChanged: (value) {
                    // Handle selection
                  },
                ),
                const SizedBox(height: 16),
                const CustomLocalizedTextWidget(
                  stringKey: 'Place / Room No.',
                  fontSize: 16,
                  fontWeight: CustomTextWeight.boldFont,
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  cursorColor: AppColors.secondary,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the place or the room No.';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _enteredRoomName = newValue!;
                  },
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(
                        color: AppColors.grayHintFormField, fontSize: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 16.0,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const CustomLocalizedTextWidget(
                  stringKey: 'Type',
                  fontSize: 16,
                  fontWeight: CustomTextWeight.boldFont,
                ),
                const SizedBox(height: 8.0),
                DropdownButtonFormField<String>(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a ticket type.';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _enteredType = newValue!;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  items: Variables.ticketTypes.map((ticketType) {
                    return DropdownMenuItem(
                      value: ticketType,
                      child: Text(ticketType),
                    );
                  }).toList(),
                  onChanged: (value) {
                    // Handle selection
                  },
                ),
                const SizedBox(height: 16),
                const CustomLocalizedTextWidget(
                  stringKey: 'Ticket Description',
                  fontSize: 16,
                  fontWeight: CustomTextWeight.boldFont,
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  cursorColor: AppColors.secondary,
                  onSaved: (newValue) {
                    _enteredDescription = newValue!;
                  },
                  maxLines: 3,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: CustomizedButton(
                    borderRadius: 10,
                    width: kScreenWidth * 0.8,
                    buttonText: "Submit",
                    onPressed: _onPressSubmit,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
