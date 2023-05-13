import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vmodel/src/res/res.dart';

class VWidgetsPrimaryButton extends StatelessWidget {
  final String? buttonTitle;
  final Function()? onPressed;
  final bool? enableButton;
  final double? butttonWidth;
  final double? buttonHeight;
  final TextStyle? buttonTitleTextStyle;
  final Color? buttonColor;
  final Color? splashColor;
  final double? borderRadius;
  const VWidgetsPrimaryButton({
    super.key,
    required this.onPressed,
    this.buttonTitle,
    this.enableButton,
    this.buttonHeight,
    this.buttonTitleTextStyle,
    this.splashColor,
    this.buttonColor,
    this.butttonWidth,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: enableButton == true ? onPressed : null,
      disabledColor: VmodelColors.greyColor.withOpacity(0.2),
      disabledTextColor: Theme.of(context).primaryColor.withOpacity(0.2),
      elevation: 0,
      minWidth: butttonWidth ?? MediaQuery.of(context).size.width / 1,
      height: buttonHeight ?? 40,
      textColor: enableButton == true
          ? Theme.of(context).buttonTheme.colorScheme!.onPrimary
          : Theme.of(context).primaryColor.withOpacity(0.2),
      color: enableButton == true
          ? buttonColor ?? Theme.of(context).primaryColor
          : VmodelColors.disabledButonColor.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius ?? 8),
        ),
      ),
      splashColor: splashColor,
      child: Text(
        buttonTitle ?? "",
        style: enableButton == true
            ? buttonTitleTextStyle ??
                Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: enableButton == true
                          ? Theme.of(context).buttonTheme.colorScheme!.onPrimary
                          : Theme.of(context).primaryColor.withOpacity(0.2),
                      fontWeight: FontWeight.normal,
                      fontSize: 12.sp,
                    )
            : Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: Theme.of(context).primaryColor.withOpacity(0.2),
                  fontWeight: FontWeight.normal,
                  fontSize: 12.sp,
                ),
      ),
    );
  }
}
