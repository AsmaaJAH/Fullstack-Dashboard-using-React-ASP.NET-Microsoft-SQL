import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:zcportal/constants/app_colors.dart';
import 'package:zcportal/constants/app_forms_keys.dart';
import 'package:zcportal/constants/app_images_paths/app_images_assets.dart';
import 'package:zcportal/constants/app_screen_dimensions.dart';
import 'package:zcportal/constants/variables.dart';
import 'package:zcportal/presentation_layer/app_snack_bar.dart';
import 'package:zcportal/presentation_layer/widgets/custom_localized_text_widget.dart';
import 'package:zcportal/presentation_layer/widgets/customized_button.dart';
import 'package:file_picker/file_picker.dart';

class LeaveRequestScreen extends StatefulWidget {
  const LeaveRequestScreen({super.key});
  @override
  State<LeaveRequestScreen> createState() {
    return _LeaveRequestScreenState();
  }
}

class _LeaveRequestScreenState extends State<LeaveRequestScreen> {
  final TextEditingController _fromDateController = TextEditingController();
  final TextEditingController _toDateController = TextEditingController();
  final TextEditingController _delegatedController = TextEditingController();
    final TextEditingController _fileURLController = TextEditingController();

  String? _selectedLeaveType;
  var _fromDate = '';
  var _toDate = '';
  var _employeeName = "";
  var _enteredURL = "";

  final List<String> _leaveTypes = Variables.leaveTypes;
  bool _isRepetitive = false;

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2026),
    );
    if (pickedDate != null) {
      setState(() {
        controller.text = DateFormat('EEE, MMM d, yyyy').format(pickedDate);
      });
    }
  }

  void _submitForm() {
    if (AppFormsKeys.leaveRequestFormKey.currentState?.validate() ?? false) {
      // Save the form fields
      AppFormsKeys.leaveRequestFormKey.currentState?.save();

      // Reset the form fields
      AppFormsKeys.leaveRequestFormKey.currentState?.reset();
      _fromDateController.clear();
      _toDateController.clear();
      _delegatedController.clear();
      _fileURLController.clear();


      setState(() {
        _selectedLeaveType = null;
        _isRepetitive = false;
      });
      AppSnackBar(
        context: context,
        message: 'Form Submitted Successfully!',
        isError: false,
      ).showAppSnackBar();
    } else {
      AppSnackBar(
        context: context,
        message: 'Please correct the errors in the form',
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
            key: AppFormsKeys.leaveRequestFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: CustomLocalizedTextWidget(
                    stringKey: 'Leave Request',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Image.asset(AppImagesAssets.progressBar),
                const SizedBox(height: 24.0),
                const CustomLocalizedTextWidget(
                  stringKey: 'From',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: _fromDateController,
                  readOnly: true,
                  onTap: () => _selectDate(context, _fromDateController),
                  onSaved: (value) {
                    _fromDate = _fromDateController.text;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Kindly, Enter a valid date.';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Select a date',
                    prefixIcon: const Icon(Icons.calendar_today),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 16.0,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const CustomLocalizedTextWidget(
                  stringKey: 'To',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: _toDateController,
                  readOnly: true,
                  onTap: () => _selectDate(context, _toDateController),
                  onSaved: (value) {
                    _toDate = _fromDateController.text;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Kindly, Enter a valid date.';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Select a date',
                    prefixIcon: const Icon(Icons.calendar_today),
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
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8.0),
                DropdownButtonFormField<String>(
                  value: _selectedLeaveType,
                  hint: const CustomLocalizedTextWidget(
                      stringKey: "Choose The Leave Type"),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  items: _leaveTypes
                      .map((type) => DropdownMenuItem(
                            value: type,
                            child: CustomLocalizedTextWidget(
                              stringKey: type,
                            ),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedLeaveType = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                const CustomLocalizedTextWidget(
                  stringKey: 'Delegated Employee or Replacement',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  cursorColor: AppColors.secondary,
                  onSaved: (newValue) {
                    _employeeName = newValue!;
                  },
                  controller: _delegatedController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Checkbox(
                      activeColor: AppColors.primary,
                      value: _isRepetitive,
                      onChanged: (value) {
                        setState(() {
                          _isRepetitive = value!;
                        });
                      },
                    ),
                    const CustomLocalizedTextWidget(
                      stringKey: 'Repetitive absence.',
                      color: AppColors.black,
                      fontSize: 16,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () async {
                    // Handle multiple files upload:
                    FilePickerResult? result = await FilePicker.platform
                        .pickFiles(allowMultiple: true);

                    if (result != null) {
                      // ignore: unused_local_variable
                      List<File> files =
                          result.paths.map((path) => File(path!)).toList();
                    } else {
                      // User canceled the picker
                      debugPrint('File picking canceled');
                    }
                  },
                  child: DottedBorder(
                    color: AppColors.secondary,
                    strokeWidth: 1,
                    dashPattern: const [5, 5],
                    child: Container(
                      height: kScreenHeight * 0.25,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: kScreenWidth * 0.2,
                            height: kScreenWidth * 0.1,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(30, 111, 111, 111),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Icon(
                              Icons.cloud_upload,
                              size: 32,
                              color: AppColors.gray,
                            ),
                          ),
                          const SizedBox(height: 18),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Click here',
                                  style: TextStyle(
                                    color: AppColors
                                        .secondary, // Set the color to blue
                                    fontWeight: FontWeight
                                        .bold, // Optional: Make it bold
                                  ),
                                ),
                                TextSpan(
                                  text: ' to upload or drop files here',
                                  style: TextStyle(
                                    color: Colors
                                        .black, // Default color for the remaining text
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                                const SizedBox(height: 8.0),

                const CustomLocalizedTextWidget(
                  stringKey: 'File URL',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  cursorColor: AppColors.secondary,
                  onSaved: (newValue) {
                    _enteredURL = newValue!;
                  },
                  controller: _fileURLController,
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: AppColors.grayBorder),
                    hintText: "The attachments google drive link",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: CustomizedButton(
                    borderRadius: 10,
                    width: kScreenWidth * 0.85,
                    buttonText: "Submit",
                    onPressed: _submitForm,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
