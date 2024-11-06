import 'package:flutter/material.dart';
import 'package:instagram/src/utils/colors/app_colors.dart';

showAlertDialog(
    {required BuildContext context,
    required String title,
    required String content}) {
  // set up the button
  Widget okButton = TextButton(
    child: Text(
      "OK",
      style: TextStyle(color: AppColors.blackColor),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    // backgroundColor: AppColors.greyColor,
    title: Text(title),
    content: Text(content),
    actionsAlignment: MainAxisAlignment.center,
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
