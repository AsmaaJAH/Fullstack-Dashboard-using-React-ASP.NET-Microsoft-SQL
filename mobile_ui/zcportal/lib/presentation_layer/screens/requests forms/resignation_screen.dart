import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zcportal/constants/app_colors.dart';
import 'package:zcportal/constants/app_forms_keys.dart';
import 'package:zcportal/constants/app_images_paths/app_images_assets.dart';
import 'package:zcportal/constants/app_screen_dimensions.dart';
import 'package:zcportal/constants/variables.dart';
import 'package:zcportal/presentation_layer/app_snack_bar.dart';
import 'package:zcportal/presentation_layer/widgets/custom_localized_text_widget.dart';
import 'package:zcportal/presentation_layer/widgets/customized_button.dart';

class ResignationScreen extends StatefulWidget {
  const ResignationScreen({Key? key}) : super(key: key);

  @override
  State<ResignationScreen> createState() => _ResignationScreenState();
}

class _ResignationScreenState extends State<ResignationScreen> {
  final TextEditingController _nationalIdController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  String? _selectedDepartment;
  bool _approvalSwitch = false;
  bool _agreeToTerms = false;
  // ignore: unused_field
  var _enteredNationalID = '';
  // ignore: unused_field
  var _enteredDate = '';
  // ignore: unused_field
  var _enteredReason = '';

  final List<String> _departments = Variables.departments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: AppFormsKeys.resignationFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              const Center(
                child: CustomLocalizedTextWidget(
                  stringKey: 'Resignation Letter',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Image.asset(AppImagesAssets.progressBar),
              const SizedBox(height: 24.0),

              // National ID Field
              const CustomLocalizedTextWidget(
                stringKey: 'National ID',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length != 14) {
                    return 'Must consist of 14 numbers.';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _enteredNationalID = newValue!;
                },
                //width: double.infinity,
                controller: _nationalIdController,
                decoration: InputDecoration(
                  hintText: 'Enter Your National ID',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0,
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16.0),

              // Date Picker
              const CustomLocalizedTextWidget(
                stringKey: 'Date Of The First Off-Day',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: _dateController,
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2024),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('EEE, MMM d, yyyy').format(pickedDate);
                    setState(() {
                      _dateController.text = formattedDate;
                    });
                  }
                },
                onSaved: (value) {
                  _enteredDate = _dateController.text;
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
              const SizedBox(height: 16.0),
              // Department Dropdown
              const CustomLocalizedTextWidget(
                stringKey: 'Department',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8.0),
              DropdownButtonFormField<String>(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kindly, choose your department.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _selectedDepartment = value!;
                },
                value: _selectedDepartment,
                hint: const Text('Choose Your Department'),
                items: _departments.map((dept) {
                  return DropdownMenuItem(
                    value: dept,
                    child: Text(dept),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedDepartment = value;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),

              // Reason Field
              const CustomLocalizedTextWidget(
                stringKey: 'Reason',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: _reasonController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Please enter resignation reason',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  contentPadding: const EdgeInsets.all(16.0),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 10 ||
                      value.trim().length > 500) {
                    return 'Must be between 10 and 500 characters.';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _enteredReason = newValue!;
                },
              ),
              const SizedBox(height: 16.0),

              // Approval Switch
              Row(
                children: [
                  const Expanded(
                    child: CustomLocalizedTextWidget(
                      stringKey: 'I got the approval of my direct manager.',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  Switch(
                    activeTrackColor: AppColors.primary,
                    value: _approvalSwitch,
                    onChanged: (value) {
                      setState(() {
                        _approvalSwitch = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16.0),

              // Terms and Conditions Checkbox
              Row(
                children: [
                  Checkbox(
                    activeColor: AppColors.primary,
                    value: _agreeToTerms,
                    onChanged: (value) {
                      setState(() {
                        _agreeToTerms = value!;
                      });
                    },
                  ),
                  const Expanded(
                    child: CustomLocalizedTextWidget(
                      stringKey:
                          'By checking this box, I am agreeing to the ZC terms & policy regarding my resignation.',
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),

              // Apply Resignation Button
              Center(
                child: CustomizedButton(
                  buttonText: 'Apply Resignation',
                  borderRadius: 10,
                  width: kScreenWidth * 0.9,
                  onPressed: () {
                    if (_validateForm()) {
                      setState(() {
                        AppFormsKeys.resignationFormKey.currentState!.reset();
                        //Clear all controllers
                        _nationalIdController.clear();
                        _reasonController.clear();
                        _dateController.clear();

                        // Reset dropdown, switches, and checkbox
                        _selectedDepartment = null;
                        _approvalSwitch = false;
                        _agreeToTerms = false;
                      });
                      AppSnackBar(
                        context: context,
                        message: 'Resignation Submitted',
                        isError: false,
                      ).showAppSnackBar();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _validateForm() {
    if (_nationalIdController.text.isEmpty) {
      _showError('Please enter your National ID');
      return false;
    }
    if (_dateController.text.isEmpty) {
      _showError('Please select a date for your first off-day');
      return false;
    }
    if (_selectedDepartment == null) {
      _showError('Please select a department');
      return false;
    }
    if (_reasonController.text.isEmpty) {
      _showError('Please provide a reason for resignation');
      return false;
    }
    if (!_approvalSwitch) {
      _showError('Please confirm approval from your direct manager');
      return false;
    }
    if (!_agreeToTerms) {
      _showError('You must agree to the terms and policy');
      return false;
    }
    if (AppFormsKeys.resignationFormKey.currentState!.validate()) {
      AppFormsKeys.resignationFormKey.currentState!.save();
      return true;
    } else {
      return false;
    }
  }

  void _showError(String message) {
    AppSnackBar(
      context: context,
      message: message,
      isError: true,
    ).showAppSnackBar();
  }
}
