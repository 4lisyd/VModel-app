import 'package:vmodel/src/res/icons.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/buttons/primary_button.dart';
import 'package:vmodel/src/shared/rend_paint/render_svg.dart';
import 'package:vmodel/src/vmodel.dart';

class VWidgetsProfileButtons extends StatelessWidget {
  final String? largeButtonTitle;
  final String? smallButtonOneTitle;
  final String? smallButtonTwoTitle;
  final VoidCallback? bookNowOnPressed;
  final VoidCallback? polaroidOrTopPicksOnPressed;
  final VoidCallback? messagesOnPressed;
  final VoidCallback? instagramOnPressed;
  final VoidCallback? instaLineOnPressed;
  final VoidCallback? connectOnPressed;
  final String? connectTitle;
  final bool connected;

  const VWidgetsProfileButtons(
      {required this.largeButtonTitle,
      required this.bookNowOnPressed,
      required this.smallButtonOneTitle,
      required this.smallButtonTwoTitle,
      required this.polaroidOrTopPicksOnPressed,
      required this.messagesOnPressed,
      required this.instagramOnPressed,
      required this.instaLineOnPressed,
      required this.connectOnPressed,
      required this.connectTitle,
      required this.connected ,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: VWidgetsPrimaryButton(
                onPressed: bookNowOnPressed,
                buttonTitle: largeButtonTitle,
                enableButton: true,
              ),
            ),
            addHorizontalSpacing(8),
            Expanded(
              child: VWidgetsPrimaryButton(
                onPressed: connectOnPressed,
                buttonTitle: connectTitle,
                enableButton: true,
              ),
            ),
          ],
        ),
        addVerticalSpacing(4),
        Row(
          children: [
            Flexible(
              child: VWidgetsPrimaryButton(
                onPressed: polaroidOrTopPicksOnPressed,
                buttonTitle: smallButtonOneTitle,
                enableButton: true,
                buttonColor: VmodelColors.buttonBgColor,
                buttonTitleTextStyle:
                    Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor.withOpacity(1),
                          fontSize: 12.sp,
                        ),
              ),
            ),
            addHorizontalSpacing(6),
            Flexible(
              child: VWidgetsPrimaryButton(
                onPressed: messagesOnPressed,
                buttonTitle: smallButtonTwoTitle,
                enableButton: connected,
                buttonColor: VmodelColors.buttonBgColor,
                buttonTitleTextStyle:
                    Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor.withOpacity(1),
                          fontSize: 12.sp,
                        ),
              ),
            ),
            addHorizontalSpacing(6),
            SizedBox(
              width: 35,
              height: 35,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: VmodelColors.buttonBgColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    padding: EdgeInsets.zero),
                onPressed: instagramOnPressed,
                child: const RenderSvg(
                  svgPath: VIcons.instagramIcon,
                ),
              ),
            ),
            addHorizontalSpacing(6),
            SizedBox(
              width: 35,
              height: 35,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: VmodelColors.buttonBgColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    padding: EdgeInsets.zero),
                onPressed: instaLineOnPressed,
                child: const RenderSvg(
                  svgPath: VIcons.instalineIcon,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
