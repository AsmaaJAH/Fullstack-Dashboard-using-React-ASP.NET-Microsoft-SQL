//-------------------------- Flutter Packages Imports ----------------------------------

import 'package:flutter/material.dart';
import 'package:zcportal/constants/app_colors.dart';
import 'package:zcportal/constants/app_enum.dart';
import 'package:zcportal/constants/variables.dart';
import 'package:zcportal/presentation_layer/app_dialog.dart';
import 'package:zcportal/presentation_layer/app_overlay_builder.dart';
import 'package:zcportal/presentation_layer/app_snack_bar.dart';
import 'package:zcportal/presentation_layer/widgets/customized_appbar.dart';
import 'package:zcportal/presentation_layer/widgets/customized_button.dart';
import 'package:zcportal/presentation_layer/widgets/customized_textform_field.dart';
import 'package:zcportal/presentation_layer/widgets/linear_circular_progress_indicator.dart';


//=================================================================================
//------------- Hello, I am just a debuger-tester for developer, so Kindly ----------------
//------------------- delete me after making sure that all the file-----------------------------
//----------------------------------- structures works well ------------------------------------
//==================================================================================
class DeleteMe extends StatefulWidget {
  const DeleteMe({super.key, this.title ="Title"});

  final String title;

  @override
  State<DeleteMe> createState() => _DeleteMeState();
}

class _DeleteMeState extends State<DeleteMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomizedAppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // -------------------------- debuging test: -----------------------

            const CustomizedTextFormField(
              width: 350,
              suffix: Text("suffix"),
              hint: "enterYourDataHere",
              label: "placeHolderTester",
              isMorePaddingUnderLabel: false,
              givenHeight: Variables.double44,
            ),
            const SizedBox(
              height: Variables.double20,
            ),
            CustomizedButton(
                width: Variables.buttonDefaultwidth,
                trailer: const Icon(
                  Icons.shop_two,
                  color: AppColors.white,
                ),
                leading: const Icon(
                  Icons.family_restroom,
                  color: Colors.white,
                ),
                buttonText: "twoOptionsDialog",
                onPressed: () {
                  AppDialog(
                    context: context,
                    dialogTitle: "hello",
                    dialogContent: "dialogContent",
                  ).showTwoOptionsDialog();
                }),
            const SizedBox(
              height: Variables.double30,
            ),
            CustomizedButton(
              textColor: Colors.red,
              backgroundColor: Colors.white,
              borderColor: Colors.red,
              borderRadius: Variables.double20,
              width: Variables.double110,
              fontSize: Variables.double15,
              fontWeight: CustomTextWeight.boldFont,
              buttonText: "snackBar",
              onPressed: () {
                AppSnackBar(
                  context: context,
                  message: "hello world",
                  isError: false,
                ).showAppSnackBar();
              },
            ),
            const SizedBox(
              height: Variables.double24,
            ),
            const  LinearCircularProgressIndicator(
                isLinearProgressIndicator: false),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(Variables.eight),
        child: CustomizedButton(
          height: Variables.double60,
          width: Variables.double160,
          borderRadius: Variables.double30,
          elevation: Variables.ten,
          onPressed: () {
            const AppOverlayBuilder().openOverlayUI(context: context);
          },
          buttonText: "overlay",
        ),
      ),
    );
  }
}
