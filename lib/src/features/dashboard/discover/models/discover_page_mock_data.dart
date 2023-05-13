
import 'package:vmodel/src/features/dashboard/discover/map/map-search_screen.dart';
import 'package:vmodel/src/features/dashboard/discover/models/mock_data.dart';
import 'package:vmodel/src/features/dashboard/discover/views/discover_photo_search/discover_photo_search.dart';
import 'package:vmodel/src/features/dashboard/discover/views/discover_user_search.dart/views/dis_search_main_screen.dart';
import 'package:vmodel/src/features/dashboard/discover/views/sub_screens/view_all.dart';
import 'package:vmodel/src/features/dashboard/discover/widget/category_button.dart';
import 'package:vmodel/src/features/dashboard/discover/widget/discover_sub_list.dart';
import 'package:vmodel/src/features/dashboard/discover/widget/vmagazine_row.dart';
// import 'package:vmodel/src/features/vmagazine/views/vMagzine_view.dart';
import 'package:vmodel/src/res/icons.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/rend_paint/render_svg.dart';
import 'package:vmodel/src/shared/text_fields/primary_text_field.dart';
import 'package:vmodel/src/vmodel.dart';

import '../../../settings/views/verification_setting.dart';
import '../../../vmagazine/views/vmagzine_view.dart';

class DiscoverDummyList extends StatefulWidget {
  const DiscoverDummyList({super.key});

  @override
  State<DiscoverDummyList> createState() => _DiscoverDummyListState();
}

class _DiscoverDummyListState extends State<DiscoverDummyList> {
   String selectedChip = "Models";
  @override
  Widget build(BuildContext context) {
    

    return ListView(
          shrinkWrap: true,
          children: [
            addVerticalSpacing(0),
            Padding(
              padding: const VWidgetsPagePadding.horizontalSymmetric(18),
              child: VWidgetsPrimaryTextFieldWithTitle(
                hintText: "vicki",
                onTap: () {
                  navigateToRoute(context, const DiscoverUserSearchMainView());
                },
                //!Switching photo functionality with map search till photo search is ready
                prefixIcon: IconButton(
                  onPressed: () {
                    navigateToRoute(context, const MapSearchView());
                  },
                  padding: const EdgeInsets.only(right: 0),
                  icon: const RenderSvgWithoutColor(
                    svgPath: VIcons.directionIcon,
                    svgHeight: 24,
                    svgWidth: 24,
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  padding: const EdgeInsets.only(right: 0),
                  icon: const RenderSvgWithoutColor(
                    svgPath: VIcons.searchNormal,
                    svgHeight: 24,
                    svgWidth: 24,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 56,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return CategoryButton(
                    isSelected: selectedChip == categories[index],
                    text: categories[index],
                    onPressed: () =>
                        setState(() => selectedChip = categories[index]),
                  );
                },
              ),
            ),
            DiscoverSubList(
              title: 'Recently Viewed',
              items: recentlyViewed,
              route: ViewAllScreen(
                title: "Recently Viewed",
                dataList: recentlyViewed,
              ),
            ),
            DiscoverSubList(
              title: 'Most Popular',
              items: mostPopular,
              route: ViewAllScreen(
                title: "Most Popular",
                dataList: mostPopular,
              ),
            ),
            GestureDetector(
              onTap: () {
                navigateToRoute(context, const VMagazineView());
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 10),
                child: Image.asset(
                  'assets/images/models/vmagazine.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 150,
                ),
              ),
            ),
            DiscoverSubList(
              title: 'Local',
              items: locals,
              route: ViewAllScreen(
                title: "Local",
                dataList: locals,
              ),
            ),
            const VMagazineRow(
              image: 'assets/images/models/listTile_3.png',
              title: "How to create the perfect looking VModel Portfolio",
              subTitle:
                  "Read our article on “How to perfect your profile before clients see it”",
            ),
            DiscoverSubList(
                title: 'Browse Pet Models',
                items: petModels,
                route: ViewAllScreen(
                  title: "Browse Pet Models",
                  dataList: petModels,
                )),
            DiscoverSubList(
              title: 'Photographers',
              items: photoModels,
              eachUserHasProfile: true,
              route: ViewAllScreen(
                title: "Photographers",
                dataList: photoModels,
              ),
            ),
    //
            GestureDetector(
              child:const VMagazineRow(
                image: 'assets/images/models/listTile_1.png',
                title: "Verification Simplified!",
                subTitle:
                "Check out the guide on how to correctly verify your profile",
              ),
              onTap: (){
                navigateToRoute(context, const VerificationSettingPage());
              },
            ),
            const VMagazineRow(
              image: 'assets/images/models/listTile_2.png',
              title: "How to create a verified pet’s profile",
              subTitle:
                  "Check out the guide on how to correctly verify your profile",
            ),
          ],
        );
  }
}