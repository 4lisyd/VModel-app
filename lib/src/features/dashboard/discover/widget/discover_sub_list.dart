import 'package:vmodel/src/core/utils/enum/profile_types.dart';
import 'package:vmodel/src/features/dashboard/discover/tapandhold/tap_and_hold.dart';
import 'package:vmodel/src/features/dashboard/profile/view/profile_main_view.dart';
import 'package:vmodel/src/res/icons.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/rend_paint/render_svg.dart';
import 'package:vmodel/src/vmodel.dart';

import '../models/discover_item.dart';
import 'discover_sub_item.dart';

class DiscoverSubList extends StatelessWidget {
  final String title;
  final List<DiscoverItemObject> items;
  final bool? eachUserHasProfile;
  final Widget? route;
  const DiscoverSubList(
      {Key? key,
      required this.title,
      required this.items,
      this.eachUserHasProfile = false,
      this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        addVerticalSpacing(10),
        GestureDetector(
          onTap: () {
            route != null ? navigateToRoute(context, route) : () {};
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: VmodelColors.mainColor,
                  ),
                ),
                const RenderSvg(
                  svgPath: VIcons.forwardIcon,
                  svgWidth: 12.5,
                  svgHeight: 12.5,
                ),
              ],
            ),
          ),
        ),
        addVerticalSpacing(9),
        SizedBox(
          height: 198,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              // itemCount: items.length,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return DiscoverSubItem(
                  onTap: () {
                    if (eachUserHasProfile == true) {
                      // navigateToRoute(
                      //     context,
                      //     PhotographersPortfolioMainView(
                      //       imgLink: items[index].image.toString(),
                      //     ));
                      navigateToRoute(
                          context,
                          const ProfileMainView(
                            profileTypeEnumConstructor:
                                ProfileTypeEnum.photographer,
                          ));
                    }
                  },
                  onLongPress: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return TapAndHold(item: items[index]);
                        });
                  },
                  item: items[index],
                );
              }),
        ),
        addVerticalSpacing(5),
      ],
    );
  }
}
