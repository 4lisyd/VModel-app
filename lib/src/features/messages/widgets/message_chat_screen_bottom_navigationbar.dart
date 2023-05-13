import 'package:flutter/services.dart';
import 'package:vmodel/src/res/icons.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/rend_paint/render_svg.dart';
import 'package:vmodel/src/vmodel.dart';

class VWidgetsTextFieldWithMultipleIcons extends StatelessWidget {
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final String hintText;
  final TextAlign? textAlign;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final Function(String?)? onSaved;
  final Function(String?)? onFieldSubmitted;
  final VoidCallback? onPressedSuffixFirst;
  final VoidCallback? onPressedSuffixSecond;
  final VoidCallback? onPressedSuffixThird;
  final bool? isTyping;
  final Widget? isTypingWidget;
  const VWidgetsTextFieldWithMultipleIcons(
      {super.key,
      this.inputFormatters,
      this.controller,
      this.prefixIcon,
      required this.hintText,
      this.validator,
      this.onChanged,
      this.onSaved,
      this.onFieldSubmitted,
      this.textAlign,
      this.isTyping = false,
      this.isTypingWidget,
      required this.onPressedSuffixFirst,
      required this.onPressedSuffixSecond,
      required this.onPressedSuffixThird});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: 1,
      maxLines: null,
      validator: validator,
      inputFormatters: inputFormatters,
      controller: controller,
      onSaved: onSaved,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      style: Theme.of(context).textTheme.displayMedium,
      decoration: InputDecoration(
        fillColor: VmodelColors.white,
        focusColor: VmodelColors.white,
        hoverColor: VmodelColors.white,
        hintText: hintText,
        prefixIcon: const Padding(
          padding: VWidgetsPagePadding.horizontalSymmetric(10),
          child: RenderSvg(
            svgPath: VIcons.vmodelLogo,
            svgHeight: 24,
            svgWidth: 24,
          ),
        ),
        //make prefix icon compatible with light/dark dynamic theming

        suffixIcon: isTyping == true
            ? isTypingWidget
            : Padding(
                padding: const VWidgetsPagePadding.onlyRight(10),
                child: SizedBox(
                    width: 80,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: IconButton(
                            alignment: AlignmentDirectional.centerStart,
                            padding: const EdgeInsets.all(0),
                            onPressed: onPressedSuffixFirst,
                            icon: const RenderSvg(
                              svgPath: VIcons.microphone,
                              svgHeight: 22,
                              svgWidth: 22,
                            ),
                          ),
                        ),
                        addHorizontalSpacing(5),
                        Flexible(
                          child: IconButton(
                              alignment: AlignmentDirectional.centerStart,
                              padding: const EdgeInsets.all(0),
                              onPressed: onPressedSuffixSecond,
                              icon: const RenderSvg(
                                svgPath: VIcons.gallery,
                                svgHeight: 22,
                                svgWidth: 22,
                              )),
                        ),
                        addHorizontalSpacing(5),
                        Flexible(
                          child: IconButton(
                              alignment: AlignmentDirectional.centerStart,
                              padding: const EdgeInsets.all(0),
                              onPressed: onPressedSuffixThird,
                              icon: const RenderSvg(
                                svgPath: VIcons.addCircle,
                                svgHeight: 22,
                                svgWidth: 22,
                              )),
                        ),
                      ],
                    )),
              ),
        //padding for hint/text inside the field
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        //Changed hintstyle opacity as it is with 0.5 throughout the app
        hintStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: Theme.of(context).primaryColor.withOpacity(0.5),
              fontSize: 12.sp,
            ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: VmodelColors.borderColor,
          ),
          borderRadius: BorderRadius.circular(7.5),
        ),
        //made box height 40 px default as in figma designs all have 40 pc height
        constraints: const BoxConstraints(maxHeight: 40),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: VmodelColors.borderColor,
          ),
          borderRadius: BorderRadius.circular(7.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.5),
          borderSide: BorderSide(
            color: VmodelColors.buttonColor,
          ),
        ),
      ),
    );
  }
}
