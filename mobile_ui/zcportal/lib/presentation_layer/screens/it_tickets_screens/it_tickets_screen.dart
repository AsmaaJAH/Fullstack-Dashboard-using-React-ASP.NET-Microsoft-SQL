import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:zcportal/constants/app_colors.dart';
import 'package:zcportal/constants/app_enum.dart';
import 'package:zcportal/presentation_layer/screens/it_tickets_screens/single_ticket_screen.dart';
import 'package:zcportal/presentation_layer/screens/it_tickets_screens/ticket_request_screen.dart';
import 'package:zcportal/presentation_layer/widgets/custom_localized_text_widget.dart';

class ItTicketsScreen extends StatelessWidget {
  const ItTicketsScreen({Key? key}) : super(key: key);
  void _onPressedAddTicket(context) {
    // Add new ticket action

    PersistentNavBarNavigator.pushNewScreen(
      context,
      screen: const TicketRequestScreen(),
      withNavBar: true, // OPTIONAL VALUE. True by default.
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Text
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomLocalizedTextWidget(
                  stringKey: "IT Tickets:",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _onPressedAddTicket(context);
                  },
                  child: const CustomLocalizedTextWidget(
                    stringKey: "+ add new..",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6.0),

            // List of Tickets
            Expanded(
              child: ListView(
                children: [
                  // Ticket Items
                  _buildTicketCard(
                      date: "8",
                      month: "Jun",
                      department: "Finance Department-Room1",
                      issue: "Internet Issue",
                      time: "9:00 AM",
                      onTap: () {
                        // Handle ticket tap
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: const SingleTicketScreen(),
                          withNavBar: true, // OPTIONAL VALUE. True by default.
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      }),
                  _buildTicketCard(
                    date: "12",
                    month: "Dec",
                    department: "HR Department - Room 2",
                    issue: "Windows Issue",
                    time: "10:00 AM",
                    onTap: () {},
                  ),
                  _buildTicketCard(
                      date: "18",
                      month: "Jun",
                      department: "Admission Department - Room 1",
                      issue: "IT Support",
                      time: "11:30 AM",
                      onTap: () {}),
                  _buildTicketCard(
                      date: "5",
                      month: "Jan",
                      department: "Libraries Department - Room 2",
                      issue: "HW Issue",
                      time: "12:50 PM",
                      onTap: () {}),
                  _buildTicketCard(
                      date: "14",
                      month: "Jul",
                      department: "Academic Department - Room 3",
                      issue: "SW Issue",
                      time: "1:00 PM",
                      onTap: () {}),
                  _buildTicketCard(
                      date: "8",
                      month: "Jun",
                      department: "Finance Department-Room1",
                      issue: "Internet Issue",
                      time: "9:00 AM",
                      onTap: () {}),
                  _buildTicketCard(
                      date: "12",
                      month: "Dec",
                      department: "HR Department - Room 2",
                      issue: "Windows Issue",
                      time: "10:00 AM",
                      onTap: () {}),
                  _buildTicketCard(
                      date: "18",
                      month: "Jun",
                      department: "Admission Department - Room 1",
                      issue: "IT Support",
                      time: "11:30 AM",
                      onTap: () {}),
                  _buildTicketCard(
                      date: "5",
                      month: "Jan",
                      department: "Libraries Department - Room 2",
                      issue: "HW Issue",
                      time: "12:50 PM",
                      onTap: () {}),
                  _buildTicketCard(
                      date: "14",
                      month: "Jul",
                      department: "Academic Department - Room 3",
                      issue: "SW Issue",
                      time: "1:00 PM",
                      onTap: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

// Helper function to build ticket cards
  Widget _buildTicketCard({
    required String date,
    required String month,
    required String department,
    required String issue,
    required String time,
    required void Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        margin: const EdgeInsets.only(bottom: 12.0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              // Date Circle
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomLocalizedTextWidget(
                      stringKey: date,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    CustomLocalizedTextWidget(
                      stringKey: month,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16.0),

              // Ticket Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomLocalizedTextWidget(
                      stringKey: department,
                      isSoftWrapped: true,
                      isThreeDotsInOverFlow: true,
                      color: const Color.fromARGB(255, 100, 100, 100),
                      fontSize: 16,
                      fontWeight: CustomTextWeight.boldFont,
                    ),
                    const SizedBox(height: 4.0),
                    CustomLocalizedTextWidget(
                      stringKey: issue,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),

              // Time, Delete, and Edit Icons
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomLocalizedTextWidget(
                    stringKey: time,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    children: [
                      // Delete Icon
                      GestureDetector(
                        onTap: () {
                          // Delete action
                        },
                        child: const Icon(
                          Icons.delete,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 8.0), // Spacing between icons

                      // Edit Icon
                      GestureDetector(
                        onTap: () {
                          // Edit action
                        },
                        child: const Icon(
                          Icons.edit,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
