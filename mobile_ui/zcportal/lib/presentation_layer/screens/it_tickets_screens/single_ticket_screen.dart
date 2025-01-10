import 'package:flutter/material.dart';
import 'package:zcportal/constants/app_colors.dart';
import 'package:zcportal/constants/app_enum.dart';
import 'package:zcportal/constants/app_images_paths/app_images_assets.dart';
import 'package:zcportal/constants/app_screen_dimensions.dart';
import 'package:zcportal/presentation_layer/widgets/custom_localized_text_widget.dart';

class SingleTicketScreen extends StatefulWidget {
  const SingleTicketScreen({super.key});

  @override
  State<SingleTicketScreen> createState() => _SingleTicketScreenState();
}

class _SingleTicketScreenState extends State<SingleTicketScreen> {
  bool _isExpanded = false; // Tracks whether the text is expanded or not


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Stack(
            children: [
              Image.asset(AppImagesAssets.singleTicket),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(AppImagesAssets.ticketRequest),
                    const SizedBox(
                      height: 15,
                    ),
                    const CustomLocalizedTextWidget(
                      stringKey: "Seeking IT help:",
                      color: AppColors.black,
                      fontWeight: CustomTextWeight.boldFont,
                      fontSize: 16,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const CustomLocalizedTextWidget(
                      stringKey: "Description:",
                      color: AppColors.white,
                      fontSize: 14,
                    ),
                    
                   SizedBox(
                      width: kScreenWidth * 0.8,
                      child: Text.rich(
                        TextSpan(
                          text: _isExpanded
                              ? 'Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem ipsum has been the industry\'s standard dummy text for centuries. '
                              : 'Lorem ipsum is simply dummy text of the printing and typesetting industry...',
                          style: const TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          children: [
                            WidgetSpan(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isExpanded = !_isExpanded;
                                  });
                                },
                                child: Text(
                                  _isExpanded ? " Read less" : " Read more",
                                  style: const TextStyle(
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: kScreenHeight * 0.15,
                    ),
                    SizedBox(
                      width: kScreenWidth * 0.7,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LabelWithValue(
                                  label: "Department Name", value: "Finance"),
                              SizedBox(
                                height: 15,
                              ),
                              LabelWithValue(
                                  label: "Date", value: "Nov 15 2023"),
                              SizedBox(
                                height: 15,
                              ),
                              LabelWithValue(label: "Place", value: "Room 1"),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LabelWithValue(
                                  label: "Ticket ID", value: "CLD09738PL"),
                              SizedBox(
                                height: 15,
                              ),
                              LabelWithValue(label: "Time", value: "9:00 PM"),
                              SizedBox(
                                height: 15,
                              ),
                              LabelWithValue(
                                  label: "Type", value: "Internet Issue"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LabelWithValue extends StatelessWidget {
  const LabelWithValue({
    super.key,
    required this.label,
    required this.value,
  });
  final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomLocalizedTextWidget(
          stringKey: label,
          color: AppColors.white,
          fontSize: 14,
        ),
        CustomLocalizedTextWidget(
          stringKey: value,
          color: AppColors.black,
          fontSize: 14,
          fontWeight: CustomTextWeight.boldFont,
        )
      ],
    );
  }
}
