import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:vmodel/src/features/dashboard/dash/dashboard_ui.dart';
import 'package:vmodel/src/features/dashboard/menu_settings/menu_sheet.dart';
import 'package:vmodel/src/vmodel.dart';

void dismissKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

void popSheet(BuildContext context) {
  Navigator.of(context).pop();
}

void closeDialog(BuildContext context) {
  Navigator.of(context, rootNavigator: true).pop();
}

displayBottomSheet(context, Widget bottomSheet) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      // elevation: 0,
      // barrierColor: Colors.black.withAlpha(1),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),
      builder: (context) => Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: GestureDetector(onTap: dismissKeyboard, child: bottomSheet)));
}

navigateToRoute(BuildContext context, dynamic routeClass) {
  Navigator.push(
      context,
      Platform.isAndroid
          ? MaterialPageRoute(builder: (context) => routeClass)
          : CupertinoPageRoute(builder: (context) => routeClass));
}

void navigateAndReplaceRoute(BuildContext? context, dynamic routeClass) {
  Navigator.pushReplacement(
      context!,
      Platform.isAndroid
          ? MaterialPageRoute(builder: (context) => routeClass)
          : CupertinoPageRoute(builder: (context) => routeClass));
}

void navigateAndRemoveUntilRoute(BuildContext? context, dynamic routeClass) {
  Navigator.pushAndRemoveUntil(
      context!,
      Platform.isAndroid
          ? MaterialPageRoute(builder: (context) => routeClass)
          : CupertinoPageRoute(builder: (context) => routeClass),
      (route) => false);
}

goBackHome(BuildContext context) {
  Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
      Platform.isAndroid
          ? MaterialPageRoute(builder: (context) => const DashBoardView())
          : CupertinoPageRoute(builder: (context) => const DashBoardView()),
      (route) => false);
}

goBack(BuildContext context) {
  Navigator.of(context).pop();
}

openVModelMenu(BuildContext context, {bool isNotTabScreen = false}) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    useRootNavigator: true,
    context: context,
    isScrollControlled: true,
    enableDrag: true,
    anchorPoint: const Offset(0, 200),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
    builder: ((context) => MenuSheet(
          isNotTabSreen: isNotTabScreen,
        )),
  );
}
