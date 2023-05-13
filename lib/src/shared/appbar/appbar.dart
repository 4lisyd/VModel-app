import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/vmodel.dart';

class VWidgetsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? appbarTitle;
  final Widget? leadingIcon;
  final List<Widget>? trailingIcon;
  final Color? backgroundColor;
  final double? appBarHeight;
  final double? leadingWidth;
  final TextStyle? style;
  final Widget? optionalTitle;
  final double? elevation;

  const VWidgetsAppBar(
      {this.appbarTitle,
      this.leadingIcon,
      this.trailingIcon,
      this.backgroundColor,
      this.appBarHeight,
      super.key,
      this.leadingWidth,
      this.style,
      this.elevation,
      this.optionalTitle
      });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: leadingIcon,
      leadingWidth: leadingWidth,
      elevation: elevation ?? 0.5,
      backgroundColor: backgroundColor ?? VmodelColors.background,
      title: Padding(
        padding: const EdgeInsets.only(top: 18),
        child: appbarTitle!.isNotEmpty
            ? Text(
                appbarTitle!,
                style: style ??
                    VModelTypography1.normalTextStyle.copyWith(
                      color: VmodelColors.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 13.sp,
                    ),
              )
            : optionalTitle,
      ),
      actions: trailingIcon,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight ?? kToolbarHeight);
}
