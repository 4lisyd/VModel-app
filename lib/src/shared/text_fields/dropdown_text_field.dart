import '../../res/colors.dart';
import '../../vmodel.dart';

class VWidgetsDropDownTextField<T> extends StatelessWidget {
  final String? fieldLabel;
  final String hintText;
  final List<T> options;
  final dynamic value;
  final String Function(T)? getLabel;
  final Function(T)? onChanged;
  // final VoidCallback? onChanged;
  final VoidCallback? onTap;
  final int? maxLength;
  final double? minWidth;
  final Widget? suffix;
  final Widget? prefix;
  final String? prefixText;
  final bool? havePrefix;

  const VWidgetsDropDownTextField({
    this.fieldLabel,
    this.hintText = 'Please select an Option',
    this.options = const [],
    this.getLabel,
    this.value,
    this.onChanged,
    this.onTap,
    this.maxLength,
    this.minWidth,
    this.suffix,
    super.key,
    this.havePrefix = false,
    this.prefix,
    this.prefixText,
  });

  @override
  Widget build(BuildContext context) {
    return havePrefix == true
        ? SizedBox(
            width: minWidth ?? 60.0.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   fieldLabel ?? "",
                //   style: Theme.of(context).textTheme.displayMedium!.copyWith(
                //               fontWeight: FontWeight.w600,
                //               color: Theme.of(context).primaryColor.withOpacity(1),
                //             ),
                // ),
                // SizedBox(height: 0.5.h),
                SizedBox(
                  height: maxLength != null ? 5.h : 5.h,
                  width: minWidth ?? 100.0.w,
                  child: FormField<T>(
                    builder: (FormFieldState<T> state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          // suffixIcon: suffix ?? const Icon(Icons.arrow_drop_down_rounded),
                          isDense: false,
                          prefixIcon: prefix,
                          prefixText: prefixText,
                          prefixStyle: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: VmodelColors.text3,
                              ),
                          contentPadding:
                              const EdgeInsets.fromLTRB(10, 0, 10, 0),

                          labelText: hintText,
                          labelStyle: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.5),
                                fontSize: 12.sp,
                              ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(1),
                                  width: 1.5),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8))),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.4),
                                  width: 1.5),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(7.5))),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.4),
                                  width: 1.5),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(7.5))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.4),
                                  width: 1.5),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(7.5))),
                          focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: VmodelColors.bottomNavIndicatiorColor,
                                  width: 1.5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7.5))),
                          errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: VmodelColors.bottomNavIndicatiorColor,
                                  width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7.5))),
                        ),
                        isEmpty: value == null || value == '',
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<T>(
                            iconSize: 32,
                            iconDisabledColor: VmodelColors.greyColor,
                            iconEnabledColor: VmodelColors.primaryColor,
                            icon: suffix ??
                                const Icon(Icons.arrow_drop_down_rounded),
                            borderRadius: BorderRadius.circular(12),
                            value: value,
                            isDense: true,
                            onTap: onTap,
                            onChanged: (text) {
                              if (onChanged != null) onChanged!(text as T);
                            },
                            items: options.map((T value) {
                              return DropdownMenuItem<T>(
                                value: value,
                                alignment: AlignmentDirectional.centerStart,
                                child: Text(
                                  value.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(1),
                                      ),
                                ),
                                // Divider(),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        : SizedBox(
            width: minWidth ?? 100.0.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fieldLabel ?? "",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor.withOpacity(1),
                      ),
                ),
                SizedBox(height: 0.5.h),
                SizedBox(
                  height: maxLength != null ? 5.h : 5.h,
                  width: minWidth ?? 100.0.w,
                  child: FormField<T>(
                    builder: (FormFieldState<T> state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          // suffixIcon: suffix ?? const Icon(Icons.arrow_drop_down_rounded),
                          isDense: false,
                          prefixIcon: prefix,
                          contentPadding:
                              const EdgeInsets.fromLTRB(10, 0, 10, 0),

                          labelText: hintText,
                          labelStyle: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.5),
                                fontSize: 12.sp,
                              ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(1),
                                  width: 1.5),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8))),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.4),
                                  width: 1.5),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(7.5))),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.4),
                                  width: 1.5),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(7.5))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.4),
                                  width: 1.5),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(7.5))),
                          focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: VmodelColors.bottomNavIndicatiorColor,
                                  width: 1.5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7.5))),
                          errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: VmodelColors.bottomNavIndicatiorColor,
                                  width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7.5))),
                        ),
                        isEmpty: value == null || value == '',
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<T>(
                            iconSize: 32,
                            iconDisabledColor: VmodelColors.greyColor,
                            iconEnabledColor: VmodelColors.primaryColor,
                            icon: suffix ??
                                const Icon(Icons.arrow_drop_down_rounded),
                            borderRadius: BorderRadius.circular(12),
                            value: value,
                            isDense: true,
                            onTap: onTap,
                            onChanged: (text) {
                              if (onChanged != null) onChanged!(text as T);
                            },
                            items: options.map((T value) {
                              return DropdownMenuItem<T>(
                                value: value,
                                alignment: AlignmentDirectional.centerStart,
                                child: Text(
                                  value.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(1),
                                      ),
                                ),
                                // Divider(),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
  }
}
