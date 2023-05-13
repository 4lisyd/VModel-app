import 'package:vmodel/src/res/icons.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/rend_paint/render_svg.dart';
import 'package:vmodel/src/vmodel.dart';

class VWidgetDiscoverUserTile extends StatelessWidget {
  const VWidgetDiscoverUserTile({
    super.key,
    required this.userName,
    required this.userNickName,
    required this.userImage,
    required this.onPressedRemove,
    required this.shouldHaveRemoveButton,
    required this.onPressedProfile,
  });
  final String? userName;
  final String? userNickName;
  final String? userImage;
  final VoidCallback? onPressedRemove;
  final VoidCallback? onPressedProfile;
  final bool shouldHaveRemoveButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: onPressedProfile,
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: VmodelColors.primaryColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100),
                      ),
                      image: DecorationImage(
                        image: AssetImage(userImage!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  addHorizontalSpacing(10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userNickName!,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).primaryColor,
                                fontSize: 12.sp),
                      ),
                      addVerticalSpacing(2),
                      Text(
                        userName!,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.3),
                                fontSize: 10.sp),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (shouldHaveRemoveButton == true)
              IconButton(
                  onPressed: onPressedRemove,
                  icon: const RenderSvg(svgPath: VIcons.cancelTile))
          ],
        ),
        addVerticalSpacing(15),
      ],
    );
  }
}
