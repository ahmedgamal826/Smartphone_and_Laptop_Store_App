import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/widgets.dart';

void showAwesomeDialog(BuildContext context) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.success,
    title: 'Added Successfully',
    btnOkOnPress: () {
      Navigator.pop(context);
    },
  ).show();
}
