import 'package:flutter/material.dart';
import 'package:vmodel/src/core/routing/navigator_1.0.dart';
import 'package:vmodel/src/core/utils/shared.dart';
import 'package:vmodel/src/features/dashboard/discover/models/mock_data.dart';
import 'package:vmodel/src/features/dashboard/discover/widget/category_button.dart';
import 'package:vmodel/src/features/dashboard/feed/data/field_mock_data.dart';
import 'package:vmodel/src/features/dashboard/feed/views/feed_explore_search.dart';
import 'package:vmodel/src/res/colors.dart';
import 'package:vmodel/src/res/icons.dart';
import 'package:vmodel/src/shared/rend_paint/render_svg.dart';
import 'package:vmodel/src/shared/text_fields/primary_text_field.dart';

class FeedExplore extends StatefulWidget {
  const FeedExplore({Key? key}) : super(key: key);

  @override
  State<FeedExplore> createState() => _FeedExploreState();
}

class _FeedExploreState extends State<FeedExplore> {
  String selectedChip = "Model";

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const VWidgetsPagePadding.horizontalSymmetric(18),
            child: VWidgetsPrimaryTextFieldWithTitle(
              label: "",
              hintText: "Vicki",
              suffixIcon: const Padding(
                padding: EdgeInsets.all(8.0),
                child: RenderSvgWithoutColor(
                  svgPath: VIcons.searchNormal,
                  svgHeight: 10,
                  svgWidth: 22,
                ),
              ),
              onTap: () {
                navigateToRoute(context, const FeedExploreSearchView());
              },
            ),
          ),
          SizedBox(
            height: 56,
            child: ListView.builder(
              shrinkWrap: true,
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
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1 / 1.4,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  crossAxisCount: 2),
              // itemCount: imagesListTwo.length,
              itemBuilder: (BuildContext ctx, index) {
                return 
                  Image.asset(
                      index < imagesList.length
                          ? imagesList[index]
                          : imagesListTwo[0],
                      width: 80.0,
                      fit: BoxFit.cover,
                   
                  
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
