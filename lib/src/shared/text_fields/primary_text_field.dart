import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:vmodel/src/res/res.dart';

class VWidgetsPrimaryTextFieldWithTitle extends StatelessWidget {
  final String? label;
  final String? initialValue;
  final int? minLines;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? hintText;
  final TextInputFormatter? formatter;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final Function()? onTap;
  final int? maxLength;
  final TextEditingController? controller;
  final dynamic validator;
  final bool shouldReadOnly;
  final double? minWidth;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? labelStyle;
  final bool enabled;
  final TextStyle? hintStyle;
  final FocusNode? focusNode;
  final bool? autofocus;

  const VWidgetsPrimaryTextFieldWithTitle({
    super.key,
    this.label,
    this.minLines,
    this.onChanged,
    this.onTap,
    this.keyboardType,
    this.initialValue,
    this.formatter,
    this.onSaved,
    this.obscureText = false,
    this.hintText,
    this.maxLength,
    this.controller,
    this.validator,
    this.shouldReadOnly = false,
    trailing,
    this.suffixIcon,
    this.enabled = true,
    this.minWidth,
    this.prefixIcon,
    this.labelStyle,
    this.hintStyle,
    this.focusNode,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: minWidth ?? 100.0.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label ?? "",
            style: labelStyle ??
                Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor.withOpacity(1),
                    ),
          ),
          SizedBox(height: 0.5.h),
          SizedBox(
            height: maxLength != null ? 6.h : 6.h,
            width: minWidth ?? 100.0.w,
            child: TextFormField(
              initialValue: initialValue,
              autofocus: autofocus!,
              focusNode: focusNode,
              cursorHeight: 11,
              autocorrect: false,
              enableSuggestions: false,
              minLines: minLines ?? 1,
              controller: controller,
              maxLength: maxLength,
              onSaved: onSaved,
              enabled: enabled,
              onTap: onTap,
              onChanged: (text) {
                if (onChanged != null) onChanged!(text);
              },
              cursorColor: Theme.of(context).primaryColor,
              keyboardType: keyboardType,
              obscureText: obscureText,
              inputFormatters: [
                formatter ?? FilteringTextInputFormatter.singleLineFormatter
              ],
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validator,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    decoration: TextDecoration.none,
                    color: Theme.of(context).primaryColor.withOpacity(1),
                    fontSize: 12.sp,
                  ),
              readOnly: shouldReadOnly,
              decoration: InputDecoration(
                  isCollapsed: true,
                  suffixIcon: suffixIcon,
                  prefixIcon: prefixIcon,
                  suffixStyle:
                      Theme.of(context).textTheme.displayMedium!.copyWith(
                            color: VmodelColors.boldGreyText,
                            fontWeight: FontWeight.w700,
                            fontSize: 12.sp,
                          ),
                  hintText: hintText,
                  hintStyle: hintStyle ??
                      Theme.of(context).textTheme.displayMedium!.copyWith(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5),
                          fontSize: 12.sp,
                          height: 1.7),
                  contentPadding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor.withOpacity(1),
                          width: 1.5),
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.4),
                          width: 1.5),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(7.5))),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.4),
                          width: 1.5),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(7.5))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.4),
                          width: 1.5),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(7.5))),
                  focusedErrorBorder: const OutlineInputBorder(borderSide: BorderSide(color: VmodelColors.bottomNavIndicatiorColor, width: 1.5), borderRadius: BorderRadius.all(Radius.circular(7.5))),
                  errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: VmodelColors.bottomNavIndicatiorColor, width: 1.0), borderRadius: BorderRadius.all(Radius.circular(7.5)))
                  ),
            ),
          )
        ],
      ),
    );
  }
}
